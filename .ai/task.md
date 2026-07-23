# Task hiện tại

## ID

`P0-T2`

## Tên task

Rà soát schema và loại bỏ nội dung trùng lặp.

## Phase

Phase 0 - Foundation.

## Trạng thái

`DONE`

## Mục tiêu

Rà soát các schema và hướng dẫn đã tạo ở `P0-T1`, xác định nguồn sự thật cho từng loại nội dung, loại bỏ hoặc rút gọn các đoạn trùng lặp không cần thiết mà vẫn giữ template đủ dùng cho repository mới.

## Bối cảnh

`P0-T1` đã tạo bộ tài liệu nền tảng đầy đủ. Vì nhiều file cùng mô tả workflow, Git rule, Definition of Done và schema task, cần một vòng rà soát để giảm nguy cơ lệch nội dung khi bảo trì thủ công.

## Phạm vi

- Rà soát `AGENTS.md`, `README.md`, `.ai/*.md`, `global/AGENTS.md`, `starter/AGENTS.md` và `starter/.ai/*.md`.
- Xác định vai trò nguồn sự thật của từng nhóm file.
- Rút gọn nội dung lặp giữa README và rule file.
- Giữ starter template độc lập, có placeholder rõ ràng.
- Cập nhật roadmap, task, checklist và plan cho `P0-T2`.
- Chạy kiểm thử tài liệu và Git.
- Commit task `P0-T2`.

## Ngoài phạm vi

- Không tạo script cài đặt.
- Không tạo automation kiểm tra schema.
- Không đổi cấu trúc thư mục đã chốt ở `P0-T1`.
- Không thêm file trạng thái mới như `state.yaml` hoặc `session.md`.
- Không triển khai tính năng nghiệp vụ, ứng dụng web, API hoặc giao diện.

## Đầu vào

- Kết quả `P0-T1`.
- Các file Markdown hiện có trong root, `.ai/`, `global/` và `starter/`.
- Quyết định `ADR-001` và `ADR-002`.

## Đầu ra

- Tài liệu đã được rà soát và giảm trùng lặp có chủ đích.
- `README.md` rõ vai trò hướng dẫn sử dụng, không lặp toàn bộ rule vận hành.
- `AGENTS.md`, `global/AGENTS.md` và `starter/AGENTS.md` vẫn giữ đúng chức năng riêng.
- `.ai/task.md`, `.ai/task-checklist.md`, `.ai/plan.md` phản ánh `P0-T2`.
- Kết quả kiểm thử được ghi lại.
- Commit Git cho task `P0-T2`.

## Cách thực hiện đã chốt

Rà soát bằng các lệnh thống kê Markdown và tìm nội dung lặp, sau đó chỉnh thủ công các đoạn hướng dẫn bị trùng. Không thay đổi ADR đã chốt nếu không có quyết định kiến trúc mới. Sau kiểm thử đạt, chuyển `P0-T2` sang `DONE`, rút gọn `plan.md`, stage đúng file và commit.

## Tiêu chí chấp nhận

- `roadmap.md`, `task.md` và `task-checklist.md` thống nhất về `P0-T2`.
- `P0-T1` vẫn được ghi nhận là `DONE`.
- README không lặp chi tiết toàn bộ workflow đã có trong `AGENTS.md`.
- Root `AGENTS.md` vẫn là nguồn sự thật cho workflow của repository này.
- `global/AGENTS.md` vẫn là rule chung ngắn, không chứa trạng thái task cụ thể.
- `starter/` không chứa thông tin riêng của AI Project OS.
- Không có file rỗng.
- Markdown cơ bản không lỗi.
- `git diff --check` đạt.
- Git diff đã được xem lại.
- Commit được tạo với thông điệp `[P0-T2] Rà soát schema và giảm trùng lặp`.

## Kiểm thử bắt buộc

- Chạy `git status --short` trước khi sửa và trước khi stage.
- Thống kê dòng Markdown bằng `wc -l`.
- Tìm dòng lặp bằng `awk`.
- Tìm keyword/rule quan trọng bằng `rg`.
- Kiểm tra `starter/` không chứa thông tin riêng của AI Project OS.
- Kiểm tra `global/AGENTS.md` không chứa trạng thái task cụ thể.
- Kiểm tra không có file rỗng.
- Kiểm tra Markdown cơ bản.
- Kiểm tra thống nhất `P0-T2` giữa roadmap, task và checklist.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Rủi ro

- Rút gọn quá mức có thể làm starter mất khả năng dùng độc lập.
- Xóa nhầm rule bắt buộc có thể làm agent thiếu chỉ dẫn.
- Nội dung task/checklist có thể tự mâu thuẫn nếu đánh dấu đóng task trước khi commit.

## Blocker

Chưa có blocker đã xác nhận.

## Kết quả task trước

`P0-T1` đã khởi tạo đầy đủ cấu trúc AI Project OS và commit `746bb3bab865a141e1e3b4cd93e73ac9f944c0f0`.

## Task tiếp theo dự kiến

`P0-T3` - Chốt AI Project OS v0.1.

## Kết quả thực hiện

Đã rà soát schema và nội dung lặp trong toàn bộ tài liệu Markdown:

- Rút gọn `README.md` từ 130 xuống 110 dòng, bỏ phần sao chép chi tiết workflow đã có trong `AGENTS.md`.
- Bổ sung mục "Nguồn sự thật" trong `README.md` để phân rõ vai trò của `AGENTS.md`, `.ai/*.md`, README, global rule và starter.
- Cập nhật `AGENTS.md` để bỏ ràng buộc gắn riêng với `P0-T1`, thay bằng rule dài hạn về phạm vi repository và automation.
- Cập nhật `.ai/context.md` để kiểm thử và ràng buộc không còn gắn cứng vào `P0-T1`.
- Mở và đóng đầy đủ trạng thái `P0-T2` trong `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md` và `.ai/plan.md`.

Kết quả kiểm thử chính:

- `wc -l`: tổng Markdown giảm từ 1.439 xuống 1.401 dòng sau khi đóng task.
- `awk` tìm dòng lặp: các dòng còn lặp chủ yếu là fence Markdown, heading schema, bảng task và rule Git/secret cần có ở global/starter.
- `rg` keyword/rule: các rule quan trọng vẫn tồn tại.
- `rg` trong `starter/`: không phát hiện `AI Project OS`, `ai-project-os` hoặc task riêng của repository chính.
- `rg` trong `global/AGENTS.md`: không phát hiện trạng thái task cụ thể.
- `find ... -size 0`: không có file rỗng.
- Kiểm tra H1 và code fence Markdown: không phát hiện lỗi.
- `rg` trong `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`: thống nhất `P0-T2`.
- `git diff --check`: không phát hiện lỗi whitespace.
- Đã xem lại diff trước khi commit.

## Ngày bắt đầu

2026-07-23.

## Ngày hoàn thành

2026-07-23.
