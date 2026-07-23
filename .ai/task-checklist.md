# Checklist task P0-T1

Ký hiệu:

- `[ ]` Chưa hoàn thành
- `[x]` Đã hoàn thành
- `[~]` Đang thực hiện
- `[!]` Bị chặn
- `[-]` Không áp dụng

Trước khi đóng task, không được còn `[~]` hoặc `[!]`.

## Chuẩn bị

- [x] Xác nhận task hiện tại là `P0-T1`.
- [x] Xác nhận không triển khai tính năng nghiệp vụ, ứng dụng web, API, giao diện hoặc automation.
- [x] Xác nhận không đưa secret, token, mật khẩu, file `.env` hoặc thông tin nhạy cảm vào tài liệu.
- [x] Xác nhận không tự đặt Git remote.
- [x] Xác nhận không tự thay đổi Git user.name hoặc user.email ở phạm vi global.

## Khảo sát repository

- [x] Kiểm tra thư mục hiện tại bằng `pwd`.
- [x] Kiểm tra repository có phải Git repository hay chưa.
- [x] Chạy `git init` vì repository chưa được khởi tạo Git.
- [x] Chạy `git status --short` sau khi Git sẵn sàng.
- [x] Kiểm tra không có file hiện có cần bảo toàn ngoài `.git`, `.agents`, `.codex`.

## Thiết kế

- [x] Chốt cấu trúc root cho AI Project OS.
- [x] Chốt `.ai/` là nơi lưu tài liệu trạng thái.
- [x] Chốt `global/AGENTS.md` là mẫu rule chung.
- [x] Chốt `starter/` là template sạch cho repository mới.
- [x] Ghi quyết định `ADR-001`.
- [x] Ghi quyết định `ADR-002`.

## Triển khai

- [x] Tạo `AGENTS.md`.
- [x] Tạo `README.md`.
- [x] Tạo `.ai/context.md`.
- [x] Tạo `.ai/roadmap.md`.
- [x] Tạo `.ai/task.md`.
- [x] Tạo `.ai/task-checklist.md`.
- [x] Tạo `.ai/plan.md`.
- [x] Tạo `.ai/decisions.md`.
- [x] Tạo `global/AGENTS.md`.
- [x] Tạo `starter/AGENTS.md`.
- [x] Tạo `starter/.ai/context.md`.
- [x] Tạo `starter/.ai/roadmap.md`.
- [x] Tạo `starter/.ai/task.md`.
- [x] Tạo `starter/.ai/task-checklist.md`.
- [x] Tạo `starter/.ai/plan.md`.
- [x] Tạo `starter/.ai/decisions.md`.

## Kiểm tra nội dung

- [x] Kiểm tra `AGENTS.md` có trình tự khởi động.
- [x] Kiểm tra `AGENTS.md` có vòng đời task.
- [x] Kiểm tra `AGENTS.md` có Definition of Done.
- [x] Kiểm tra `AGENTS.md` có quy tắc Git.
- [x] Kiểm tra `AGENTS.md` có quy tắc thay đổi kiến trúc.
- [x] Kiểm tra `AGENTS.md` có quy tắc giao tiếp.
- [x] Kiểm tra `.ai/context.md` có đầy đủ schema và nội dung thực tế.
- [x] Kiểm tra `.ai/roadmap.md` có đủ phase và task ban đầu.
- [x] Kiểm tra `.ai/task.md` chỉ hiển thị task hiện tại.
- [x] Kiểm tra `.ai/task-checklist.md` không còn mục thiết kế hoặc triển khai bị thiếu.
- [x] Kiểm tra `.ai/plan.md` có đủ nội dung làm việc trước khi reset.
- [x] Kiểm tra `.ai/decisions.md` có `ADR-001` và `ADR-002`.
- [x] Kiểm tra `global/AGENTS.md` ngắn hơn `AGENTS.md` root.
- [x] Kiểm tra `starter/` dùng placeholder rõ ràng và không chứa trạng thái riêng của AI Project OS.
- [x] Kiểm tra `README.md` có đủ hướng dẫn bắt buộc.

## Kiểm thử kỹ thuật

- [x] Liệt kê cây thư mục.
- [x] Xác nhận tất cả file bắt buộc tồn tại.
- [x] Kiểm tra không có file rỗng.
- [x] Kiểm tra Markdown cơ bản.
- [x] Tìm từ khóa `Definition of Done`.
- [x] Tìm từ khóa `git status --short`.
- [x] Tìm từ khóa `Không dùng git add .`.
- [x] Tìm từ khóa `task.md`.
- [x] Tìm từ khóa `task-checklist.md`.
- [x] Tìm từ khóa `plan.md`.
- [x] Tìm từ khóa `decisions.md`.
- [x] Kiểm tra starter không chứa thông tin riêng như tên `AI Project OS`.
- [x] Kiểm tra global rule không chứa trạng thái task cụ thể.
- [x] Kiểm tra `roadmap.md`, `task.md` và `task-checklist.md` thống nhất về `P0-T1`.
- [x] Chạy `git diff --check`.
- [x] Xem lại toàn bộ `git diff`.

## Cập nhật tài liệu

- [x] Chuyển `P0-T1` thành `DONE` trong `.ai/roadmap.md`.
- [x] Ghi kết quả thực hiện vào `.ai/task.md`.
- [x] Đặt task tiếp theo dự kiến là `P0-T2`.
- [x] Rút gọn `.ai/plan.md` theo quy tắc reset.
- [x] Cập nhật checklist sau khi kiểm thử đạt.

## Kiểm tra Git

- [x] Chạy `git status --short` trước khi stage.
- [x] Stage chính xác file thuộc task, không dùng `git add .`.
- [x] Chạy `git diff --cached`.
- [x] Commit với thông điệp `[P0-T1] Khởi tạo nền tảng AI Project OS`.
- [x] Lấy commit hash sau commit.

## Đóng task

- [x] Xác nhận Definition of Done đã đủ.
- [x] Xác nhận không còn `[~]` hoặc `[!]`.
- [x] Xác nhận không còn mục bắt buộc `[ ]`.
- [x] Xác nhận task không bắt đầu `P0-T2`.

## Chuẩn bị handoff

- [x] Báo cáo file đã tạo hoặc sửa.
- [x] Báo cáo kiểm thử đã chạy.
- [x] Báo cáo kết quả kiểm thử.
- [x] Báo cáo commit hash.
- [x] Báo cáo task tiếp theo.
- [x] Báo cáo giới hạn hoặc vấn đề còn lại nếu có.
