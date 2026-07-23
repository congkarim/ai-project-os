# AI Project OS

AI Project OS là bộ khung tài liệu và quy tắc để quản lý dự án khi làm việc với Codex hoặc coding agent khác. Mục tiêu là giúp agent luôn biết bối cảnh, roadmap, task hiện tại, checklist, kế hoạch và các quyết định dài hạn ngay trong repository.

Phiên bản hiện tại: `v0.1.0`.

`v0.1.0` là baseline tài liệu thủ công: chỉ cung cấp rule, tài liệu trạng thái và starter template. Chưa có script cài đặt, automation, ứng dụng web, API, package release hoặc Git tag phát hành.

## Thành phần

- `AGENTS.md`: quy tắc project-level cho coding agent.
- `.ai/context.md`: bối cảnh và ràng buộc của dự án.
- `.ai/roadmap.md`: phase, task, trạng thái và nhật ký cập nhật.
- `.ai/task.md`: task hiện tại, kết quả task trước và task tiếp theo.
- `.ai/task-checklist.md`: checklist thực thi và đóng task.
- `.ai/plan.md`: không gian lập kế hoạch tạm thời của task hiện tại.
- `.ai/decisions.md`: nhật ký quyết định kiến trúc.
- `global/AGENTS.md`: mẫu rule chung để đặt tại `~/.codex/AGENTS.md`.
- `starter/`: bộ khung sạch để sao chép vào repository mới.

## Phạm vi v0.1.0

`v0.1.0` dùng được bằng cách sao chép thủ công:

- Sao chép `global/AGENTS.md` vào cấu hình global của Codex nếu cần rule chung.
- Sao chép `starter/AGENTS.md` và `starter/.ai/` vào repository mới.
- Điền lại placeholder trong starter bằng thông tin thật của dự án.
- Quản lý task bằng Git và các file `.ai/`.

Các phần chưa thuộc `v0.1.0`: script cài đặt, kiểm tra schema tự động, package release, Git tag phát hành và workflow CI/CD.

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

File global là lớp rule tối thiểu. Khi repository có `AGENTS.md`, rule project-level là nguồn chi tiết hơn.

## Áp dụng cho dự án mới

Trong repository mới:

```sh
cp /duong/dan/toi/ai-project-os/starter/AGENTS.md ./AGENTS.md
cp -R /duong/dan/toi/ai-project-os/starter/.ai ./.ai
```

Sau khi sao chép:

1. Điền `context.md` bằng thông tin thật của dự án.
2. Xây dựng `roadmap.md`.
3. Xác định task đầu tiên trong `task.md`.
4. Cụ thể hóa checklist trong `task-checklist.md`.
5. Dùng `plan.md` để phân tích và chốt phương án.
6. Ghi quyết định dài hạn vào `decisions.md`.

## Áp dụng cho repository đang có

1. Chạy `git status --short` để nắm thay đổi hiện có.
2. Không ghi đè `AGENTS.md` hoặc `.ai/` nếu chúng đã tồn tại.
3. Nếu chưa có, sao chép từng file từ `starter/`.
4. Nếu đã có tài liệu quản lý riêng, hợp nhất thủ công thay vì thay thế.
5. Điền `context.md` dựa trên source code, cấu hình và tài liệu hiện có.
6. Tạo roadmap phản ánh trạng thái thật của repository.
7. Chọn một task nhỏ làm task hiện tại để kiểm tra workflow.

## Bắt đầu một phiên làm việc

Agent đọc theo trình tự trong `AGENTS.md`, chạy `git status --short`, đối chiếu roadmap, task và checklist, rồi báo cáo ngắn gọn trạng thái thực tế.

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

## Giới hạn của phiên bản đầu

- Chưa có script cài đặt.
- Chưa có kiểm tra tự động cho schema Markdown.
- Chưa có cơ chế đồng bộ trạng thái tự động.
- Chưa có package release.
- Chưa có Git tag phát hành.
- Chưa áp đặt công nghệ cho dự án sử dụng template.

## Roadmap của AI Project OS

- Phase 0 - Foundation: khởi tạo bộ khung, rà soát schema, chốt v0.1.
- Phase 1 - Automation: thiết kế và viết script cài đặt cho nhiều hệ điều hành.
- Phase 2 - Validation: thử nghiệm trên repository mẫu và dự án thật.
- Phase 3 - Release: hoàn thiện hướng dẫn, đóng gói `v1.0.0`, gắn Git tag và phát hành.
