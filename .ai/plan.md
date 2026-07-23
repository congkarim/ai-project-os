# Plan task P1-T3

File này đã được rút gọn sau khi hoàn thành task theo quy tắc reset.

## Task vừa hoàn thành

- ID: `P1-T3`
- Tên: Viết script cài đặt cho Windows PowerShell.
- Ngày hoàn thành: 2026-07-23.

## Các phương án chính đã xem xét

- PowerShell script đơn file.
- Chờ môi trường Windows/PowerShell rồi mới viết.
- Tạo wrapper PowerShell gọi `scripts/install.sh`.

## Phương án được chọn

PowerShell script đơn file tại `scripts/install.ps1`.

## Lý do

Phương án này đúng mục tiêu Windows, không phụ thuộc Bash, không cần dependency production và có thể bám theo thiết kế trong `docs/install-design.md`.

## Phát hiện quan trọng

- Môi trường hiện không có `pwsh`, nên task này chỉ kiểm tra tĩnh thay vì chạy parser/runtime PowerShell.
- Tham số `-Global` được hỗ trợ qua alias `[Alias("Global")]` cho biến `$GlobalMode` để tránh dùng tên dễ nhầm với scope modifier của PowerShell.
- Script dùng `Get-FileHash` để kiểm tra idempotency theo nội dung file.
- Script mặc định không ghi đè conflict và hướng dẫn chạy lại với `-Backup` hoặc `-Overwrite`.

## Kết quả kiểm thử

- `test -s scripts/install.ps1`: đạt.
- `command -v pwsh`: không có `pwsh`; ghi nhận giới hạn runtime.
- Kiểm tra tĩnh các từ khóa `param`, `DryRun`, `Backup`, `Overwrite`, `Conflict`, `Get-FileHash`, `Copy-Item`, `-Help`: đạt.
- `rg -n 'git add' scripts/install.ps1`: không có kết quả, đạt.
- Kiểm tra không có file rỗng: đạt.
- Kiểm tra Markdown cơ bản: đạt.
- Kiểm tra thống nhất `P1-T3` giữa `roadmap.md`, `task.md` và `task-checklist.md`: đạt.
- Kiểm tra starter không chứa tên riêng `AI Project OS`: đạt.
- Kiểm tra global rule không chứa trạng thái task cụ thể: đạt.
- `git diff --check`: đạt.
- Xem lại diff: đạt.

## Vấn đề chuyển sang task sau

- `P1-T4`: kiểm thử idempotency và bảo toàn file hiện có, bao gồm runtime PowerShell trên môi trường có `pwsh` hoặc Windows PowerShell.
