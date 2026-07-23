#!/usr/bin/env bash
set -u

SCRIPT_NAME="$(basename "$0")"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

TARGET_DIR="$(pwd)"
GLOBAL_MODE=0
DRY_RUN=0
OVERWRITE=0
BACKUP=0
YES=0

CREATED=0
UPDATED=0
SKIPPED=0
CONFLICTS=0
ERRORS=0
PLAN_LINES=()
CONFLICT_LINES=()
ACTION_SOURCES=()
ACTION_DESTS=()
ACTION_TYPES=()

usage() {
  cat <<'EOF'
Usage: install.sh [options]

Options:
  --target <path>  Target repository. Defaults to current directory.
  --global         Install global rule to ~/.codex/AGENTS.md.
  --dry-run        Print planned actions without writing files.
  --overwrite      Overwrite conflicting files.
  --backup         Back up conflicting files before writing.
  --yes            Do not ask for interactive confirmation.
  --help           Show this help.

Default behavior never overwrites files with different content.
EOF
}

log() {
  printf '%s\n' "$*"
}

fail() {
  printf 'ERROR: %s\n' "$*" >&2
  exit 1
}

record_plan() {
  PLAN_LINES+=("$1")
}

same_file_content() {
  local source="$1"
  local dest="$2"
  cmp -s "$source" "$dest"
}

timestamp() {
  date '+%Y%m%d%H%M%S'
}

ensure_source_file() {
  local source="$1"
  [ -f "$source" ] || fail "Missing source file: $source"
}

ensure_target_dir() {
  local target="$1"
  [ -d "$target" ] || {
    printf 'ERROR: Target does not exist or is not a directory: %s\n' "$target" >&2
    exit 2
  }
}

git_status_if_available() {
  local dir="$1"
  if git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    log "Git status for $dir:"
    git -C "$dir" status --short
  else
    log "Git status skipped: target is not a Git repository."
  fi
}

write_file() {
  local source="$1"
  local dest="$2"
  local action="$3"

  if [ "$DRY_RUN" -eq 1 ]; then
    return 0
  fi

  mkdir -p "$(dirname "$dest")" || return 3

  case "$action" in
    create|overwrite)
      cp "$source" "$dest" || return 3
      ;;
    backup)
      local backup_path
      backup_path="${dest}.bak.$(timestamp)"
      cp "$dest" "$backup_path" || return 3
      cp "$source" "$dest" || return 3
      ;;
    skip)
      ;;
    *)
      return 1
      ;;
  esac
}

queue_action() {
  ACTION_SOURCES+=("$1")
  ACTION_DESTS+=("$2")
  ACTION_TYPES+=("$3")
}

apply_actions() {
  local i
  for i in "${!ACTION_SOURCES[@]}"; do
    write_file "${ACTION_SOURCES[$i]}" "${ACTION_DESTS[$i]}" "${ACTION_TYPES[$i]}" || {
      printf 'ERROR: Failed to write %s\n' "${ACTION_DESTS[$i]}" >&2
      ERRORS=$((ERRORS + 1))
    }
  done
}

plan_file() {
  local source="$1"
  local dest="$2"
  local label="$3"

  ensure_source_file "$source"

  if [ ! -e "$dest" ]; then
    record_plan "create   $label -> $dest"
    queue_action "$source" "$dest" "create"
    CREATED=$((CREATED + 1))
    return 0
  fi

  if [ ! -f "$dest" ]; then
    record_plan "conflict $label -> $dest (destination exists and is not a file)"
    CONFLICT_LINES+=("$dest")
    CONFLICTS=$((CONFLICTS + 1))
    return 1
  fi

  if same_file_content "$source" "$dest"; then
    record_plan "skip     $label -> $dest (unchanged)"
    SKIPPED=$((SKIPPED + 1))
    return 0
  fi

  if [ "$OVERWRITE" -eq 1 ]; then
    record_plan "overwrite $label -> $dest"
    queue_action "$source" "$dest" "overwrite"
    UPDATED=$((UPDATED + 1))
    return 0
  fi

  if [ "$BACKUP" -eq 1 ]; then
    record_plan "backup   $label -> $dest"
    queue_action "$source" "$dest" "backup"
    UPDATED=$((UPDATED + 1))
    return 0
  fi

  record_plan "conflict $label -> $dest"
  CONFLICT_LINES+=("$dest")
  CONFLICTS=$((CONFLICTS + 1))
  return 1
}

collect_project_files() {
  local source_root="$PROJECT_ROOT/starter"
  [ -d "$source_root" ] || fail "Missing starter directory: $source_root"

  while IFS= read -r source; do
    local rel
    rel="${source#$source_root/}"
    PROJECT_SOURCES+=("$source")
    PROJECT_DESTS+=("$TARGET_DIR/$rel")
    PROJECT_LABELS+=("$rel")
  done < <(find "$source_root" -type f | sort)
}

confirm_if_needed() {
  if [ "$YES" -eq 1 ] || [ "$DRY_RUN" -eq 1 ]; then
    return 0
  fi

  printf 'Proceed with installation? [y/N] '
  local answer
  read -r answer
  case "$answer" in
    y|Y|yes|YES) return 0 ;;
    *) log "Installation cancelled."; exit 1 ;;
  esac
}

print_plan() {
  log "Plan:"
  if [ "${#PLAN_LINES[@]}" -eq 0 ]; then
    log "  No actions planned."
    return
  fi

  local line
  for line in "${PLAN_LINES[@]}"; do
    log "  $line"
  done
}

print_summary() {
  log "Summary:"
  log "  created:   $CREATED"
  log "  updated:   $UPDATED"
  log "  skipped:   $SKIPPED"
  log "  conflicts: $CONFLICTS"
}

parse_args() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --target)
        [ "$#" -ge 2 ] || fail "--target requires a path"
        TARGET_DIR="$2"
        shift 2
        ;;
      --global)
        GLOBAL_MODE=1
        shift
        ;;
      --dry-run)
        DRY_RUN=1
        shift
        ;;
      --overwrite)
        OVERWRITE=1
        shift
        ;;
      --backup)
        BACKUP=1
        shift
        ;;
      --yes)
        YES=1
        shift
        ;;
      --help|-h)
        usage
        exit 0
        ;;
      *)
        fail "Unknown option: $1"
        ;;
    esac
  done

  if [ "$OVERWRITE" -eq 1 ] && [ "$BACKUP" -eq 1 ]; then
    fail "--overwrite and --backup cannot be used together"
  fi

  TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd)" || {
    printf 'ERROR: Target does not exist or is not readable: %s\n' "$TARGET_DIR" >&2
    exit 2
  }
}

install_project() {
  ensure_target_dir "$TARGET_DIR"
  git_status_if_available "$TARGET_DIR"

  PROJECT_SOURCES=()
  PROJECT_DESTS=()
  PROJECT_LABELS=()
  collect_project_files

  local i
  for i in "${!PROJECT_SOURCES[@]}"; do
    plan_file "${PROJECT_SOURCES[$i]}" "${PROJECT_DESTS[$i]}" "${PROJECT_LABELS[$i]}" || true
  done
}

install_global() {
  local source="$PROJECT_ROOT/global/AGENTS.md"
  local home_dir="${HOME:-}"
  [ -n "$home_dir" ] || fail "HOME is not set"

  local dest="$home_dir/.codex/AGENTS.md"
  plan_file "$source" "$dest" "global/AGENTS.md" || true
}

main() {
  parse_args "$@"

  log "AI Project OS installer"
  log "Source: $PROJECT_ROOT"
  log "Target: $TARGET_DIR"
  [ "$DRY_RUN" -eq 1 ] && log "Mode: dry-run"

  if [ "$GLOBAL_MODE" -eq 1 ]; then
    install_global
  else
    install_project
  fi

  print_plan

  if [ "$CONFLICTS" -gt 0 ]; then
    log ""
    log "Conflicts:"
    local conflict
    for conflict in "${CONFLICT_LINES[@]}"; do
      log "  $conflict"
    done
    log "Resolve conflicts manually or rerun with --backup or --overwrite."
    print_summary
    exit 1
  fi

  if [ "$DRY_RUN" -eq 1 ]; then
    print_summary
    exit 0
  fi

  confirm_if_needed
  apply_actions
  print_summary

  if [ "$GLOBAL_MODE" -eq 0 ]; then
    git_status_if_available "$TARGET_DIR"
  fi

  [ "$ERRORS" -eq 0 ] || exit 3
}

main "$@"
