# AI Project OS - Quy tắc làm việc cho coding agent

File này là điểm khởi động bắt buộc của mọi coding agent khi làm việc trong repository `ai-project-os`.

## 1. Trình tự khởi động mỗi phiên

Mỗi phiên làm việc phải thực hiện theo thứ tự:

1. Đọc `AGENTS.md`.
2. Đọc `.ai/context.md`.
3. Đọc `.ai/roadmap.md`.
4. Đọc `.ai/task.md`.
5. Đọc `.ai/task-checklist.md`.
6. Đọc `.ai/plan.md`.
7. Đọc `.ai/decisions.md` khi task liên quan đến kiến trúc hoặc quyết định trước đây.
8. Kiểm tra `git status --short`.
9. Đối chiếu trạng thái giữa `roadmap.md`, `task.md` và `task-checklist.md`.
10. Tóm tắt ngắn:
   - Dự án đang ở phase nào.
   - Task hiện tại là gì.
   - Đã hoàn thành đến đâu.
   - Việc cần làm ngay tiếp theo.
   - Có thay đổi Git ngoài phạm vi hay không.

Không dựa vào lịch sử chat làm nguồn sự thật duy nhất. Ưu tiên nội dung hiện có trong repository.

## 2. Vòng đời task

Mỗi task đi qua sáu trạng thái:

```text
TODO -> PLANNING -> DOING -> VERIFYING -> DONE -> HANDOFF
```

Quy trình bắt buộc:

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

Không chuyển task sang `DONE` trước khi hoàn thành Definition of Done.

## 3. Definition of Done

Không được đánh dấu task là `DONE` nếu chưa đủ:

- Đầu ra của task đã tồn tại.
- Các tiêu chí chấp nhận đã đạt.
- Kiểm thử bắt buộc đã chạy.
- Kết quả kiểm thử đã được ghi lại.
- Checklist không còn mục bắt buộc chưa hoàn thành.
- `roadmap.md` đã cập nhật.
- `task.md` đã ghi kết quả task vừa hoàn thành.
- `plan.md` đã được rút gọn.
- Quyết định dài hạn đã ghi vào `decisions.md`.
- Git diff đã được kiểm tra.
- Commit của task đã được tạo thành công.

## 4. Quy tắc Git

- Mọi công việc phải được quản lý bằng Git.
- Commit sau khi hoàn thành một task, không commit task đang dang dở trừ checkpoint có chủ đích.
- Nội dung commit bằng tiếng Việt, UTF-8.
- Định dạng commit mặc định:

```text
[P<phase>-T<task>] <Mô tả kết quả>
```

Ví dụ:

```text
[P0-T1] Khởi tạo nền tảng AI Project OS
```

- Không dùng git add . trong mọi trường hợp.
- Trước khi stage phải chạy `git status --short`.
- Chỉ stage file thuộc phạm vi task.
- Không sửa, xóa, reset hoặc đưa vào commit các thay đổi có sẵn của người dùng nhưng không thuộc task.
- Trước commit phải kiểm tra `git diff --cached`.
- Sau commit phải lấy commit hash và báo cáo.
- Nếu commit thất bại do chưa cấu hình Git identity, không tự sửa cấu hình global; báo rõ lỗi và lệnh người dùng cần chạy.

## 5. Quy tắc thay đổi kiến trúc

- Không tự ý thay đổi kiến trúc đã được chốt.
- Khi xuất hiện quyết định ảnh hưởng dài hạn, phải ghi vào `decisions.md`.
- Mỗi quyết định phải có:
  - ID.
  - Ngày.
  - Bối cảnh.
  - Các phương án.
  - Phương án được chọn.
  - Lý do.
  - Hệ quả.
  - Điều kiện xem xét lại.

## 6. Quy tắc giao tiếp

- Không dựa vào lịch sử chat làm nguồn sự thật duy nhất.
- Ưu tiên nội dung hiện có trong repository.
- Không hỏi lại thông tin đã có trong các file quản lý.
- Khi có thể tự kiểm tra bằng source code, config hoặc lệnh, phải kiểm tra trước khi hỏi.
- Báo cáo ngắn gọn theo kết quả thực tế.
- Không tuyên bố hoàn thành nếu chưa kiểm thử.

## 7. Phạm vi repository này

Repository này chỉ chứa bộ khung quản lý dự án cho coding agent:

- Quy tắc làm việc.
- Tài liệu trạng thái.
- Template dùng lại cho repository mới.
- Tài liệu hướng dẫn áp dụng.

Không triển khai tính năng nghiệp vụ, ứng dụng web, API hoặc giao diện. Automation chỉ được thêm khi roadmap và task hiện tại cho phép rõ ràng.
