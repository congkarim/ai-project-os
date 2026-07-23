# Checklist task P2-T1

Ký hiệu:

- `[ ]` Chưa hoàn thành
- `[x]` Đã hoàn thành
- `[~]` Đang thực hiện
- `[!]` Bị chặn
- `[-]` Không áp dụng

Trước khi đóng task, không được còn `[~]` hoặc `[!]`.

## Chuẩn bị

- [x] Xác nhận task tiếp theo từ `P1-T4` là `P2-T1`.
- [x] Đọc `AGENTS.md`.
- [x] Đọc `.ai/context.md`.
- [x] Đọc `.ai/roadmap.md`.
- [x] Đọc `.ai/task.md`.
- [x] Đọc `.ai/task-checklist.md`.
- [x] Đọc `.ai/plan.md`.
- [x] Đọc `.ai/decisions.md`.
- [x] Chạy `git status --short` trước khi sửa.

## Thiết kế thử nghiệm

- [x] Chốt dùng repository mẫu trong `/tmp`.
- [x] Chốt dùng `scripts/install.sh` cho runtime test.
- [x] Chốt không thử dự án thật trong task này.
- [x] Cập nhật roadmap/task/checklist/plan cho `P2-T1`.

## Thử nghiệm repo mẫu

- [x] Tạo Git repository mẫu trong `/tmp`.
- [x] Chạy dry-run và xác nhận không tạo file.
- [x] Chạy cài thật bằng `scripts/install.sh --yes`.
- [x] Xác nhận `AGENTS.md` được tạo.
- [x] Xác nhận đủ file `.ai/` được tạo.
- [x] So sánh file repo mẫu với `starter/`.
- [x] Đọc startup files trong repo mẫu theo `AGENTS.md`.
- [x] Chạy lại cài đặt và xác nhận idempotency.
- [x] Kiểm tra `git status --short` của repo mẫu sau lần chạy lại.

## Kiểm tra repository chính

- [x] Kiểm tra không có file rỗng.
- [x] Kiểm tra Markdown cơ bản.
- [x] Kiểm tra thống nhất `P2-T1` giữa roadmap, task và checklist.
- [x] Chạy `git diff --check`.
- [x] Xem lại toàn bộ `git diff`.

## Cập nhật tài liệu

- [x] Ghi kết quả thử nghiệm vào `.ai/task.md`.
- [x] Chuyển `P2-T1` thành `DONE` trong `.ai/roadmap.md` khi đủ DoD.
- [x] Đặt task tiếp theo dự kiến là `P2-T2`.
- [x] Rút gọn `.ai/plan.md` sau khi hoàn thành task.
- [x] Cập nhật checklist sau khi kiểm thử đạt.

## Kiểm tra Git

- [x] Chạy `git status --short` trước khi stage.
- [x] Stage chính xác file thuộc task, không dùng git add . trong mọi trường hợp.
- [x] Chạy `git diff --cached`.
- [x] Commit với thông điệp `[P2-T1] Thử nghiệm trên repository mẫu`.
- [x] Lấy commit hash sau commit.

## Đóng task

- [x] Xác nhận Definition of Done đã đủ.
- [x] Xác nhận không còn `[~]` hoặc `[!]`.
- [x] Xác nhận không còn mục bắt buộc `[ ]`.
- [x] Xác nhận không bắt đầu `P2-T2`.

## Chuẩn bị handoff

- [x] Báo cáo thử nghiệm đã chạy.
- [x] Báo cáo kết quả thử nghiệm.
- [x] Báo cáo commit hash.
- [x] Báo cáo task tiếp theo.
- [x] Báo cáo giới hạn hoặc vấn đề còn lại nếu có.
