# Task hiện tại

## ID

`P3-T3`

## Tên task

Gắn Git tag và phát hành.

## Phase

Phase 3 - Release.

## Trạng thái

`DONE`

## Mục tiêu

Gắn Git tag `v1.0.0`, đẩy lên remote và tạo GitHub Release cho bản đã đóng gói ở `P3-T2`, rồi cập nhật tài liệu trạng thái để phản ánh đã phát hành.

## Bối cảnh

`P3-T2` đã chốt nội dung `v1.0.0` (`VERSION`, `CHANGELOG.md`, `docs/release-v1.0.0.md`). `P3-T3` hoàn tất Phase 3 bằng tag và phát hành công khai.

## Phạm vi

- Push commit đóng gói còn pending nếu cần.
- Tạo annotated Git tag `v1.0.0`.
- Push tag lên `origin`.
- Tạo GitHub Release `v1.0.0` từ changelog/release notes.
- Cập nhật README/context/release notes cho trạng thái đã phát hành.
- Đánh dấu Phase 3 hoàn thành trong roadmap.
- Commit tài liệu `P3-T3`.

## Ngoài phạm vi

- Không đổi số phiên bản sang bản mới hơn `1.0.0`.
- Không sửa logic script cài đặt.
- Không thêm CI/CD.
- Không force-push.

## Đầu vào

- Commit đóng gói `P3-T2`.
- `VERSION`, `CHANGELOG.md`, `docs/release-v1.0.0.md`.
- Remote `origin` và `gh` đã xác thực.

## Đầu ra

- Tag `v1.0.0` trên remote.
- GitHub Release `v1.0.0`.
- Tài liệu phản ánh đã phát hành.
- Phase 3 `DONE`.
- Commit Git cho task `P3-T3`.

## Cách thực hiện đã chốt

Gắn annotated tag `v1.0.0` vào commit đóng gói `P3-T2`, push tag, tạo GitHub Release, rồi cập nhật tài liệu và commit `P3-T3`.

## Tiêu chí chấp nhận

- Có annotated tag `v1.0.0` trỏ tới commit phát hành.
- Tag đã được push lên `origin`.
- GitHub Release `v1.0.0` tồn tại và mở.
- README/context không còn nói tag/release thuộc task chưa làm.
- Phase 3 và `P3-T3` ở trạng thái `DONE` trong roadmap.
- Không còn task Phase 3 ở `TODO`.
- Markdown cơ bản không lỗi.
- `git diff --check` đạt.
- Commit được tạo với thông điệp `[P3-T3] Gắn Git tag và phát hành v1.0.0`.

## Kiểm thử bắt buộc

- Chạy `git status --short` trước khi sửa và trước khi stage.
- Kiểm tra `git tag -l v1.0.0`.
- Kiểm tra tag trên remote sau push.
- Kiểm tra GitHub Release bằng `gh release view v1.0.0`.
- Kiểm tra thống nhất `P3-T3` / Phase 3 `DONE`.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Rủi ro

- Tag gắn nhầm commit nếu còn thay đổi chưa commit.
- Remote có thể từ chối push nếu quyền thiếu; hiện `gh` đã login với scope `repo`.

## Blocker

Không có blocker.

## Kết quả task trước

`P3-T2` đã đóng gói `v1.0.0` và commit `973aef7e91ba4aa48c2c22ebde42ffecdcbfa52b`.

## Task tiếp theo dự kiến

Không có task roadmap tiếp theo; Phase 3 hoàn thành.

## Kết quả thực hiện

Đã gắn tag và phát hành `v1.0.0`.

Kết quả phát hành:

- Annotated tag `v1.0.0` trỏ tới commit `973aef7e91ba4aa48c2c22ebde42ffecdcbfa52b` (`[P3-T2] Đóng gói phiên bản v1.0.0`).
- Tag đã push lên `origin`.
- GitHub Release: https://github.com/congkarim/ai-project-os/releases/tag/v1.0.0
- `VERSION` vẫn là `1.0.0`.
- README, context và `docs/release-v1.0.0.md` đã cập nhật trạng thái đã phát hành.
- Phase 3 đánh dấu `DONE`.

Kiểm thử:

- `git tag -l v1.0.0`: đạt.
- `git ls-remote --tags origin v1.0.0`: đạt.
- `gh release view v1.0.0`: đạt.
- Thống nhất `P3-T3` / Phase 3 `DONE`: đạt.
- `git diff --check`: đạt.
- Đã xem lại toàn bộ diff trước khi commit tài liệu.

## Ngày bắt đầu

2026-07-26.

## Ngày hoàn thành

2026-07-26.
