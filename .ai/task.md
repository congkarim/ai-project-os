# Task hiện tại

## ID

`P1-T2`

## Tên task

Viết script cài đặt cho Linux/macOS.

## Phase

Phase 1 - Automation.

## Trạng thái

`DONE`

## Mục tiêu

Viết script Bash để cài AI Project OS vào repository mới hoặc repository đang có trên Linux/macOS theo thiết kế trong `docs/install-design.md`.

## Bối cảnh

`P1-T1` đã chốt thiết kế cài đặt an toàn: mặc định không ghi đè, có dry-run, backup, overwrite, conflict handling và idempotency. `P1-T2` triển khai script Linux/macOS đầu tiên để làm nền cho script PowerShell ở `P1-T3`.

## Phạm vi

- Tạo `scripts/install.sh`.
- Hỗ trợ project mode cài `starter/AGENTS.md` và `starter/.ai/`.
- Hỗ trợ global mode cài `global/AGENTS.md`.
- Hỗ trợ `--target`, `--global`, `--dry-run`, `--overwrite`, `--backup`, `--yes`, `--help`.
- Mặc định không ghi đè file conflict.
- Chạy kiểm thử bằng thư mục tạm trong `/tmp`.
- Cập nhật README, context, roadmap, task, checklist và plan.
- Commit task `P1-T2`.

## Ngoài phạm vi

- Không viết script Windows PowerShell.
- Không cài thật vào repository ngoài test temp.
- Không sửa `~/.codex/AGENTS.md` thật.
- Không cài dependency production.
- Không tạo package release.
- Không gắn Git tag.

## Đầu vào

- `docs/install-design.md`.
- `starter/`.
- `global/AGENTS.md`.
- ADR-004.
- Roadmap Phase 1.

## Đầu ra

- `scripts/install.sh`.
- README có hướng dẫn chạy script Linux/macOS.
- Kết quả kiểm thử script được ghi lại.
- Commit Git cho task `P1-T2`.

## Cách thực hiện đã chốt

Triển khai script Bash không phụ thuộc package ngoài. Script dùng `starter/` làm nguồn project mode, dùng `global/AGENTS.md` cho global mode, mặc định không ghi đè, hỗ trợ dry-run/backup/overwrite và dùng mã thoát theo thiết kế.

## Tiêu chí chấp nhận

- `scripts/install.sh` tồn tại và có shebang Bash.
- `--help` hoạt động.
- Project mode dry-run không ghi file.
- Project mode cài vào thư mục trống.
- Chạy lại project mode không tạo thay đổi mới.
- Conflict mặc định trả lỗi và không ghi đè.
- `--backup` tạo bản sao lưu rồi ghi.
- `--overwrite` ghi đè khi người dùng chọn.
- Global mode dùng `HOME` tạm trong test, không đụng home thật.
- Không dùng `git add .`.
- Markdown cơ bản không lỗi.
- `git diff --check` đạt.
- Commit được tạo với thông điệp `[P1-T2] Viết script cài đặt Linux macOS`.

## Kiểm thử bắt buộc

- Chạy `git status --short` trước khi sửa và trước khi stage.
- Chạy `bash -n scripts/install.sh`.
- Chạy `scripts/install.sh --help`.
- Chạy dry-run project mode vào `/tmp`.
- Cài project mode vào thư mục tạm.
- Chạy lại project mode để kiểm tra idempotency.
- Kiểm tra conflict mặc định.
- Kiểm tra `--backup`.
- Kiểm tra `--overwrite`.
- Kiểm tra global mode với `HOME` tạm.
- Kiểm tra không có file rỗng.
- Kiểm tra Markdown cơ bản.
- Kiểm tra thống nhất `P1-T2` giữa roadmap, task và checklist.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Rủi ro

- Bash trên macOS có thể là phiên bản cũ.
- Test ghi nhầm home thật nếu không set `HOME` tạm.
- Logic conflict có thể không xử lý đúng thư mục đích đã tồn tại.

## Blocker

Chưa có blocker đã xác nhận.

## Kết quả task trước

`P1-T1` đã thiết kế cơ chế cài đặt và commit `0c7e8af606bc4d31b8c74c9b2f1c602699e51839`.

## Task tiếp theo dự kiến

`P1-T3` - Viết script cài đặt cho Windows PowerShell.

## Kết quả thực hiện

Đã viết script cài đặt Linux/macOS:

- Tạo `scripts/install.sh` với shebang Bash và quyền thực thi.
- Hỗ trợ project mode cài `starter/AGENTS.md` và `starter/.ai/`.
- Hỗ trợ global mode cài `global/AGENTS.md`.
- Hỗ trợ `--target`, `--global`, `--dry-run`, `--overwrite`, `--backup`, `--yes`, `--help`.
- Mặc định không ghi đè file conflict.
- Tách bước lập kế hoạch và bước ghi file để dry-run không ghi file và prompt xảy ra trước khi apply.
- Cập nhật README và context với hướng dẫn Linux/macOS.

Kết quả kiểm thử chính:

- `bash -n scripts/install.sh`: đạt.
- `scripts/install.sh --help`: đạt.
- Dry-run project mode vào `/tmp`: không ghi file.
- Project mode cài vào thư mục tạm: tạo đủ `AGENTS.md` và 6 file `.ai/`.
- Chạy lại project mode: báo `skipped: 7`.
- Conflict mặc định: trả mã `1`, báo conflict và không ghi đè.
- `--backup`: tạo `AGENTS.md.bak.<timestamp>` và ghi file nguồn.
- `--overwrite`: ghi file nguồn và không tạo backup.
- Global mode với `HOME` tạm: tạo `~/.codex/AGENTS.md`, chạy lại báo `skipped: 1`.
- `--backup` và `--overwrite` dùng cùng lúc: trả lỗi tham số.
- `rg` kiểm tra script không có `git add`.
- `find ... -size 0`: không có file rỗng.
- Kiểm tra H1 và code fence Markdown: không phát hiện lỗi.
- `rg` trong `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`: thống nhất `P1-T2`.
- `git diff --check`: không phát hiện lỗi whitespace.
- Đã xem lại diff trước khi commit.

## Ngày bắt đầu

2026-07-23.

## Ngày hoàn thành

2026-07-23.
