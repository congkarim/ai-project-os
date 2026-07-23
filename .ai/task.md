# Task hiện tại

## ID

`P1-T1`

## Tên task

Thiết kế cơ chế cài đặt vào repository mới.

## Phase

Phase 1 - Automation.

## Trạng thái

`DONE`

## Mục tiêu

Thiết kế cơ chế cài đặt AI Project OS vào repository mới hoặc repository đang có theo cách an toàn, idempotent và bảo toàn file hiện hữu.

## Bối cảnh

Phase 0 đã chốt baseline `v0.1.0` dưới dạng tài liệu thủ công. Phase 1 bắt đầu bằng thiết kế trước khi viết script cho Linux/macOS và Windows PowerShell. Task này chỉ tạo tài liệu thiết kế, không triển khai script.

## Phạm vi

- Thiết kế project mode để cài `starter/AGENTS.md` và `starter/.ai/`.
- Thiết kế global mode để cài `global/AGENTS.md`.
- Thiết kế dry-run, backup, overwrite và conflict handling.
- Thiết kế nguyên tắc idempotency.
- Thiết kế tham số, mã kết thúc và kiểm thử cho script sau này.
- Cập nhật README, context, roadmap, task, checklist, plan và decisions nếu cần.
- Commit task `P1-T1`.

## Ngoài phạm vi

- Không viết script Linux/macOS.
- Không viết script Windows PowerShell.
- Không chạy cài đặt vào repository khác.
- Không tạo package release.
- Không gắn Git tag.
- Không sửa global Codex config thật.

## Đầu vào

- Baseline `v0.1.0`.
- `starter/AGENTS.md` và `starter/.ai/`.
- `global/AGENTS.md`.
- ADR hiện có.
- Roadmap Phase 1.

## Đầu ra

- `docs/install-design.md` mô tả cơ chế cài đặt.
- README trỏ tới tài liệu thiết kế cài đặt.
- Context cập nhật về tài liệu thiết kế automation.
- ADR mới nếu quyết định cài đặt có tác động dài hạn.
- Kết quả kiểm thử được ghi lại.
- Commit Git cho task `P1-T1`.

## Cách thực hiện đã chốt

Tạo tài liệu thiết kế trước, không viết script. Cơ chế cài đặt mặc định không ghi đè, có dry-run bắt buộc, hỗ trợ backup/overwrite rõ ràng và dùng `starter/` làm nguồn project-level install.

## Tiêu chí chấp nhận

- Có tài liệu thiết kế cài đặt.
- Tài liệu thiết kế nêu project mode, global mode và dry-run.
- Tài liệu thiết kế nêu chính sách không ghi đè mặc định.
- Tài liệu thiết kế nêu backup, overwrite, conflict handling và idempotency.
- Tài liệu thiết kế nêu tham số, mã kết thúc và kiểm thử cho script sau này.
- Không có script mới.
- README và context trỏ tới tài liệu thiết kế.
- Roadmap, task và checklist thống nhất `P1-T1`.
- Task tiếp theo dự kiến là `P1-T2`.
- Markdown cơ bản không lỗi.
- `git diff --check` đạt.
- Commit được tạo với thông điệp `[P1-T1] Thiết kế cơ chế cài đặt`.

## Kiểm thử bắt buộc

- Chạy `git status --short` trước khi sửa và trước khi stage.
- Kiểm tra `docs/install-design.md` tồn tại và không rỗng.
- Kiểm tra tài liệu có các từ khóa `dry-run`, `backup`, `overwrite`, `conflict`, `idempotency`.
- Kiểm tra không có script mới.
- Kiểm tra không có file rỗng.
- Kiểm tra Markdown cơ bản.
- Kiểm tra starter không chứa thông tin riêng của AI Project OS.
- Kiểm tra global rule không chứa trạng thái task cụ thể.
- Kiểm tra thống nhất `P1-T1` giữa roadmap, task và checklist.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Rủi ro

- Thiết kế quá phức tạp có thể làm script sau này khó triển khai đồng nhất.
- Thiết kế quá lỏng có thể không bảo toàn file người dùng.
- Chọn sai mặc định overwrite có thể gây mất dữ liệu.

## Blocker

Chưa có blocker đã xác nhận.

## Kết quả task trước

`P0-T3` đã chốt AI Project OS `v0.1.0` và commit `d876de8e98e2e1f54058bc63cbcf33f434925f40`.

## Task tiếp theo dự kiến

`P1-T2` - Viết script cài đặt cho Linux/macOS.

## Kết quả thực hiện

Đã thiết kế cơ chế cài đặt AI Project OS:

- Tạo `docs/install-design.md` làm tài liệu thiết kế cho script Phase 1.
- Thiết kế project mode để cài `starter/AGENTS.md` và `starter/.ai/`.
- Thiết kế global mode để cài `global/AGENTS.md`.
- Chốt mặc định không ghi đè file đã tồn tại và khác nguồn.
- Chốt dry-run, backup, overwrite, conflict handling và idempotency.
- Mô tả tham số, mã kết thúc và danh sách kiểm thử cho script sau này.
- Cập nhật README và context để trỏ tới tài liệu thiết kế.
- Bổ sung `ADR-004` về mặc định không ghi đè khi cài đặt.
- Không tạo script mới.

Kết quả kiểm thử chính:

- `test -s docs/install-design.md`: tài liệu thiết kế tồn tại và không rỗng.
- `rg` tìm `dry-run`, `backup`, `overwrite`, `conflict`, `idempotency`: đạt.
- `find` tìm script mới với các đuôi `.sh`, `.ps1`, `.py`, `.js`, `.ts`: không có kết quả.
- `find ... -size 0`: không có file rỗng.
- Kiểm tra H1 và code fence Markdown: không phát hiện lỗi.
- `rg` trong `starter/`: không phát hiện `AI Project OS`, `ai-project-os`, `P1-T1`, `P1-T2` hoặc `v0.1.0`.
- `rg` trong `global/AGENTS.md`: không phát hiện trạng thái task cụ thể.
- `rg` trong `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`: thống nhất `P1-T1`.
- `git diff --check`: không phát hiện lỗi whitespace.
- Đã xem lại diff trước khi commit.

## Ngày bắt đầu

2026-07-23.

## Ngày hoàn thành

2026-07-23.
