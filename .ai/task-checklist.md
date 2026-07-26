# Checklist task P3-T3

Ký hiệu:

- `[ ]` Chưa hoàn thành
- `[x]` Đã hoàn thành
- `[~]` Đang thực hiện
- `[!]` Bị chặn
- `[-]` Không áp dụng

Trước khi đóng task, không được còn `[~]` hoặc `[!]`.

## Chuẩn bị

- [x] Xác nhận task tiếp theo từ `P3-T2` là `P3-T3`.
- [x] Đọc `AGENTS.md`.
- [x] Đọc `.ai/context.md`.
- [x] Đọc `.ai/roadmap.md`.
- [x] Đọc `.ai/task.md`.
- [x] Đọc `.ai/task-checklist.md`.
- [x] Đọc `.ai/plan.md`.
- [x] Đọc `.ai/decisions.md` khi cần.
- [x] Chạy `git status --short` trước khi sửa.
- [x] Xác nhận `gh` đã đăng nhập.

## Thiết kế

- [x] Chốt gắn annotated tag `v1.0.0` vào commit đóng gói `P3-T2`.
- [x] Chốt push `master` + tag và tạo GitHub Release.
- [x] Chốt không force-push và không đổi số phiên bản.
- [x] Cụ thể hóa checklist và triển khai.

## Phát hành

- [x] Cập nhật README/context/release notes cho trạng thái đã phát hành.
- [x] Đánh dấu Phase 3 và `P3-T3` hoàn thành trong roadmap.
- [x] Commit tài liệu `[P3-T3]`.
- [x] Tạo annotated tag `v1.0.0`.
- [x] Push `master` lên `origin`.
- [x] Push tag `v1.0.0` lên `origin`.
- [x] Tạo GitHub Release `v1.0.0`.
- [x] Xác minh `gh release view v1.0.0`.

## Kiểm tra repository chính

- [x] Kiểm tra `VERSION` vẫn là `1.0.0`.
- [x] Kiểm tra không có file rỗng trong phạm vi sửa.
- [x] Kiểm tra Markdown cơ bản.
- [x] Kiểm tra thống nhất `P3-T3` / Phase 3 `DONE`.
- [x] Chạy `git diff --check`.
- [x] Xem lại toàn bộ `git diff` trước commit tài liệu.

## Cập nhật tài liệu trạng thái

- [x] Ghi kết quả vào `.ai/task.md`.
- [x] Rút gọn `.ai/plan.md` sau khi hoàn thành task.
- [x] Cập nhật checklist sau khi kiểm thử đạt.

## Đóng task

- [x] Xác nhận Definition of Done đã đủ.
- [x] Xác nhận không còn `[~]` hoặc `[!]`.
- [x] Xác nhận không còn mục bắt buộc `[ ]`.

## Chuẩn bị handoff

- [x] Báo cáo tag và URL release.
- [x] Báo cáo commit hash.
- [x] Báo cáo Phase 3 đã hoàn thành.
- [x] Báo cáo giới hạn còn lại nếu có.
