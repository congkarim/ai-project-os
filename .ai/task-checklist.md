# Checklist task P0-T3

Ký hiệu:

- `[ ]` Chưa hoàn thành
- `[x]` Đã hoàn thành
- `[~]` Đang thực hiện
- `[!]` Bị chặn
- `[-]` Không áp dụng

Trước khi đóng task, không được còn `[~]` hoặc `[!]`.

## Chuẩn bị

- [x] Xác nhận task tiếp theo từ `P0-T2` là `P0-T3`.
- [x] Đọc `AGENTS.md`.
- [x] Đọc `.ai/context.md`.
- [x] Đọc `.ai/roadmap.md`.
- [x] Đọc `.ai/task.md` cũ.
- [x] Đọc `.ai/task-checklist.md` cũ.
- [x] Đọc `.ai/plan.md`.
- [x] Đọc `.ai/decisions.md`.
- [x] Chạy `git status --short` trước khi sửa.

## Khảo sát repository

- [x] Tìm nội dung liên quan đến phiên bản, Phase 0, `P0-T3`, `P1-T1`, release và tag.
- [x] Liệt kê các file hiện có.
- [x] Thống kê số dòng Markdown.
- [x] Kiểm tra chưa có script cài đặt.
- [x] Kiểm tra chưa có Git tag.

## Thiết kế

- [x] Chốt `v0.1.0` là baseline tài liệu thủ công.
- [x] Chốt không tạo package release hoặc Git tag trong `P0-T3`.
- [x] Chốt Phase 1 bắt đầu từ `P1-T1`.
- [x] Chốt danh sách file cần sửa.
- [x] Chốt có cần ADR mới hay không.

## Triển khai

- [x] Chuyển `roadmap.md` sang task `P0-T3`.
- [x] Viết lại `.ai/task.md` cho `P0-T3`.
- [x] Viết lại `.ai/task-checklist.md` cho `P0-T3`.
- [x] Viết lại `.ai/plan.md` cho `P0-T3`.
- [x] Cập nhật README với phiên bản `v0.1.0`.
- [x] Cập nhật `.ai/context.md` về phân phối v0.1.
- [x] Cập nhật `.ai/decisions.md` nếu cần ADR mới.
- [x] Cập nhật checklist sau khi sửa nội dung.

## Kiểm tra nội dung

- [x] Kiểm tra README còn đủ hướng dẫn áp dụng bộ khung.
- [x] Kiểm tra README phân biệt v0.1 với release `v1.0.0`.
- [x] Kiểm tra `.ai/context.md` không hứa automation trước Phase 1.
- [x] Kiểm tra roadmap ghi đúng task tiếp theo là `P1-T1`.
- [x] Kiểm tra starter vẫn dùng placeholder rõ ràng.
- [x] Kiểm tra global rule vẫn không chứa trạng thái task cụ thể.

## Kiểm thử kỹ thuật

- [x] Kiểm tra không có file rỗng.
- [x] Kiểm tra Markdown cơ bản.
- [x] Tìm `v0.1.0`, `P0-T3`, `P1-T1`.
- [x] Kiểm tra starter không chứa thông tin riêng như tên `AI Project OS`.
- [x] Kiểm tra global rule không chứa trạng thái task cụ thể.
- [x] Kiểm tra không có script mới.
- [x] Kiểm tra không có Git tag mới.
- [x] Kiểm tra `roadmap.md`, `task.md` và `task-checklist.md` thống nhất về `P0-T3`.
- [x] Chạy `git diff --check`.
- [x] Xem lại toàn bộ `git diff`.

## Cập nhật tài liệu

- [x] Chuyển `P0-T3` thành `DONE` trong `.ai/roadmap.md`.
- [x] Chuyển Phase 0 thành `DONE` trong `.ai/roadmap.md`.
- [x] Ghi kết quả thực hiện vào `.ai/task.md`.
- [x] Đặt task tiếp theo dự kiến là `P1-T1`.
- [x] Rút gọn `.ai/plan.md` theo quy tắc reset.
- [x] Cập nhật checklist sau khi kiểm thử đạt.

## Kiểm tra Git

- [x] Chạy `git status --short` trước khi stage.
- [x] Stage chính xác file thuộc task, không dùng git add . trong mọi trường hợp.
- [x] Chạy `git diff --cached`.
- [x] Commit với thông điệp `[P0-T3] Chốt AI Project OS v0.1`.
- [x] Lấy commit hash sau commit.

## Đóng task

- [x] Xác nhận Definition of Done đã đủ.
- [x] Xác nhận không còn `[~]` hoặc `[!]`.
- [x] Xác nhận không còn mục bắt buộc `[ ]`.
- [x] Xác nhận task không bắt đầu `P1-T1`.

## Chuẩn bị handoff

- [x] Báo cáo file đã tạo hoặc sửa.
- [x] Báo cáo kiểm thử đã chạy.
- [x] Báo cáo kết quả kiểm thử.
- [x] Báo cáo commit hash.
- [x] Báo cáo task tiếp theo.
- [x] Báo cáo giới hạn hoặc vấn đề còn lại nếu có.
