# Plan task P2-T2

File này đã được rút gọn sau khi hoàn thành task theo quy tắc reset.

## Task vừa hoàn thành

- ID: `P2-T2`
- Tên: Thử nghiệm trên một dự án đang phát triển.
- Ngày hoàn thành: 2026-07-23.

## Phương án được chọn

Dùng repository hiện tại làm dự án đang phát triển và chỉ chạy script ở chế độ an toàn: dry-run và install mặc định không `--backup`, không `--overwrite`.

## Kết quả thử nghiệm

- Repository bắt đầu với `git status --short` sạch.
- Dry-run vào repository hiện tại trả mã khác `0` vì có conflict, in plan và không ghi file.
- Install mặc định với `--yes` trả mã khác `0`, in danh sách conflict và hướng dẫn dùng `--backup` hoặc `--overwrite`.
- `git status --short` không đổi sau dry-run và sau install mặc định.
- `AGENTS.md` hiện tại không bị thay bằng `starter/AGENTS.md`.
- `.ai/task.md` hiện tại không bị thay bằng `starter/.ai/task.md`.
- Test repository đang phát triển: 11 pass, 0 fail.

## Vấn đề chuyển sang task sau

- `P2-T3`: đánh giá khả năng tiếp quản sau khi mở phiên Codex mới.
- PowerShell runtime vẫn cần môi trường có `pwsh` hoặc Windows PowerShell.
