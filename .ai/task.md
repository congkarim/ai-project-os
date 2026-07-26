# Task hiện tại

## ID

`P3-T2`

## Tên task

Đóng gói phiên bản `v1.0.0`.

## Phase

Phase 3 - Release.

## Trạng thái

`DONE`

## Mục tiêu

Chốt nội dung phát hành `v1.0.0` trong repository: phiên bản, changelog, danh mục thành phần và cập nhật baseline tài liệu, sẵn sàng cho gắn Git tag ở `P3-T3`.

## Bối cảnh

`P3-T1` đã hoàn thiện hướng dẫn. Baseline vẫn là `v0.1.0`. `P3-T2` chuyển sang đóng gói nội dung `v1.0.0` nhưng chưa gắn tag hay tạo GitHub Release.

## Phạm vi

- Tạo `VERSION` với giá trị `1.0.0`.
- Tạo `CHANGELOG.md` ghi nhận `v1.0.0`.
- Tạo ghi chú phát hành / danh mục thành phần trong `docs/`.
- Cập nhật baseline `v1.0.0` trong `README.md` và `.ai/context.md`.
- Ghi quyết định đóng gói vào `.ai/decisions.md` nếu cần.
- Đồng bộ tài liệu trạng thái `.ai/` cho `P3-T2`.
- Commit task `P3-T2`.

## Ngoài phạm vi

- Không gắn Git tag (`P3-T3`).
- Không tạo GitHub Release hay push tag (`P3-T3`).
- Không tạo package npm/pip hoặc artifact nén riêng.
- Không sửa logic script cài đặt trừ khi phát hiện lỗi blocker trong tài liệu phiên bản.

## Đầu vào

- Kết quả `P3-T1`.
- Thành phần hiện có: `AGENTS.md`, `.ai/`, `starter/`, `global/`, `scripts/`, `docs/`.
- ADR-003 và ADR-004.

## Đầu ra

- Bộ tài liệu đóng gói `v1.0.0` trong repository.
- Baseline tài liệu chuyển sang `v1.0.0`.
- Roadmap, task, checklist và plan thống nhất cho `P3-T2`.
- Commit Git cho task `P3-T2`.

## Cách thực hiện đã chốt

Đóng gói bằng `VERSION` + `CHANGELOG.md` + `docs/release-v1.0.0.md`, cập nhật baseline tài liệu, ghi ADR-005; không gắn tag.

## Tiêu chí chấp nhận

- Có file `VERSION` chứa `1.0.0`.
- Có `CHANGELOG.md` với mục `v1.0.0`.
- Có tài liệu danh mục thành phần phát hành trong `docs/`.
- `README.md` và `.ai/context.md` dùng baseline `v1.0.0`.
- Không còn tuyên bố baseline hiện tại là `v0.1.0` trong README/context.
- Ghi rõ tag/GitHub Release vẫn thuộc `P3-T3`.
- Roadmap, task và checklist thống nhất `P3-T2`.
- Task tiếp theo dự kiến là `P3-T3`.
- Không có file rỗng trong phạm vi sửa.
- Markdown cơ bản không lỗi.
- `git diff --check` đạt.
- Commit được tạo với thông điệp `[P3-T2] Đóng gói phiên bản v1.0.0`.

## Kiểm thử bắt buộc

- Chạy `git status --short` trước khi sửa và trước khi stage.
- Kiểm tra nội dung `VERSION`.
- Kiểm tra `CHANGELOG.md` có mục `v1.0.0`.
- Kiểm tra danh mục thành phần khớp file thực tế trong repo.
- Kiểm tra README/context dùng `v1.0.0`.
- Kiểm tra không có Git tag `v1.0.0` được tạo trong task này.
- Kiểm tra không có file rỗng trong phạm vi sửa.
- Kiểm tra Markdown cơ bản.
- Kiểm tra thống nhất `P3-T2` giữa roadmap, task và checklist.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Rủi ro

- Dễ lẫn với `P3-T3` nếu gắn tag sớm.
- Không tạo artifact nén/npm để tránh mở rộng phạm vi ngoài bộ khung tài liệu.

## Blocker

Không có blocker.

## Kết quả task trước

`P3-T1` đã hoàn thiện tài liệu hướng dẫn và commit `25d066b0c5a28088a3426e81d0fd93ac309f36d3`.

## Task tiếp theo dự kiến

`P3-T3` - Gắn Git tag và phát hành.

## Kết quả thực hiện

Đã đóng gói nội dung `v1.0.0` trong repository theo ADR-005.

Thành phần đóng gói:

- `VERSION` = `1.0.0`
- `CHANGELOG.md` với mục `[1.0.0] - 2026-07-26`
- `docs/release-v1.0.0.md` danh mục thành phần và ghi chú phát hành
- Baseline `v1.0.0` trong `README.md` và `.ai/context.md`
- ADR-005 ghi quyết định đóng gói source-tree versioned

Kiểm thử:

- `VERSION` đúng `1.0.0`: đạt.
- `CHANGELOG.md` có mục `1.0.0`: đạt.
- Danh mục thành phần khớp 22 file kiểm tra: đạt.
- README/context không còn baseline hiện tại `v0.1.0`: đạt.
- Chưa tạo Git tag `v1.0.0`: đạt.
- File trong phạm vi không rỗng: đạt.
- Thống nhất `P3-T2` giữa roadmap, task và checklist: đạt.
- `git diff --check`: đạt.
- Đã xem lại toàn bộ diff trước khi commit.

## Ngày bắt đầu

2026-07-26.

## Ngày hoàn thành

2026-07-26.
