# Checklist task P1-T4

Ký hiệu:

- `[ ]` Chưa hoàn thành
- `[x]` Đã hoàn thành
- `[~]` Đang thực hiện
- `[!]` Bị chặn
- `[-]` Không áp dụng

Trước khi đóng task, không được còn `[~]` hoặc `[!]`.

## Chuẩn bị

- [x] Xác nhận task tiếp theo từ `P1-T3` là `P1-T4`.
- [x] Đọc `AGENTS.md`.
- [x] Đọc `.ai/context.md`.
- [x] Đọc `.ai/roadmap.md`.
- [x] Đọc `.ai/task.md`.
- [x] Đọc `.ai/task-checklist.md`.
- [x] Đọc `.ai/plan.md`.
- [x] Đọc `.ai/decisions.md`.
- [x] Chạy `git status --short` trước khi sửa.

## Thiết kế kiểm thử

- [x] Đọc `docs/install-design.md`.
- [x] Đọc `scripts/install.sh`.
- [x] Đọc `scripts/install.ps1`.
- [x] Chốt dùng thư mục tạm trong `/tmp` cho test Bash.
- [x] Chốt dùng `HOME` tạm cho test global mode.
- [x] Cập nhật roadmap/task/checklist/plan cho `P1-T4`.

## Kiểm thử Bash script

- [x] Dry-run project mode không ghi file vào target.
- [x] Project mode lần đầu tạo file từ `starter/`.
- [x] Project mode lần hai bỏ qua file giống nguồn.
- [x] Project mode lần hai không làm dirty Git repo tạm.
- [x] Conflict mặc định trả lỗi và không ghi đè file hiện có.
- [x] `--backup` tạo file backup và ghi nội dung nguồn.
- [x] `--overwrite` ghi đè file conflict khi chọn rõ.
- [x] Global mode cài vào `HOME` tạm.
- [x] Global mode chạy lại không tạo thay đổi mới.

## Kiểm thử PowerShell script

- [x] Kiểm tra có hoặc không có `pwsh`.
- [-] Nếu có `pwsh`, chạy runtime test trên thư mục tạm.
- [x] Nếu không có `pwsh`, ghi rõ giới hạn và chạy kiểm tra tĩnh.
- [x] Kiểm tra PowerShell script không dùng `git add .`.

## Kiểm tra repository

- [x] Kiểm tra không có file rỗng.
- [x] Kiểm tra Markdown cơ bản.
- [x] Kiểm tra thống nhất `P1-T4` giữa roadmap, task và checklist.
- [x] Chạy `git diff --check`.
- [x] Xem lại toàn bộ `git diff`.

## Cập nhật tài liệu

- [x] Ghi kết quả kiểm thử vào `.ai/task.md`.
- [x] Chuyển `P1-T4` thành `DONE` trong `.ai/roadmap.md` khi đủ DoD.
- [x] Đặt task tiếp theo dự kiến là `P2-T1`.
- [x] Rút gọn `.ai/plan.md` sau khi hoàn thành task.
- [x] Cập nhật checklist sau khi kiểm thử đạt.

## Kiểm tra Git

- [x] Chạy `git status --short` trước khi stage.
- [x] Stage chính xác file thuộc task, không dùng git add . trong mọi trường hợp.
- [x] Chạy `git diff --cached`.
- [x] Commit với thông điệp `[P1-T4] Kiểm thử idempotency script cài đặt`.
- [x] Lấy commit hash sau commit.

## Đóng task

- [x] Xác nhận Definition of Done đã đủ.
- [x] Xác nhận không còn `[~]` hoặc `[!]`.
- [x] Xác nhận không còn mục bắt buộc `[ ]`.
- [x] Xác nhận không bắt đầu Phase 2.

## Chuẩn bị handoff

- [x] Báo cáo kiểm thử đã chạy.
- [x] Báo cáo kết quả kiểm thử.
- [x] Báo cáo commit hash.
- [x] Báo cáo task tiếp theo.
- [x] Báo cáo giới hạn hoặc vấn đề còn lại nếu có.
