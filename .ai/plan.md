# Plan task P2-T1

File này đã được rút gọn sau khi hoàn thành task theo quy tắc reset.

## Task vừa hoàn thành

- ID: `P2-T1`
- Tên: Thử nghiệm trên một repository mẫu.
- Ngày hoàn thành: 2026-07-23.

## Phương án được chọn

Tạo Git repository mẫu trong `/tmp`, chạy `scripts/install.sh` ở dry-run và cài thật, so sánh nội dung với `starter/`, mô phỏng đọc startup files và chạy lại script để kiểm tra idempotency.

## Kết quả thử nghiệm

- Repository mẫu là Git repository hợp lệ.
- Dry-run không tạo `AGENTS.md` hoặc `.ai/`.
- Cài thật tạo `AGENTS.md` và đủ file `.ai/`.
- File repo mẫu giống nguồn trong `starter/`.
- Startup files trong repo mẫu đều không rỗng và đọc được.
- Starter không lẫn trạng thái riêng của AI Project OS.
- Chạy lại script báo `unchanged` và không làm thay đổi `git status --short`.
- Test repo mẫu: 20 pass, 0 fail.

## Vấn đề chuyển sang task sau

- `P2-T2`: thử nghiệm trên một dự án đang phát triển.
- PowerShell runtime vẫn cần môi trường có `pwsh` hoặc Windows PowerShell.
