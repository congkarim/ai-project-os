# Task hiện tại

## ID

`P2-T1`

## Tên task

Thử nghiệm trên một repository mẫu.

## Phase

Phase 2 - Validation.

## Trạng thái

`DONE`

## Mục tiêu

Thử nghiệm áp dụng AI Project OS vào một Git repository mẫu để xác nhận script cài đặt và starter tạo được bộ khung quản lý dự án sạch, dễ tiếp quản.

## Bối cảnh

Phase 1 đã hoàn thành cơ chế cài đặt và kiểm thử idempotency của script Bash. PowerShell đã được kiểm tra tĩnh do môi trường hiện chưa có `pwsh`. Phase 2 cần xác nhận workflow thực tế trên repository mẫu trước khi thử trên dự án đang phát triển.

## Phạm vi

- Tạo Git repository mẫu trong `/tmp`.
- Chạy `scripts/install.sh` với `--dry-run` và cài thật bằng `--yes`.
- Kiểm tra các file starter được tạo trong repo mẫu.
- Kiểm tra nội dung starter không lẫn trạng thái riêng của AI Project OS.
- Mô phỏng agent startup trong repo mẫu bằng cách đọc `AGENTS.md` và `.ai/`.
- Chạy lại script để xác nhận idempotency trong repo mẫu.
- Ghi kết quả thử nghiệm vào tài liệu trạng thái.
- Commit task `P2-T1`.

## Ngoài phạm vi

- Không dùng repository mẫu để phát triển app.
- Không thử trên dự án đang phát triển thật; phần đó thuộc `P2-T2`.
- Không chạy PowerShell runtime nếu môi trường vẫn không có `pwsh`.
- Không tạo package release hoặc Git tag.

## Đầu vào

- `starter/`.
- `scripts/install.sh`.
- `docs/install-design.md`.
- Kết quả `P1-T4`.

## Đầu ra

- Kết quả thử nghiệm repository mẫu được ghi lại.
- Roadmap, task, checklist và plan thống nhất cho `P2-T1`.
- Commit Git cho task `P2-T1`.

## Cách thực hiện đã chốt

Tạo repo mẫu trong `/tmp`, cài AI Project OS bằng script Bash, kiểm tra cấu trúc file và nội dung starter, sau đó chạy lại script để xác nhận repo mẫu không bị thay đổi thêm.

## Tiêu chí chấp nhận

- Repository mẫu là Git repository hợp lệ.
- Dry-run không ghi file vào repo mẫu.
- Cài thật tạo `AGENTS.md` và đủ file `.ai/`.
- File được tạo trong repo mẫu giống nguồn từ `starter/`.
- Starter không chứa trạng thái riêng của AI Project OS.
- Agent startup trong repo mẫu có đủ file cần đọc theo `AGENTS.md`.
- Chạy lại script không tạo thay đổi mới.
- Roadmap, task và checklist thống nhất `P2-T1`.
- Task tiếp theo dự kiến là `P2-T2`.
- Markdown cơ bản không lỗi.
- `git diff --check` đạt.
- Commit được tạo với thông điệp `[P2-T1] Thử nghiệm trên repository mẫu`.

## Kiểm thử bắt buộc

- Chạy `git status --short` trước khi sửa và trước khi stage.
- Tạo repo mẫu trong `/tmp`.
- Chạy dry-run và xác nhận không tạo file.
- Chạy cài thật và xác nhận đủ file.
- So sánh file repo mẫu với `starter/`.
- Đọc file repo mẫu theo trình tự startup.
- Chạy lại cài đặt và xác nhận idempotency.
- Kiểm tra không có file rỗng.
- Kiểm tra Markdown cơ bản.
- Kiểm tra thống nhất `P2-T1` giữa roadmap, task và checklist.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Rủi ro

- Repo mẫu quá đơn giản có thể chưa đại diện đầy đủ cho dự án thật; `P2-T2` sẽ xử lý rủi ro này.
- Nếu starter có placeholder quá chung hoặc thiếu hướng dẫn, cần ghi nhận và sửa trong phạm vi task.

## Blocker

Chưa có blocker.

## Kết quả task trước

`P1-T4` đã kiểm thử idempotency script cài đặt và commit `e258fc068322fc7b5a29c8fd4b18458985bae3a4`.

## Task tiếp theo dự kiến

`P2-T2` - Thử nghiệm trên một dự án đang phát triển.

## Kết quả thực hiện

Đã thử nghiệm AI Project OS trên một Git repository mẫu trong `/tmp`.

Kết quả thử nghiệm:

- Tạo Git repository mẫu thành công.
- Dry-run bằng `scripts/install.sh --target <repo-mau> --dry-run` thoát `0` và không tạo `AGENTS.md` hoặc `.ai/`.
- Cài thật bằng `scripts/install.sh --target <repo-mau> --yes` thoát `0`.
- Repo mẫu có `AGENTS.md` và đủ file `.ai/context.md`, `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`, `.ai/plan.md`, `.ai/decisions.md`.
- Các file được tạo trong repo mẫu giống nguồn trong `starter/`.
- Các file startup trong repo mẫu đều không rỗng và đọc được.
- `AGENTS.md` trong repo mẫu có chỉ dẫn đọc `.ai/context.md`.
- Starter không lẫn trạng thái riêng của AI Project OS như `P1-T`, `P2-T`, `Phase 1`, `Phase 2`, `scripts/install` hoặc tên repo hiện tại.
- Chạy lại script thoát `0`, báo `unchanged` và không làm thay đổi `git status --short` của repo mẫu.

Tổng kết test repo mẫu: 20 pass, 0 fail.

Kiểm tra repository chính:

- Kiểm tra không có file rỗng: đạt.
- Kiểm tra Markdown cơ bản: đạt.
- Kiểm tra thống nhất `P2-T1` trong `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`: đạt.
- `git diff --check`: đạt.
- Đã xem lại toàn bộ diff trước khi commit.

## Ngày bắt đầu

2026-07-23.

## Ngày hoàn thành

2026-07-23.
