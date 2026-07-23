# Quy tắc làm việc cho coding agent

Thay `<TÊN_DỰ_ÁN>` bằng tên thật của repository sau khi sao chép template này.

File này là điểm khởi động của coding agent trong repository `<TÊN_DỰ_ÁN>`.

## Trình tự khởi động

Mỗi phiên làm việc phải:

1. Đọc `AGENTS.md`.
2. Đọc `.ai/context.md`.
3. Đọc `.ai/roadmap.md`.
4. Đọc `.ai/task.md`.
5. Đọc `.ai/task-checklist.md`.
6. Đọc `.ai/plan.md`.
7. Đọc `.ai/decisions.md` khi task liên quan đến kiến trúc hoặc quyết định trước đây.
8. Chạy `git status --short`.
9. Đối chiếu trạng thái giữa `roadmap.md`, `task.md` và `task-checklist.md`.
10. Tóm tắt phase hiện tại, task hiện tại, tiến độ, việc tiếp theo và thay đổi Git ngoài phạm vi nếu có.

## Vòng đời task

```text
TODO -> PLANNING -> DOING -> VERIFYING -> DONE -> HANDOFF
```

Mỗi task cần đi qua:

1. Xác định mục tiêu.
2. Xác định phạm vi và ngoài phạm vi.
3. Phân tích phương án trong `plan.md`.
4. Chốt phương án thực hiện.
5. Cụ thể hóa trong `task-checklist.md`.
6. Triển khai.
7. Chạy kiểm thử.
8. Đối chiếu tiêu chí hoàn thành.
9. Cập nhật tài liệu.
10. Commit Git.
11. Chuẩn bị task tiếp theo.

## Definition of Done

Không đánh dấu task là `DONE` nếu chưa đủ:

- Đầu ra của task đã tồn tại.
- Tiêu chí chấp nhận đã đạt.
- Kiểm thử bắt buộc đã chạy.
- Kết quả kiểm thử đã được ghi lại.
- Checklist không còn mục bắt buộc chưa hoàn thành.
- `roadmap.md`, `task.md`, `task-checklist.md` và `plan.md` đã được cập nhật.
- Quyết định dài hạn đã ghi vào `decisions.md` nếu có.
- Git diff đã được kiểm tra.
- Commit của task đã được tạo thành công.

## Quy tắc Git

- Mọi công việc phải được quản lý bằng Git.
- Chạy `git status --short` trước khi stage.
- Không dùng git add . trong mọi trường hợp.
- Chỉ stage file thuộc phạm vi task.
- Không commit secret, token, mật khẩu, file `.env` hoặc thông tin nhạy cảm.
- Không sửa, xóa hoặc reset thay đổi của người dùng ngoài phạm vi.
- Commit bằng tiếng Việt, UTF-8, trừ khi dự án quy định khác.
- Định dạng commit mặc định:

```text
[<ID_TASK>] <Mô tả kết quả>
```

Ví dụ:

```text
[P0-T1] Khởi tạo dự án
```

## Quy tắc kiến trúc

- Không tự ý thay đổi kiến trúc đã được chốt.
- Ghi quyết định dài hạn vào `.ai/decisions.md`.
- Mỗi quyết định nên có ID, ngày, bối cảnh, phương án, lựa chọn, lý do, hệ quả và điều kiện xem xét lại.

## Quy tắc giao tiếp

- Không dựa vào lịch sử chat làm nguồn sự thật duy nhất.
- Ưu tiên source code, config và tài liệu trong repository.
- Không hỏi lại thông tin đã có trong file quản lý.
- Khi có thể tự kiểm tra bằng lệnh hoặc file, kiểm tra trước khi hỏi.
- Báo cáo ngắn gọn theo kết quả thực tế.
- Không tuyên bố hoàn thành nếu chưa kiểm thử.
