# Task hiện tại

## ID

`P1-T4`

## Tên task

Kiểm thử idempotency và bảo toàn file hiện có.

## Phase

Phase 1 - Automation.

## Trạng thái

`DONE`

## Mục tiêu

Kiểm thử script cài đặt để xác nhận chạy lại không tạo thay đổi mới, dry-run không ghi file, conflict được bảo toàn mặc định, và backup/overwrite chỉ xảy ra khi người dùng chọn rõ.

## Bối cảnh

`P1-T2` đã tạo `scripts/install.sh`. `P1-T3` đã tạo `scripts/install.ps1` nhưng môi trường lúc đó chưa có `pwsh`, nên mới kiểm tra tĩnh. `P1-T4` cần kiểm thử hành vi an toàn theo `docs/install-design.md`.

## Phạm vi

- Kiểm thử `scripts/install.sh` bằng thư mục tạm trong `/tmp`.
- Kiểm thử dry-run, project install, chạy lại project install, conflict mặc định, backup, overwrite và global mode.
- Kiểm tra `scripts/install.ps1`; nếu có `pwsh`, chạy test runtime tương đương ở mức phù hợp.
- Cập nhật README/context nếu phát hiện giới hạn hoặc hướng dẫn cần chỉnh.
- Cập nhật roadmap, task, checklist và plan.
- Commit task `P1-T4`.

## Ngoài phạm vi

- Không thay đổi hành vi script nếu kiểm thử đạt.
- Không cài thật vào home của người dùng; global mode phải dùng `HOME` tạm khi kiểm thử Bash.
- Không tạo package release.
- Không gắn Git tag.
- Không bắt đầu Phase 2.

## Đầu vào

- `docs/install-design.md`.
- `scripts/install.sh`.
- `scripts/install.ps1`.
- `starter/`.
- `global/AGENTS.md`.
- ADR-004.

## Đầu ra

- Kết quả kiểm thử idempotency và bảo toàn file hiện có được ghi lại.
- Tài liệu trạng thái cập nhật thống nhất cho `P1-T4`.
- Commit Git cho task `P1-T4`.

## Cách thực hiện đã chốt

Chạy kiểm thử thực tế trong `/tmp` cho `scripts/install.sh` vì môi trường hiện hỗ trợ Bash. Với `scripts/install.ps1`, kiểm tra có `pwsh`; nếu có thì chạy runtime trên thư mục tạm, nếu không ghi rõ giới hạn và giữ phần kiểm thử PowerShell cho môi trường phù hợp.

## Tiêu chí chấp nhận

- Dry-run project mode không ghi file vào target.
- Lần cài project mode đầu tạo file từ `starter/`.
- Lần cài project mode thứ hai báo bỏ qua/unchanged và không làm dirty target Git.
- Conflict mặc định trả lỗi và không ghi đè nội dung hiện có.
- `--backup` tạo file `.bak.<timestamp>` và ghi nội dung nguồn.
- `--overwrite` ghi đè khi người dùng chọn rõ.
- Global mode cài vào `HOME` tạm, không đụng home thật.
- `scripts/install.ps1` được kiểm tra runtime nếu có `pwsh`, hoặc ghi rõ giới hạn nếu không có.
- Roadmap, task và checklist thống nhất `P1-T4`.
- Task tiếp theo dự kiến là `P2-T1`.
- Markdown cơ bản không lỗi.
- `git diff --check` đạt.
- Commit được tạo với thông điệp `[P1-T4] Kiểm thử idempotency script cài đặt`.

## Kiểm thử bắt buộc

- Chạy `git status --short` trước khi sửa và trước khi stage.
- Chạy dry-run project mode vào thư mục tạm và xác nhận không tạo file.
- Chạy project mode lần đầu vào Git repo tạm.
- Chạy project mode lần thứ hai và xác nhận Git status không đổi.
- Chạy conflict mặc định với `AGENTS.md` khác nội dung và xác nhận exit code khác `0`.
- Chạy backup với file conflict và xác nhận backup tồn tại.
- Chạy overwrite với file conflict và xác nhận nội dung bị thay bằng nguồn.
- Chạy global mode với `HOME` tạm.
- Kiểm tra có hoặc không có `pwsh`.
- Nếu có `pwsh`, chạy test runtime PowerShell tương đương ở mức phù hợp.
- Nếu không có `pwsh`, ghi rõ giới hạn và kiểm tra tĩnh PowerShell.
- Kiểm tra script không có `git add .`.
- Kiểm tra không có file rỗng.
- Kiểm tra Markdown cơ bản.
- Kiểm tra thống nhất `P1-T4` giữa roadmap, task và checklist.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Rủi ro

- Môi trường có thể vẫn chưa có `pwsh`, khiến kiểm thử PowerShell bị giới hạn.
- Global mode nếu chạy sai HOME có thể đụng cấu hình thật; task phải dùng HOME tạm.
- Backup timestamp có độ phân giải giây, nên test backup cần tránh giả định quá chặt về tên chính xác.

## Blocker

Không có blocker.

## Kết quả task trước

`P1-T3` đã viết script PowerShell và commit `6fb6b34`.

## Task tiếp theo dự kiến

`P2-T1` - Thử nghiệm trên một repository mẫu.

## Kết quả thực hiện

Đã kiểm thử idempotency và bảo toàn file hiện có của script cài đặt:

- Dry-run project mode bằng `scripts/install.sh` không tạo `AGENTS.md` hoặc `.ai/` trong target tạm.
- Project mode lần đầu tạo đủ file từ `starter/`.
- Project mode lần thứ hai báo `unchanged` và `git status --short` của Git repo tạm không đổi.
- Conflict mặc định trả lỗi khác `0`, báo danh sách conflict và giữ nguyên nội dung `AGENTS.md` hiện có.
- `--backup` tạo một file `AGENTS.md.bak.<timestamp>`, giữ nội dung cũ trong backup và ghi nội dung nguồn vào `AGENTS.md`.
- `--overwrite` ghi nội dung nguồn vào file conflict và không tạo backup.
- Global mode dùng `HOME` tạm trong `/tmp`, ghi `global/AGENTS.md` vào `.codex/AGENTS.md` và chạy lại không đổi.
- Môi trường hiện không có `pwsh`, nên chưa chạy runtime PowerShell; kiểm tra tĩnh `scripts/install.ps1` đạt.

Kết quả kiểm thử chính:

- Bash runtime test trong `/tmp`: 23 pass, 0 fail.
- PowerShell: `command -v pwsh` không có kết quả.
- Kiểm tra tĩnh PowerShell: file tồn tại, có `param`, `DryRun`, `Backup`, `Overwrite`, `Get-FileHash`, `Copy-Item`: đạt.
- Kiểm tra `scripts/install.ps1` không chứa `git add`: đạt.
- Kiểm tra không có file rỗng: đạt.
- Kiểm tra Markdown cơ bản: đạt.
- Kiểm tra thống nhất `P1-T4` trong `.ai/roadmap.md`, `.ai/task.md`, `.ai/task-checklist.md`: đạt.
- `git diff --check`: đạt.
- Đã xem lại toàn bộ diff trước khi commit.

## Ngày bắt đầu

2026-07-23.

## Ngày hoàn thành

2026-07-23.
