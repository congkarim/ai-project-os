# AI Project OS

AI Project OS là bộ khung tài liệu và quy tắc để quản lý dự án khi làm việc với Codex hoặc coding agent khác. Mục tiêu là giúp agent luôn biết bối cảnh, roadmap, task hiện tại, checklist, kế hoạch và các quyết định dài hạn ngay trong repository.

Baseline tài liệu hiện tại: `v1.0.0`.

`v1.0.0` là bản phát hành chính thức đầu tiên: rule, tài liệu trạng thái, starter template, thiết kế cài đặt và script Linux/macOS cùng Windows PowerShell. Nội dung đã được đóng gói trong repository; Git tag và GitHub Release thuộc task `P3-T3`.

## Thành phần

- `AGENTS.md`: quy tắc project-level cho coding agent.
- `.ai/context.md`: bối cảnh và ràng buộc của dự án.
- `.ai/roadmap.md`: phase, task, trạng thái và nhật ký cập nhật.
- `.ai/task.md`: task hiện tại, kết quả task trước và task tiếp theo.
- `.ai/task-checklist.md`: checklist thực thi và đóng task.
- `.ai/plan.md`: không gian lập kế hoạch tạm thời của task hiện tại.
- `.ai/decisions.md`: nhật ký quyết định kiến trúc.
- `docs/install-design.md`: thiết kế cơ chế cài đặt mà các script phải bám theo.
- `docs/release-v1.0.0.md`: ghi chú phát hành và danh mục thành phần `v1.0.0`.
- `VERSION`: số phiên bản hiện tại.
- `CHANGELOG.md`: nhật ký thay đổi theo phiên bản.
- `scripts/install.sh`: script cài đặt cho Linux/macOS.
- `scripts/install.ps1`: script cài đặt cho Windows PowerShell.
- `global/AGENTS.md`: mẫu rule chung để đặt tại `~/.codex/AGENTS.md`.
- `starter/`: bộ khung sạch để sao chép vào repository mới.

## Phạm vi hiện tại

`v1.0.0` có thể dùng ngay bằng sao chép thủ công hoặc script cài đặt:

- Sao chép `global/AGENTS.md` vào cấu hình global của Codex nếu cần rule chung.
- Sao chép `starter/AGENTS.md` và `starter/.ai/` vào repository mới, hoặc chạy `scripts/install.sh` / `scripts/install.ps1`.
- Điền lại placeholder trong starter bằng thông tin thật của dự án.
- Quản lý task bằng Git và các file `.ai/`.

Đã kiểm thử ở Phase 2:

- Cài đặt vào repository mẫu trống.
- Cài đặt an toàn vào repository đang phát triển đã có `AGENTS.md` và `.ai/` (mặc định không ghi đè).
- Tiếp quản phiên coding agent mới chỉ từ tài liệu trong repository.

Các phần chưa thuộc bước phát hành còn lại: Git tag, GitHub Release, kiểm tra schema tự động và workflow CI/CD. Chi tiết đóng gói nằm ở `docs/release-v1.0.0.md` và `CHANGELOG.md`.

## Nguồn sự thật

- `AGENTS.md` là nguồn sự thật cho workflow agent trong repository này.
- `.ai/context.md` là nguồn sự thật cho bối cảnh, phạm vi và ràng buộc dài hạn.
- `.ai/roadmap.md` là nguồn sự thật cho phase và danh sách task.
- `.ai/task.md` là nguồn sự thật cho task hiện tại.
- `.ai/task-checklist.md` là nguồn sự thật cho việc đã làm và việc còn lại trong task.
- `.ai/plan.md` là không gian làm việc tạm thời, phải rút gọn khi đóng task.
- `.ai/decisions.md` là nguồn sự thật cho quyết định kiến trúc dài hạn.
- `README.md` chỉ hướng dẫn sử dụng bộ khung, không lặp đầy đủ rule vận hành.

## Thiết lập global rule

Sao chép rule chung:

```sh
mkdir -p ~/.codex
cp global/AGENTS.md ~/.codex/AGENTS.md
```

Hoặc dùng script với tùy chọn global. File global là lớp rule tối thiểu. Khi repository có `AGENTS.md`, rule project-level là nguồn chi tiết hơn.

## Áp dụng cho dự án mới

Có thể sao chép thủ công hoặc dùng script cài đặt phù hợp với hệ điều hành.

Trong repository mới:

```sh
cp /duong/dan/toi/ai-project-os/starter/AGENTS.md ./AGENTS.md
cp -R /duong/dan/toi/ai-project-os/starter/.ai ./.ai
```

Hoặc chạy script Linux/macOS từ repository AI Project OS:

```sh
scripts/install.sh --target /duong/dan/toi/repository-moi --dry-run
scripts/install.sh --target /duong/dan/toi/repository-moi --yes
```

Script mặc định không ghi đè file đã tồn tại và khác nội dung. Khi cần, dùng `--backup` để sao lưu trước khi ghi hoặc `--overwrite` để ghi đè có chủ đích. Thiết kế chi tiết nằm trong `docs/install-design.md`.

Trên Windows PowerShell hoặc PowerShell 7:

```powershell
pwsh -File scripts/install.ps1 -Target C:\duong\dan\repository-moi -DryRun
pwsh -File scripts/install.ps1 -Target C:\duong\dan\repository-moi -Yes
```

Nếu đang ở Windows PowerShell và không dùng `pwsh`, có thể chạy trực tiếp:

```powershell
.\scripts\install.ps1 -Target C:\duong\dan\repository-moi -DryRun
.\scripts\install.ps1 -Target C:\duong\dan\repository-moi -Yes
```

Script PowerShell mặc định không ghi đè file đã tồn tại và khác nội dung. Khi cần, dùng `-Backup` để sao lưu trước khi ghi hoặc `-Overwrite` để ghi đè có chủ đích. Dùng `-Global` để cài `global/AGENTS.md` vào `~/.codex/AGENTS.md`.

Sau khi sao chép:

1. Điền `context.md` bằng thông tin thật của dự án.
2. Xây dựng `roadmap.md`.
3. Xác định task đầu tiên trong `task.md`.
4. Cụ thể hóa checklist trong `task-checklist.md`.
5. Dùng `plan.md` để phân tích và chốt phương án.
6. Ghi quyết định dài hạn vào `decisions.md`.

## Áp dụng cho repository đang có

1. Chạy `git status --short` để nắm thay đổi hiện có.
2. Chạy dry-run trước: `scripts/install.sh --target <repo> --dry-run`.
3. Không ghi đè `AGENTS.md` hoặc `.ai/` nếu chúng đã tồn tại và khác starter; script mặc định sẽ báo conflict.
4. Nếu chưa có, sao chép từng file từ `starter/` hoặc chạy install mặc định.
5. Nếu đã có tài liệu quản lý riêng, hợp nhất thủ công hoặc dùng `--backup` / `--overwrite` có chủ đích.
6. Điền `context.md` dựa trên source code, cấu hình và tài liệu hiện có.
7. Tạo roadmap phản ánh trạng thái thật của repository.
8. Chọn một task nhỏ làm task hiện tại để kiểm tra workflow.

## Bắt đầu một phiên làm việc

Agent đọc theo trình tự trong `AGENTS.md`, chạy `git status --short`, đối chiếu roadmap, task và checklist, rồi báo cáo ngắn gọn trạng thái thực tế. Không dựa vào lịch sử chat làm nguồn sự thật duy nhất.

## Hoàn thành một task

Trước khi đóng task, agent phải đối chiếu Definition of Done trong `AGENTS.md`, chạy kiểm thử bắt buộc, ghi kết quả, cập nhật tài liệu trạng thái, xem lại Git diff và commit đúng phạm vi.

## Quy tắc commit

Định dạng mặc định nằm trong `AGENTS.md`:

```text
[P<phase>-T<task>] <Mô tả kết quả>
```

Ví dụ:

```text
[P0-T1] Khởi tạo nền tảng AI Project OS
```

Không dùng git add . trong mọi trường hợp. Chỉ stage file thuộc phạm vi task và không commit secret.

## Reset plan.md

Trong khi làm task, `plan.md` có thể chứa phân tích, giả định, phương án, phát hiện và kết quả kiểm thử. Khi task hoàn thành, rút gọn theo quy tắc trong `AGENTS.md` và chỉ giữ thông tin cần cho task sau; không giữ suy luận dài dòng hoặc nhật ký hội thoại.

## Giới hạn hiện tại

- Chưa có kiểm tra tự động cho schema Markdown.
- Chưa có cơ chế đồng bộ trạng thái tự động.
- Nội dung `v1.0.0` đã đóng gói; Git tag và GitHub Release thuộc `P3-T3`.
- Chưa có workflow CI/CD.
- Script PowerShell cần môi trường có `pwsh` hoặc Windows PowerShell.
- Chưa áp đặt công nghệ cho dự án sử dụng template.

## Roadmap của AI Project OS

- Phase 0 - Foundation: khởi tạo bộ khung, rà soát schema, chốt v0.1 — `DONE`.
- Phase 1 - Automation: thiết kế và viết script cài đặt Linux/macOS và Windows PowerShell — `DONE`.
- Phase 2 - Validation: thử nghiệm repository mẫu, dự án đang phát triển và tiếp quản phiên mới — `DONE`.
- Phase 3 - Release: hoàn thiện hướng dẫn và đóng gói `v1.0.0` — đang thực hiện; còn gắn Git tag và phát hành.
