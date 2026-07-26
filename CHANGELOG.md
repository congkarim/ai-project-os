# Changelog

Mọi thay đổi đáng chú ý của AI Project OS được ghi trong file này.

Định dạng dựa trên [Keep a Changelog](https://keepachangelog.com/vi/1.1.0/), phiên bản theo [Semantic Versioning](https://semver.org/lang/vi/).

## [1.0.0] - 2026-07-26

### Added

- Bộ khung quản lý dự án: `AGENTS.md` và `.ai/` (context, roadmap, task, checklist, plan, decisions).
- Template `starter/` cho repository mới.
- Mẫu global rule `global/AGENTS.md` cho `~/.codex/AGENTS.md`.
- Thiết kế cài đặt `docs/install-design.md`.
- Script cài đặt `scripts/install.sh` (Linux/macOS) và `scripts/install.ps1` (Windows PowerShell).
- Hành vi mặc định không ghi đè, hỗ trợ dry-run, `--backup` / `--overwrite`.
- Tài liệu hướng dẫn trong `README.md`.
- Ghi chú phát hành `docs/release-v1.0.0.md`.
- File phiên bản `VERSION`.

### Validated

- Cài đặt vào repository mẫu trống.
- Cài đặt an toàn vào repository đang phát triển đã có tài liệu quản lý.
- Tiếp quản phiên coding agent mới chỉ từ tài liệu trong repository.

### Notes

- Git tag và GitHub Release thuộc task `P3-T3`, chưa thực hiện trong đóng gói nội dung này.
- Không phát hành qua npm hoặc pip; phân phối bằng sao chép repository hoặc script cài đặt.

## [0.1.0] - 2026-07-23

### Added

- Baseline tài liệu thủ công sau Phase 0: rule, starter và schema `.ai/`.
- Chưa có script cài đặt và chưa có Git tag phát hành.
