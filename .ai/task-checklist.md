# Checklist task P1-T2

Ký hiệu:

- `[ ]` Chưa hoàn thành
- `[x]` Đã hoàn thành
- `[~]` Đang thực hiện
- `[!]` Bị chặn
- `[-]` Không áp dụng

Trước khi đóng task, không được còn `[~]` hoặc `[!]`.

## Chuẩn bị

- [x] Xác nhận task tiếp theo từ `P1-T1` là `P1-T2`.
- [x] Đọc `AGENTS.md`.
- [x] Đọc `.ai/context.md`.
- [x] Đọc `.ai/roadmap.md`.
- [x] Đọc `.ai/task.md` cũ.
- [x] Đọc `docs/install-design.md`.
- [x] Chạy `git status --short` trước khi sửa.

## Khảo sát repository

- [x] Xác nhận chưa có `scripts/install.sh`.
- [x] Xác nhận nguồn project mode là `starter/`.
- [x] Xác nhận nguồn global mode là `global/AGENTS.md`.
- [x] Kiểm tra shell hiện có thể chạy Bash.

## Thiết kế

- [x] Chốt dùng Bash.
- [x] Chốt không thêm dependency.
- [x] Chốt không ghi đè mặc định.
- [x] Chốt dùng `/tmp` cho test.
- [x] Chốt không đụng `HOME` thật khi test global mode.

## Triển khai

- [x] Tạo `scripts/install.sh`.
- [x] Hỗ trợ project mode.
- [x] Hỗ trợ global mode.
- [x] Hỗ trợ dry-run.
- [x] Hỗ trợ backup và overwrite.
- [x] Hỗ trợ conflict handling.
- [x] Cập nhật README.
- [x] Cập nhật context nếu cần.
- [x] Cập nhật roadmap/task/checklist/plan cho `P1-T2`.

## Kiểm tra nội dung

- [x] Kiểm tra script có shebang Bash.
- [x] Kiểm tra script có `--help`.
- [x] Kiểm tra script không dùng `git add .`.
- [x] Kiểm tra README có hướng dẫn Linux/macOS.
- [x] Kiểm tra task tiếp theo là `P1-T3`.

## Kiểm thử kỹ thuật

- [x] Chạy `bash -n scripts/install.sh`.
- [x] Chạy `scripts/install.sh --help`.
- [x] Chạy dry-run project mode vào `/tmp`.
- [x] Cài project mode vào thư mục tạm.
- [x] Chạy lại project mode để kiểm tra idempotency.
- [x] Kiểm tra conflict mặc định.
- [x] Kiểm tra `--backup`.
- [x] Kiểm tra `--overwrite`.
- [x] Kiểm tra global mode với `HOME` tạm.
- [x] Kiểm tra không có file rỗng.
- [x] Kiểm tra Markdown cơ bản.
- [x] Kiểm tra `roadmap.md`, `task.md` và `task-checklist.md` thống nhất về `P1-T2`.
- [x] Chạy `git diff --check`.
- [x] Xem lại toàn bộ `git diff`.

## Cập nhật tài liệu

- [x] Chuyển `P1-T2` thành `DONE` trong `.ai/roadmap.md`.
- [x] Ghi kết quả thực hiện vào `.ai/task.md`.
- [x] Đặt task tiếp theo dự kiến là `P1-T3`.
- [x] Rút gọn `.ai/plan.md` theo quy tắc reset.
- [x] Cập nhật checklist sau khi kiểm thử đạt.

## Kiểm tra Git

- [x] Chạy `git status --short` trước khi stage.
- [x] Stage chính xác file thuộc task, không dùng git add . trong mọi trường hợp.
- [x] Chạy `git diff --cached`.
- [x] Commit với thông điệp `[P1-T2] Viết script cài đặt Linux macOS`.
- [x] Lấy commit hash sau commit.

## Đóng task

- [x] Xác nhận Definition of Done đã đủ.
- [x] Xác nhận không còn `[~]` hoặc `[!]`.
- [x] Xác nhận không còn mục bắt buộc `[ ]`.
- [x] Xác nhận task không bắt đầu `P1-T3`.

## Chuẩn bị handoff

- [x] Báo cáo file đã tạo hoặc sửa.
- [x] Báo cáo kiểm thử đã chạy.
- [x] Báo cáo kết quả kiểm thử.
- [x] Báo cáo commit hash.
- [x] Báo cáo task tiếp theo.
- [x] Báo cáo giới hạn hoặc vấn đề còn lại nếu có.
