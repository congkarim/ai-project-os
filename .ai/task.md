# Task hiện tại

## ID

`P0-T3`

## Tên task

Chốt AI Project OS v0.1.

## Phase

Phase 0 - Foundation.

## Trạng thái

`DONE`

## Mục tiêu

Chốt baseline tài liệu `v0.1.0` của AI Project OS sau khi hoàn thành nền tảng Phase 0, xác nhận phạm vi phiên bản đầu và điều kiện chuyển sang Phase 1.

## Bối cảnh

`P0-T1` đã tạo cấu trúc và template ban đầu. `P0-T2` đã rà soát schema và giảm trùng lặp. `P0-T3` cần xác nhận bộ khung hiện đủ ổn định để dùng làm baseline v0.1, nhưng chưa phát hành `v1.0.0`, chưa gắn Git tag và chưa tạo automation.

## Phạm vi

- Rà soát trạng thái Phase 0 trong roadmap.
- Ghi rõ phiên bản hiện tại `v0.1.0` trong tài liệu chính.
- Chốt phạm vi v0.1: tài liệu Markdown, global rule và starter template.
- Ghi rõ giới hạn v0.1: chưa có script cài đặt, kiểm tra schema tự động, package release hoặc Git tag.
- Ghi quyết định dài hạn nếu cần.
- Cập nhật `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`, `.ai/plan.md`.
- Chạy kiểm thử tài liệu và Git.
- Commit task `P0-T3`.

## Ngoài phạm vi

- Không tạo script cài đặt.
- Không tạo package release.
- Không gắn Git tag.
- Không bắt đầu `P1-T1`.
- Không triển khai tính năng nghiệp vụ, ứng dụng web, API hoặc giao diện.

## Đầu vào

- Commit `P0-T1`: `746bb3bab865a141e1e3b4cd93e73ac9f944c0f0`.
- Commit `P0-T2`: `60ef09988b2ee6ea4ac622818491dc54b9777e73`.
- Roadmap Phase 0.
- README và bộ template hiện có.
- ADR hiện có.

## Đầu ra

- Tài liệu ghi nhận baseline `v0.1.0`.
- Roadmap ghi Phase 0 hoàn thành sau `P0-T3`.
- Task tiếp theo dự kiến là `P1-T1`.
- ADR ghi rõ v0.1 là baseline tài liệu thủ công nếu cần.
- Kết quả kiểm thử được ghi lại.
- Commit Git cho task `P0-T3`.

## Cách thực hiện đã chốt

Chốt v0.1 bằng cập nhật tài liệu, không tạo artifact phát hành tự động. Ghi rõ phạm vi, giới hạn và cách phân phối thủ công của baseline v0.1. Sau khi kiểm thử đạt, chuyển `P0-T3` sang `DONE`, rút gọn `plan.md`, stage đúng file và commit.

## Tiêu chí chấp nhận

- README nêu rõ phiên bản hiện tại `v0.1.0` và phạm vi của phiên bản này.
- `.ai/context.md` nêu cách phân phối v0.1 là sao chép thủ công.
- `.ai/roadmap.md` ghi `P0-T1`, `P0-T2`, `P0-T3` là `DONE` khi đóng task và Phase 0 là `DONE`.
- `.ai/task.md`, `.ai/task-checklist.md` và `.ai/plan.md` thống nhất về `P0-T3`.
- Task tiếp theo dự kiến là `P1-T1`.
- Không có script, package release hoặc Git tag mới.
- Starter template vẫn không chứa thông tin riêng của AI Project OS.
- Global rule vẫn không chứa trạng thái task cụ thể.
- Không có file rỗng.
- Markdown cơ bản không lỗi.
- `git diff --check` đạt.
- Git diff đã được xem lại.
- Commit được tạo với thông điệp `[P0-T3] Chốt AI Project OS v0.1`.

## Kiểm thử bắt buộc

- Chạy `git status --short` trước khi sửa và trước khi stage.
- Kiểm tra không có file rỗng.
- Kiểm tra Markdown cơ bản.
- Tìm `v0.1.0`, `P0-T3`, `P1-T1`.
- Kiểm tra starter không chứa thông tin riêng như tên `AI Project OS`.
- Kiểm tra global rule không chứa trạng thái task cụ thể.
- Kiểm tra không có script mới.
- Kiểm tra không có Git tag mới.
- Kiểm tra thống nhất `P0-T3` giữa roadmap, task và checklist.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Rủi ro

- Chốt v0.1 có thể bị hiểu nhầm là release package dù Phase 3 mới phát hành chính thức.
- Ghi trạng thái Phase 0 quá sớm nếu checklist chưa đóng đủ.
- Thêm quá nhiều nội dung release có thể lấn sang Phase 3.

## Blocker

Chưa có blocker đã xác nhận.

## Kết quả task trước

`P0-T2` đã rà soát schema, giảm trùng lặp và commit `60ef09988b2ee6ea4ac622818491dc54b9777e73`.

## Task tiếp theo dự kiến

`P1-T1` - Thiết kế cơ chế cài đặt vào repository mới.

## Kết quả thực hiện

Đã chốt baseline `v0.1.0` của AI Project OS:

- README ghi rõ phiên bản hiện tại, phạm vi `v0.1.0` và giới hạn chưa có script, package release hoặc Git tag.
- `.ai/context.md` ghi rõ cách phân phối `v0.1.0` là sao chép thủ công và các phần automation/release thuộc Phase 1/Phase 3.
- `.ai/decisions.md` bổ sung `ADR-003` để chốt `v0.1.0` là baseline tài liệu thủ công.
- `.ai/roadmap.md` ghi `P0-T1`, `P0-T2`, `P0-T3` là `DONE`; Phase 0 là `DONE`; task tiếp theo dự kiến là `P1-T1`.
- Không tạo script, package release hoặc Git tag.

Kết quả kiểm thử chính:

- `find ... -size 0`: không có file rỗng.
- Kiểm tra H1 và code fence Markdown: không phát hiện lỗi.
- `rg` tìm `v0.1.0`, `P0-T3`, `P1-T1`, `ADR-003`: đạt.
- `rg` trong `starter/`: không phát hiện `AI Project OS`, `ai-project-os`, `P0-T3`, `P1-T*` hoặc `v0.1.0`.
- `rg` trong `global/AGENTS.md`: không phát hiện trạng thái task cụ thể.
- `find` tìm script mới với các đuôi `.sh`, `.ps1`, `.py`, `.js`, `.ts`: không có kết quả.
- `git tag --list`: không có tag.
- `rg` trong `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`: thống nhất `P0-T3`.
- `git diff --check`: không phát hiện lỗi whitespace.
- Đã xem lại diff trước khi commit.

## Ngày bắt đầu

2026-07-23.

## Ngày hoàn thành

2026-07-23.
