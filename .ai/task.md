# Task hiện tại

## ID

`P2-T2`

## Tên task

Thử nghiệm trên một dự án đang phát triển.

## Phase

Phase 2 - Validation.

## Trạng thái

`DONE`

## Mục tiêu

Thử nghiệm script cài đặt trên một repository đang phát triển đã có `AGENTS.md` và `.ai/`, để xác nhận mặc định không ghi đè và không làm dirty working tree.

## Bối cảnh

`P2-T1` đã xác nhận script cài đặt tạo được bộ khung sạch trên repository mẫu mới. `P2-T2` tập trung vào tình huống rủi ro hơn: repository đang phát triển đã có tài liệu quản lý riêng và không được bị ghi đè khi chạy script mặc định.

## Phạm vi

- Dùng chính repository AI Project OS hiện tại làm repository đang phát triển.
- Chạy `scripts/install.sh --target <repo> --dry-run`.
- Chạy `scripts/install.sh --target <repo> --yes` ở chế độ mặc định, không dùng `--backup` hoặc `--overwrite`.
- Xác nhận conflict được báo rõ.
- Xác nhận `git status --short` không đổi.
- Xác nhận `AGENTS.md` và `.ai/task.md` hiện có không bị thay bằng starter.
- Ghi kết quả thử nghiệm vào tài liệu trạng thái.
- Commit task `P2-T2`.

## Ngoài phạm vi

- Không chạy `--backup` hoặc `--overwrite` trên repository đang phát triển hiện tại.
- Không thử trên repository ngoài workspace.
- Không bắt đầu `P2-T3`.
- Không tạo package release hoặc Git tag.

## Đầu vào

- Repository hiện tại.
- `starter/`.
- `scripts/install.sh`.
- ADR-004.
- Kết quả `P2-T1`.

## Đầu ra

- Kết quả thử nghiệm dự án đang phát triển được ghi lại.
- Roadmap, task, checklist và plan thống nhất cho `P2-T2`.
- Commit Git cho task `P2-T2`.

## Cách thực hiện đã chốt

Chạy script Bash trên repository hiện tại ở chế độ không ghi đè. Vì repository hiện tại đã có `AGENTS.md` và `.ai/` khác starter, hành vi đúng là báo conflict, trả mã khác `0` và không ghi file.

## Tiêu chí chấp nhận

- Repository đang phát triển bắt đầu với `git status --short` sạch.
- Dry-run có conflict trả mã khác `0`, in plan và không làm thay đổi Git status.
- Install mặc định có conflict trả mã khác `0`, in danh sách conflict và hướng dẫn dùng `--backup` hoặc `--overwrite`.
- `AGENTS.md` hiện tại không bị thay bằng `starter/AGENTS.md`.
- `.ai/task.md` hiện tại không bị thay bằng `starter/.ai/task.md`.
- Roadmap, task và checklist thống nhất `P2-T2`.
- Task tiếp theo dự kiến là `P2-T3`.
- Markdown cơ bản không lỗi.
- `git diff --check` đạt.
- Commit được tạo với thông điệp `[P2-T2] Thử nghiệm trên dự án đang phát triển`.

## Kiểm thử bắt buộc

- Chạy `git status --short` trước khi sửa và trước khi stage.
- Chạy dry-run vào repository hiện tại.
- Chạy install mặc định vào repository hiện tại với `--yes`.
- Xác nhận conflict được báo.
- Xác nhận Git status không đổi sau mỗi lần chạy.
- Xác nhận file hiện có không bị thay thế bởi starter.
- Kiểm tra không có file rỗng.
- Kiểm tra Markdown cơ bản.
- Kiểm tra thống nhất `P2-T2` giữa roadmap, task và checklist.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Rủi ro

- Chỉ kiểm thử được Bash runtime; PowerShell runtime vẫn cần môi trường có `pwsh` hoặc Windows PowerShell.
- Không dùng `--backup` hoặc `--overwrite` trên repository thật để tránh ghi đè ngoài ý muốn.

## Blocker

Không có blocker.

## Kết quả task trước

`P2-T1` đã thử nghiệm repository mẫu và commit `3bb5a8f2e4cd1948ad7567dcb0b1c5100be53be4`.

## Task tiếp theo dự kiến

`P2-T3` - Đánh giá khả năng tiếp quản sau khi mở phiên Codex mới.

## Kết quả thực hiện

Đã thử nghiệm trên repository đang phát triển hiện tại ở chế độ an toàn.

Kết quả thử nghiệm:

- `git status --short` trước thử nghiệm: sạch.
- Dry-run vào repository hiện tại trả mã khác `0` vì có conflict, in `Plan:` và báo conflict cho `AGENTS.md`.
- Dry-run không làm thay đổi `git status --short`.
- Install mặc định với `--yes` trả mã khác `0`, in `Conflicts:` và hướng dẫn dùng `--backup` hoặc `--overwrite`.
- Install mặc định không làm thay đổi `git status --short`.
- `AGENTS.md` hiện tại vẫn khác `starter/AGENTS.md`, nghĩa là không bị ghi đè.
- `.ai/task.md` hiện tại vẫn khác `starter/.ai/task.md`, nghĩa là không bị ghi đè.

Tổng kết test repository đang phát triển: 11 pass, 0 fail.

Kiểm tra repository chính:

- Kiểm tra không có file rỗng: đạt.
- Kiểm tra Markdown cơ bản: đạt.
- Kiểm tra thống nhất `P2-T2` trong `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`: đạt.
- `git diff --check`: đạt.
- Đã xem lại toàn bộ diff trước khi commit.

## Ngày bắt đầu

2026-07-23.

## Ngày hoàn thành

2026-07-23.
