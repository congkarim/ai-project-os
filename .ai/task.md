# Task hiện tại

## ID

`P0-T1`

## Tên task

Khởi tạo nền tảng AI Project OS.

## Phase

Phase 0 - Foundation.

## Trạng thái

`DONE`

## Mục tiêu

Xây dựng bộ quy tắc và template quản lý dự án để có thể tái sử dụng trong mọi repository làm việc với Codex hoặc coding agent khác.

## Bối cảnh

Repository này là nguồn chính của AI Project OS. Task đầu tiên cần tạo cấu trúc tài liệu nền tảng, quy định workflow cho agent, template starter và hướng dẫn sử dụng. Không triển khai tính năng nghiệp vụ, ứng dụng web, API, giao diện hoặc automation.

## Phạm vi

- Tạo `AGENTS.md` tại root.
- Tạo `README.md`.
- Tạo bộ tài liệu `.ai/` cho repository này.
- Tạo `global/AGENTS.md`.
- Tạo bộ template sạch trong `starter/`.
- Chạy kiểm thử tài liệu bắt buộc.
- Cập nhật trạng thái và commit task.

## Ngoài phạm vi

- Script cài đặt.
- Tự động hóa kiểm tra schema.
- Ứng dụng web hoặc API.
- Tích hợp CI/CD.
- Git remote.
- Thay đổi Git identity global.

## Đầu vào

- Yêu cầu task `P0-T1`.
- Cấu trúc repository cần tạo.
- Schema bắt buộc cho các file `.ai/`.
- Quy tắc Git và kiểm thử bắt buộc.

## Đầu ra

- Cấu trúc file AI Project OS đầy đủ.
- Nội dung tài liệu tiếng Việt, UTF-8.
- Starter template sạch có placeholder rõ ràng.
- Kết quả kiểm thử được ghi lại.
- Commit Git cho task `P0-T1`.

## Cách thực hiện đã chốt

Tạo tài liệu Markdown thủ công theo schema bắt buộc. Không tạo script cài đặt. Kiểm tra bằng các lệnh shell đơn giản và Git. Sau khi kiểm thử đạt, cập nhật trạng thái `P0-T1` thành `DONE`, rút gọn `plan.md`, stage từng file cụ thể và commit.

## Tiêu chí chấp nhận

- Tất cả file bắt buộc tồn tại.
- Không có file rỗng.
- `AGENTS.md` chứa trình tự khởi động, vòng đời task, Definition of Done, quy tắc Git, quy tắc kiến trúc và quy tắc giao tiếp.
- `.ai/context.md` có nội dung thực tế cho AI Project OS.
- `.ai/roadmap.md` có đủ các phase và task ban đầu.
- `.ai/task.md` chỉ hiển thị task hiện tại, có task trước và task sau.
- `.ai/task-checklist.md` cụ thể đến từng file và kiểm tra.
- `.ai/plan.md` dùng làm không gian làm việc và được rút gọn khi hoàn thành.
- `.ai/decisions.md` có `ADR-001` và `ADR-002`.
- `global/AGENTS.md` ngắn hơn project-level rule và không chứa trạng thái task cụ thể.
- `starter/` là template sạch, không chứa thông tin riêng của AI Project OS.
- `README.md` có đủ hướng dẫn sử dụng.
- Kiểm thử bắt buộc đạt.
- Commit được tạo với thông điệp `[P0-T1] Khởi tạo nền tảng AI Project OS`.

## Kiểm thử bắt buộc

- Liệt kê cây thư mục.
- Xác nhận tất cả file bắt buộc tồn tại.
- Kiểm tra không có file rỗng.
- Kiểm tra Markdown cơ bản.
- Tìm các từ khóa bắt buộc.
- Kiểm tra starter không chứa thông tin riêng như tên `AI Project OS`, ngoại trừ phần giải thích chung thực sự cần thiết.
- Kiểm tra global rule không chứa trạng thái task cụ thể.
- Kiểm tra `roadmap.md`, `task.md` và `task-checklist.md` thống nhất về `P0-T1`.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Rủi ro

- Git identity chưa cấu hình có thể làm commit thất bại.
- Checklist đóng task có thể cần cập nhật sau khi kiểm thử hoàn tất để tránh tự mâu thuẫn.
- Starter template có thể vô tình chứa thông tin riêng của repository này.

## Blocker

Chưa có blocker đã xác nhận.

## Kết quả task trước

Không có. Đây là task đầu tiên của repository.

## Task tiếp theo dự kiến

`P0-T2` - Rà soát schema và loại bỏ nội dung trùng lặp.

## Kết quả thực hiện

Đã tạo đầy đủ cấu trúc AI Project OS:

- Root rule và hướng dẫn: `AGENTS.md`, `README.md`.
- Bộ quản lý dự án chính: `.ai/context.md`, `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`, `.ai/plan.md`, `.ai/decisions.md`.
- Global rule: `global/AGENTS.md`.
- Starter template sạch: `starter/AGENTS.md` và `starter/.ai/`.

Kết quả kiểm thử chính:

- `find . -path ./.git -prune -o -path ./.agents -prune -o -path ./.codex -prune -o -print`: liệt kê đúng cấu trúc bắt buộc.
- Vòng lặp `test -f`: tất cả file bắt buộc tồn tại.
- `find ... -size 0`: không có file rỗng.
- Kiểm tra H1 và code fence Markdown: không phát hiện lỗi.
- `rg` từ khóa bắt buộc: tìm thấy `Definition of Done`, `git status --short`, `Không dùng git add .`, `task.md`, `task-checklist.md`, `plan.md`, `decisions.md`.
- `rg` trong `starter/`: không phát hiện `AI Project OS`, `ai-project-os` hoặc trạng thái task riêng của dự án chính.
- `rg` trong `global/AGENTS.md`: không phát hiện task cụ thể.
- `rg` trong `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`: thống nhất `P0-T1`.
- `git diff --check`: không phát hiện lỗi whitespace.
- Đã xem lại diff trước khi commit.

## Ngày bắt đầu

2026-07-23.

## Ngày hoàn thành

2026-07-23.
