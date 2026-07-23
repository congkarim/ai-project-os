# Checklist task <P0-T1>

Hướng dẫn thay thế: đổi `<P0-T1>` thành ID task thật và thay từng mục checklist bằng việc cụ thể cần làm.

Ký hiệu:

- `[ ]` Chưa hoàn thành
- `[x]` Đã hoàn thành
- `[~]` Đang thực hiện
- `[!]` Bị chặn
- `[-]` Không áp dụng

Trước khi đóng task, không được còn `[~]` hoặc `[!]`.

## Chuẩn bị

- [ ] Xác nhận task hiện tại là `<P0-T1>`.
- [ ] Xác định mục tiêu task.
- [ ] Xác định phạm vi và ngoài phạm vi.
- [ ] Xác nhận không commit secret, token, mật khẩu, file `.env` hoặc thông tin nhạy cảm.

## Khảo sát repository

- [ ] Chạy `git status --short`.
- [ ] Đọc `AGENTS.md`.
- [ ] Đọc `.ai/context.md`.
- [ ] Đọc `.ai/roadmap.md`.
- [ ] Đọc `.ai/task.md`.
- [ ] Đọc `.ai/plan.md`.
- [ ] Đọc `.ai/decisions.md` nếu liên quan.
- [ ] Kiểm tra file hoặc module liên quan đến task.

## Thiết kế

- [ ] Ghi vấn đề cần giải quyết vào `plan.md`.
- [ ] Liệt kê phương án trong `plan.md`.
- [ ] So sánh phương án.
- [ ] Chốt phương án thực hiện.
- [ ] Ghi quyết định dài hạn vào `decisions.md` nếu có.

## Triển khai

- [ ] Thực hiện thay đổi `<THAY_ĐỔI_1>`.
- [ ] Thực hiện thay đổi `<THAY_ĐỔI_2>`.
- [ ] Cập nhật tài liệu liên quan.

## Kiểm tra nội dung

- [ ] Đối chiếu thay đổi với phạm vi task.
- [ ] Đối chiếu đầu ra với tiêu chí chấp nhận.
- [ ] Kiểm tra không có nội dung nhạy cảm.
- [ ] Kiểm tra không sửa ngoài phạm vi.

## Kiểm thử kỹ thuật

- [ ] Chạy `<LỆNH_TEST_1>`.
- [ ] Chạy `<LỆNH_TEST_2>`.
- [ ] Ghi kết quả kiểm thử vào `plan.md` hoặc `task.md`.
- [ ] Chạy `git diff --check`.
- [ ] Xem lại toàn bộ `git diff`.

## Cập nhật tài liệu

- [ ] Cập nhật `.ai/roadmap.md`.
- [ ] Cập nhật `.ai/task.md`.
- [ ] Cập nhật `.ai/task-checklist.md`.
- [ ] Rút gọn `.ai/plan.md` khi task hoàn thành.
- [ ] Cập nhật `.ai/decisions.md` nếu có quyết định dài hạn.

## Kiểm tra Git

- [ ] Chạy `git status --short` trước khi stage.
- [ ] Stage chính xác file thuộc task, không dùng `git add .`.
- [ ] Chạy `git diff --cached`.
- [ ] Commit với thông điệp `[<ID_TASK>] <Mô tả kết quả>`.
- [ ] Lấy commit hash sau commit.

## Đóng task

- [ ] Xác nhận Definition of Done đã đủ.
- [ ] Xác nhận không còn `[~]` hoặc `[!]`.
- [ ] Xác nhận không còn mục bắt buộc `[ ]`.
- [ ] Xác nhận task tiếp theo đã được ghi nhận nhưng chưa bắt đầu nếu ngoài phạm vi.

## Chuẩn bị handoff

- [ ] Báo cáo file đã tạo hoặc sửa.
- [ ] Báo cáo kiểm thử đã chạy.
- [ ] Báo cáo kết quả kiểm thử.
- [ ] Báo cáo commit hash nếu đã commit.
- [ ] Báo cáo task tiếp theo.
- [ ] Báo cáo giới hạn hoặc vấn đề còn lại nếu có.
