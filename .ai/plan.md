# Plan task P1-T4

File này đã được rút gọn sau khi hoàn thành task theo quy tắc reset.

## Task vừa hoàn thành

- ID: `P1-T4`
- Tên: Kiểm thử idempotency và bảo toàn file hiện có.
- Ngày hoàn thành: 2026-07-23.

## Phương án được chọn

Chạy kiểm thử runtime cho `scripts/install.sh` bằng thư mục tạm trong `/tmp`; dùng `HOME` tạm cho global mode. Với `scripts/install.ps1`, kiểm tra runtime nếu có `pwsh`; môi trường hiện không có nên dùng kiểm tra tĩnh.

## Kết quả kiểm thử

- Dry-run project mode bằng Bash không tạo file trong target tạm.
- Project mode lần đầu tạo đủ file từ `starter/`.
- Project mode lần hai báo `unchanged` và không làm thay đổi `git status --short` trong Git repo tạm.
- Conflict mặc định trả lỗi khác `0` và không ghi đè file hiện có.
- `--backup` tạo backup cạnh file conflict và ghi nội dung nguồn.
- `--overwrite` ghi nội dung nguồn khi được chọn rõ.
- Global mode dùng `HOME` tạm, ghi vào `.codex/AGENTS.md` và chạy lại không đổi.
- Bash runtime test: 23 pass, 0 fail.
- PowerShell runtime chưa chạy vì môi trường không có `pwsh`.
- PowerShell static test: 8 pass, 0 fail.

## Vấn đề chuyển sang task sau

- `P2-T1`: thử nghiệm trên một repository mẫu.
- Khi có môi trường Windows hoặc PowerShell, cần chạy runtime `scripts/install.ps1` trong Phase 2.
