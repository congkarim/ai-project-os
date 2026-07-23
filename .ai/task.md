# Task hiện tại

## ID

`P1-T3`

## Tên task

Viết script cài đặt cho Windows PowerShell.

## Phase

Phase 1 - Automation.

## Trạng thái

`DONE`

## Mục tiêu

Viết script PowerShell để cài AI Project OS vào repository mới hoặc repository đang có trên Windows, với hành vi tương đương `scripts/install.sh`.

## Bối cảnh

`P1-T2` đã tạo script Bash cho Linux/macOS. `P1-T3` cần tạo script PowerShell theo cùng thiết kế: mặc định không ghi đè, có dry-run, backup, overwrite, conflict handling và idempotency.

## Phạm vi

- Tạo `scripts/install.ps1`.
- Hỗ trợ project mode cài `starter/AGENTS.md` và `starter/.ai/`.
- Hỗ trợ global mode cài `global/AGENTS.md`.
- Hỗ trợ `-Target`, `-Global`, `-DryRun`, `-Overwrite`, `-Backup`, `-Yes`, `-Help`.
- Mặc định không ghi đè file conflict.
- Cập nhật README, context, roadmap, task, checklist và plan.
- Commit task `P1-T3`.

## Ngoài phạm vi

- Không thay đổi script Linux/macOS nếu không cần.
- Không cài thật vào Windows hoặc home thật.
- Không tạo package release.
- Không gắn Git tag.
- Không bắt đầu `P1-T4`.

## Đầu vào

- `docs/install-design.md`.
- `scripts/install.sh`.
- `starter/`.
- `global/AGENTS.md`.
- ADR-004.

## Đầu ra

- `scripts/install.ps1`.
- README có hướng dẫn chạy PowerShell.
- Kết quả kiểm tra được ghi lại.
- Commit Git cho task `P1-T3`.

## Cách thực hiện đã chốt

Triển khai script PowerShell đơn file, bám theo hành vi của `scripts/install.sh` và `docs/install-design.md`. Vì môi trường hiện không có `pwsh`, task này kiểm tra tĩnh thay vì chạy PowerShell thật.

## Tiêu chí chấp nhận

- `scripts/install.ps1` tồn tại.
- Script có `param(...)` và hỗ trợ các tham số bắt buộc.
- Script có project mode, global mode, dry-run, backup, overwrite, conflict handling.
- Script mặc định không ghi đè file conflict.
- Script không có `git add`.
- README có hướng dẫn PowerShell.
- Roadmap, task và checklist thống nhất `P1-T3`.
- Task tiếp theo dự kiến là `P1-T4`.
- Markdown cơ bản không lỗi.
- `git diff --check` đạt.
- Commit được tạo với thông điệp `[P1-T3] Viết script cài đặt PowerShell`.

## Kiểm thử bắt buộc

- Chạy `git status --short` trước khi sửa và trước khi stage.
- Kiểm tra có hoặc không có `pwsh`.
- Nếu có `pwsh`, chạy parser/test cơ bản.
- Nếu không có `pwsh`, ghi rõ giới hạn và kiểm tra tĩnh.
- Kiểm tra script có các từ khóa `DryRun`, `Backup`, `Overwrite`, `Conflict`, `Get-FileHash`, `Copy-Item`.
- Kiểm tra script không có `git add`.
- Kiểm tra không có file rỗng.
- Kiểm tra Markdown cơ bản.
- Kiểm tra thống nhất `P1-T3` giữa roadmap, task và checklist.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Rủi ro

- Không có PowerShell trong môi trường hiện tại nên chưa thể chạy test thật.
- PowerShell trên Windows có khác biệt đường dẫn so với Linux.
- Cần `P1-T4` để kiểm thử idempotency và bảo toàn file hiện có trên môi trường phù hợp.

## Blocker

Không có blocker cho việc tạo script. Kiểm thử runtime PowerShell bị giới hạn vì môi trường hiện không có `pwsh`.

## Kết quả task trước

`P1-T2` đã viết script Linux/macOS và commit `95b4a31df785e4eeb145b70316eaba3d9b96376c`.

## Task tiếp theo dự kiến

`P1-T4` - Kiểm thử idempotency và bảo toàn file hiện có.

## Kết quả thực hiện

Đã viết script cài đặt Windows PowerShell:

- Tạo `scripts/install.ps1` dạng đơn file.
- Hỗ trợ project mode cài `starter/AGENTS.md` và `starter/.ai/`.
- Hỗ trợ global mode cài `global/AGENTS.md` vào `~/.codex/AGENTS.md`.
- Hỗ trợ `-Target`, `-Global`, `-DryRun`, `-Overwrite`, `-Backup`, `-Yes`, `-Help`.
- Mặc định không ghi đè file conflict; conflict trả lỗi và hướng dẫn dùng `-Backup` hoặc `-Overwrite`.
- Dùng `Get-FileHash` để nhận diện file giống nội dung.
- Cập nhật README và context với hướng dẫn PowerShell.

Kết quả kiểm thử chính:

- `test -s scripts/install.ps1`: đạt.
- `command -v pwsh`: không có `pwsh` trong môi trường hiện tại.
- Kiểm tra tĩnh từ khóa `param`, `DryRun`, `Backup`, `Overwrite`, `Conflict`, `Get-FileHash`, `Copy-Item`, `-Help`: đạt.
- `rg -n 'git add' scripts/install.ps1`: không có kết quả, đạt.
- `find AGENTS.md README.md .ai global starter docs scripts -type f -size 0 -print`: không có file rỗng, đạt.
- Kiểm tra H1 và code fence Markdown bằng `rg` và `awk`: không phát hiện lỗi.
- Kiểm tra thống nhất `P1-T3` trong `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`: đạt.
- Kiểm tra starter không chứa tên riêng `AI Project OS`: đạt.
- Kiểm tra global rule không chứa trạng thái task cụ thể: đạt.
- `git diff --check`: đạt.
- Đã xem lại toàn bộ diff trước khi commit.

Giới hạn: chưa chạy parser/runtime PowerShell vì môi trường hiện không có `pwsh`; phần này chuyển sang `P1-T4` hoặc môi trường Windows/PowerShell phù hợp.

## Ngày bắt đầu

2026-07-23.

## Ngày hoàn thành

2026-07-23.
