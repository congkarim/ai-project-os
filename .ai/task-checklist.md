# Checklist task P3-T2

Ký hiệu:

- `[ ]` Chưa hoàn thành
- `[x]` Đã hoàn thành
- `[~]` Đang thực hiện
- `[!]` Bị chặn
- `[-]` Không áp dụng

Trước khi đóng task, không được còn `[~]` hoặc `[!]`.

## Chuẩn bị

- [x] Xác nhận task tiếp theo từ `P3-T1` là `P3-T2`.
- [x] Đọc `AGENTS.md`.
- [x] Đọc `.ai/context.md`.
- [x] Đọc `.ai/roadmap.md`.
- [x] Đọc `.ai/task.md`.
- [x] Đọc `.ai/task-checklist.md`.
- [x] Đọc `.ai/plan.md`.
- [x] Đọc `.ai/decisions.md`.
- [x] Chạy `git status --short` trước khi sửa.

## Thiết kế

- [x] Chốt đóng gói bằng VERSION + CHANGELOG + release notes.
- [x] Chốt không gắn Git tag trong task này.
- [x] Chốt không tạo npm/pip hoặc archive riêng.
- [x] Cụ thể hóa checklist và triển khai.

## Đóng gói v1.0.0

- [x] Tạo `VERSION` = `1.0.0`.
- [x] Tạo `CHANGELOG.md` với mục `v1.0.0`.
- [x] Tạo `docs/release-v1.0.0.md` với danh mục thành phần.
- [x] Cập nhật baseline `v1.0.0` trong `README.md`.
- [x] Cập nhật baseline `v1.0.0` trong `.ai/context.md`.
- [x] Ghi ADR đóng gói vào `.ai/decisions.md`.
- [x] Xác nhận chưa tạo Git tag `v1.0.0`.

## Kiểm tra repository chính

- [x] Kiểm tra danh mục thành phần khớp file thực tế.
- [x] Kiểm tra không có file rỗng trong phạm vi sửa.
- [x] Kiểm tra Markdown cơ bản.
- [x] Kiểm tra thống nhất `P3-T2` giữa roadmap, task và checklist.
- [x] Chạy `git diff --check`.
- [x] Xem lại toàn bộ `git diff`.

## Cập nhật tài liệu trạng thái

- [x] Ghi kết quả vào `.ai/task.md`.
- [x] Chuyển `P3-T2` thành `DONE` trong `.ai/roadmap.md` khi đủ DoD.
- [x] Đặt task tiếp theo dự kiến là `P3-T3`.
- [x] Rút gọn `.ai/plan.md` sau khi hoàn thành task.
- [x] Cập nhật checklist sau khi kiểm thử đạt.

## Kiểm tra Git

- [x] Chạy `git status --short` trước khi stage.
- [x] Stage chính xác file thuộc task, không dùng git add . trong mọi trường hợp.
- [x] Chạy `git diff --cached`.
- [x] Commit với thông điệp `[P3-T2] Đóng gói phiên bản v1.0.0`.
- [x] Lấy commit hash sau commit.

## Đóng task

- [x] Xác nhận Definition of Done đã đủ.
- [x] Xác nhận không còn `[~]` hoặc `[!]`.
- [x] Xác nhận không còn mục bắt buộc `[ ]`.
- [x] Xác nhận không bắt đầu `P3-T3`.

## Chuẩn bị handoff

- [x] Báo cáo nội dung đóng gói.
- [x] Báo cáo kết quả kiểm thử.
- [x] Báo cáo commit hash.
- [x] Báo cáo task tiếp theo.
- [x] Báo cáo giới hạn hoặc vấn đề còn lại nếu có.
