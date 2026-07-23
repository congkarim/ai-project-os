# Plan task P1-T2

File này đã được rút gọn sau khi hoàn thành task theo quy tắc reset.

## Task vừa hoàn thành

- ID: `P1-T2`
- Tên: Viết script cài đặt cho Linux/macOS.
- Ngày hoàn thành: 2026-07-23.

## Các phương án chính đã xem xét

- Bash script đơn file.
- Shell script sinh từ template hoặc nhiều helper.
- Dùng ngôn ngữ khác như Python hoặc Node.

## Phương án được chọn

Bash script đơn file tại `scripts/install.sh`.

## Lý do

Phương án này không cần dependency production, phù hợp Linux/macOS và đủ để triển khai thiết kế trong `docs/install-design.md`.

## Phát hiện quan trọng

- Script phải tách rõ lập kế hoạch và ghi file để dry-run không ghi gì và prompt xảy ra trước khi apply.
- Test global mode phải dùng `HOME` tạm để không đụng cấu hình thật.
- Idempotency project mode có thể kiểm tra bằng lần chạy thứ hai báo `skipped: 7`.
- Conflict mặc định phải trả lỗi và giữ nguyên file người dùng.

## Kết quả kiểm thử

- `bash -n scripts/install.sh`: đạt.
- `scripts/install.sh --help`: đạt.
- Dry-run project mode vào `/tmp`: đạt, không ghi file.
- Project mode cài vào thư mục tạm: đạt.
- Chạy lại project mode để kiểm tra idempotency: đạt, báo `skipped: 7`.
- Conflict mặc định: đạt, trả mã `1` và không ghi đè.
- `--backup`: đạt, tạo backup và ghi nguồn.
- `--overwrite`: đạt, ghi nguồn và không tạo backup.
- Global mode với `HOME` tạm: đạt, chạy lại báo `skipped: 1`.
- `--backup` và `--overwrite` dùng cùng lúc: đạt, trả lỗi tham số.
- Kiểm tra script không có `git add`: đạt.
- Kiểm tra không có file rỗng: đạt.
- Kiểm tra Markdown cơ bản: đạt.
- Kiểm tra thống nhất `P1-T2` giữa `roadmap.md`, `task.md` và `task-checklist.md`: đạt.
- Chạy `git diff --check`: đạt.
- Xem lại diff: đạt.

## Vấn đề chuyển sang task sau

- `P1-T3`: viết script cài đặt cho Windows PowerShell với hành vi tương đương `scripts/install.sh`.
