# Checklist task P1-T1

Ký hiệu:

- `[ ]` Chưa hoàn thành
- `[x]` Đã hoàn thành
- `[~]` Đang thực hiện
- `[!]` Bị chặn
- `[-]` Không áp dụng

Trước khi đóng task, không được còn `[~]` hoặc `[!]`.

## Chuẩn bị

- [x] Xác nhận task tiếp theo từ `P0-T3` là `P1-T1`.
- [x] Đọc `AGENTS.md`.
- [x] Đọc `.ai/context.md`.
- [x] Đọc `.ai/roadmap.md`.
- [x] Đọc `.ai/task.md` cũ.
- [x] Đọc `.ai/task-checklist.md` cũ.
- [x] Đọc `.ai/plan.md`.
- [x] Đọc `.ai/decisions.md`.
- [x] Chạy `git status --short` trước khi sửa.

## Khảo sát repository

- [x] Liệt kê file hiện có.
- [x] Xác nhận nguồn cài đặt project-level là `starter/`.
- [x] Xác nhận nguồn cài đặt global là `global/AGENTS.md`.
- [x] Kiểm tra chưa có script cài đặt.
- [x] Kiểm tra README/context đã trỏ tới thiết kế cài đặt.

## Thiết kế

- [x] Chốt thiết kế trước, script sau.
- [x] Chốt mặc định không ghi đè.
- [x] Chốt dry-run là bắt buộc.
- [x] Chốt backup an toàn hơn overwrite.
- [x] Chốt project mode và global mode.
- [x] Chốt có cần ADR mới hay không.

## Triển khai

- [x] Tạo `docs/install-design.md`.
- [x] Chuyển `roadmap.md` sang task `P1-T1`.
- [x] Viết lại `.ai/task.md` cho `P1-T1`.
- [x] Viết lại `.ai/task-checklist.md` cho `P1-T1`.
- [x] Viết lại `.ai/plan.md` cho `P1-T1`.
- [x] Cập nhật README để trỏ tới thiết kế cài đặt.
- [x] Cập nhật `.ai/context.md` về tài liệu thiết kế automation.
- [x] Cập nhật `.ai/decisions.md` nếu cần ADR mới.

## Kiểm tra nội dung

- [x] Kiểm tra `docs/install-design.md` có project mode, global mode, dry-run.
- [x] Kiểm tra có chính sách conflict, backup, overwrite.
- [x] Kiểm tra có yêu cầu idempotency.
- [x] Kiểm tra có tham số, mã kết thúc và kiểm thử đề xuất.
- [x] Kiểm tra không có script mới.
- [x] Kiểm tra task tiếp theo là `P1-T2`.

## Kiểm thử kỹ thuật

- [x] Kiểm tra `docs/install-design.md` tồn tại và không rỗng.
- [x] Tìm `dry-run`, `backup`, `overwrite`, `conflict`, `idempotency`.
- [x] Kiểm tra không có file rỗng.
- [x] Kiểm tra Markdown cơ bản.
- [x] Kiểm tra starter không chứa thông tin riêng như tên `AI Project OS`.
- [x] Kiểm tra global rule không chứa trạng thái task cụ thể.
- [x] Kiểm tra không có script mới.
- [x] Kiểm tra `roadmap.md`, `task.md` và `task-checklist.md` thống nhất về `P1-T1`.
- [x] Chạy `git diff --check`.
- [x] Xem lại toàn bộ `git diff`.

## Cập nhật tài liệu

- [x] Chuyển `P1-T1` thành `DONE` trong `.ai/roadmap.md`.
- [x] Ghi kết quả thực hiện vào `.ai/task.md`.
- [x] Đặt task tiếp theo dự kiến là `P1-T2`.
- [x] Rút gọn `.ai/plan.md` theo quy tắc reset.
- [x] Cập nhật checklist sau khi kiểm thử đạt.

## Kiểm tra Git

- [x] Chạy `git status --short` trước khi stage.
- [x] Stage chính xác file thuộc task, không dùng git add . trong mọi trường hợp.
- [x] Chạy `git diff --cached`.
- [x] Commit với thông điệp `[P1-T1] Thiết kế cơ chế cài đặt`.
- [x] Lấy commit hash sau commit.

## Đóng task

- [x] Xác nhận Definition of Done đã đủ.
- [x] Xác nhận không còn `[~]` hoặc `[!]`.
- [x] Xác nhận không còn mục bắt buộc `[ ]`.
- [x] Xác nhận task không bắt đầu `P1-T2`.

## Chuẩn bị handoff

- [x] Báo cáo file đã tạo hoặc sửa.
- [x] Báo cáo kiểm thử đã chạy.
- [x] Báo cáo kết quả kiểm thử.
- [x] Báo cáo commit hash.
- [x] Báo cáo task tiếp theo.
- [x] Báo cáo giới hạn hoặc vấn đề còn lại nếu có.
