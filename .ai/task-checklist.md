# Checklist task P2-T2

Ký hiệu:

- `[ ]` Chưa hoàn thành
- `[x]` Đã hoàn thành
- `[~]` Đang thực hiện
- `[!]` Bị chặn
- `[-]` Không áp dụng

Trước khi đóng task, không được còn `[~]` hoặc `[!]`.

## Chuẩn bị

- [x] Xác nhận task tiếp theo từ `P2-T1` là `P2-T2`.
- [x] Đọc `AGENTS.md`.
- [x] Đọc `.ai/context.md`.
- [x] Đọc `.ai/roadmap.md`.
- [x] Đọc `.ai/task.md`.
- [x] Đọc `.ai/task-checklist.md`.
- [x] Đọc `.ai/plan.md`.
- [x] Đọc `.ai/decisions.md`.
- [x] Chạy `git status --short` trước khi sửa.

## Thiết kế thử nghiệm

- [x] Chốt dùng repository hiện tại làm dự án đang phát triển.
- [x] Chốt chỉ chạy dry-run và install mặc định.
- [x] Chốt không dùng `--backup` hoặc `--overwrite` trên repository hiện tại.
- [x] Chốt dry-run có conflict trả mã khác `0` là hành vi hợp lệ.

## Thử nghiệm repository đang phát triển

- [x] Xác nhận repository bắt đầu sạch.
- [x] Chạy dry-run vào repository hiện tại.
- [x] Xác nhận dry-run báo conflict.
- [x] Xác nhận dry-run không đổi `git status --short`.
- [x] Chạy install mặc định với `--yes`.
- [x] Xác nhận install mặc định báo conflict.
- [x] Xác nhận install mặc định gợi ý `--backup` hoặc `--overwrite`.
- [x] Xác nhận install mặc định không đổi `git status --short`.
- [x] Xác nhận `AGENTS.md` không bị thay bằng starter.
- [x] Xác nhận `.ai/task.md` không bị thay bằng starter.

## Kiểm tra repository chính

- [x] Kiểm tra không có file rỗng.
- [x] Kiểm tra Markdown cơ bản.
- [x] Kiểm tra thống nhất `P2-T2` giữa roadmap, task và checklist.
- [x] Chạy `git diff --check`.
- [x] Xem lại toàn bộ `git diff`.

## Cập nhật tài liệu

- [x] Ghi kết quả thử nghiệm vào `.ai/task.md`.
- [x] Chuyển `P2-T2` thành `DONE` trong `.ai/roadmap.md` khi đủ DoD.
- [x] Đặt task tiếp theo dự kiến là `P2-T3`.
- [x] Rút gọn `.ai/plan.md` sau khi hoàn thành task.
- [x] Cập nhật checklist sau khi kiểm thử đạt.

## Kiểm tra Git

- [x] Chạy `git status --short` trước khi stage.
- [x] Stage chính xác file thuộc task, không dùng git add . trong mọi trường hợp.
- [x] Chạy `git diff --cached`.
- [x] Commit với thông điệp `[P2-T2] Thử nghiệm trên dự án đang phát triển`.
- [x] Lấy commit hash sau commit.

## Đóng task

- [x] Xác nhận Definition of Done đã đủ.
- [x] Xác nhận không còn `[~]` hoặc `[!]`.
- [x] Xác nhận không còn mục bắt buộc `[ ]`.
- [x] Xác nhận không bắt đầu `P2-T3`.

## Chuẩn bị handoff

- [x] Báo cáo thử nghiệm đã chạy.
- [x] Báo cáo kết quả thử nghiệm.
- [x] Báo cáo commit hash.
- [x] Báo cáo task tiếp theo.
- [x] Báo cáo giới hạn hoặc vấn đề còn lại nếu có.
