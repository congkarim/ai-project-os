# AI Project OS

AI Project OS là bộ khung tài liệu và quy tắc để quản lý dự án khi làm việc với Codex hoặc coding agent khác. Mục tiêu là giúp agent luôn biết bối cảnh, roadmap, task hiện tại, checklist, kế hoạch và các quyết định dài hạn ngay trong repository.

Phiên bản đầu chỉ cung cấp tài liệu và template. Chưa có script cài đặt, automation, ứng dụng web, API hoặc quy trình phát hành tự động.

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

## Thiết lập global rule

Sao chép rule chung:

```sh
mkdir -p ~/.codex
cp global/AGENTS.md ~/.codex/AGENTS.md
```

File global giúp nhắc agent kiểm tra Git, không phá hủy thay đổi của người dùng, không commit secret, không dùng git add . và ưu tiên đọc tài liệu quản lý trong từng repository.

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

Agent phải đọc theo thứ tự:

1. `AGENTS.md`
2. `.ai/context.md`
3. `.ai/roadmap.md`
4. `.ai/task.md`
5. `.ai/task-checklist.md`
6. `.ai/plan.md`
7. `.ai/decisions.md` nếu liên quan đến kiến trúc

Sau đó chạy `git status --short`, đối chiếu trạng thái giữa roadmap, task và checklist, rồi báo cáo ngắn gọn việc cần làm tiếp theo.

## Hoàn thành một task

Trước khi đóng task:

1. Đối chiếu Definition of Done trong `AGENTS.md`.
2. Chạy kiểm thử bắt buộc.
3. Ghi kết quả kiểm thử.
4. Cập nhật `roadmap.md`, `task.md`, `task-checklist.md`, `plan.md` và `decisions.md` nếu cần.
5. Kiểm tra `git diff`.
6. Stage đúng file thuộc task.
7. Kiểm tra `git diff --cached`.
8. Commit bằng tiếng Việt.

## Quy tắc commit

Định dạng mặc định:

```text
[P<phase>-T<task>] <Mô tả kết quả>
```

Ví dụ:

```text
[P0-T1] Khởi tạo nền tảng AI Project OS
```

Không dùng git add . trong mọi trường hợp. Chỉ stage file thuộc phạm vi task. Không commit secret, token, mật khẩu, file `.env` hoặc thông tin nhạy cảm.

## Reset plan.md

Trong khi làm task, `plan.md` có thể chứa phân tích, giả định, phương án, phát hiện và kết quả kiểm thử.

Khi task hoàn thành, rút gọn `plan.md` và chỉ giữ:

- Task vừa hoàn thành.
- Các phương án chính đã xem xét.
- Phương án được chọn.
- Lý do.
- Phát hiện quan trọng.
- Kết quả kiểm thử.
- Vấn đề chuyển sang task sau.

Không giữ suy luận dài dòng hoặc nhật ký hội thoại.

## Giới hạn của phiên bản đầu

- Chưa có script cài đặt.
- Chưa có kiểm tra tự động cho schema Markdown.
- Chưa có cơ chế đồng bộ trạng thái tự động.
- Chưa có package release.
- Chưa áp đặt công nghệ cho dự án sử dụng template.

## Roadmap của AI Project OS

- Phase 0 - Foundation: khởi tạo bộ khung, rà soát schema, chốt v0.1.
- Phase 1 - Automation: thiết kế và viết script cài đặt cho nhiều hệ điều hành.
- Phase 2 - Validation: thử nghiệm trên repository mẫu và dự án thật.
- Phase 3 - Release: hoàn thiện hướng dẫn, đóng gói `v1.0.0`, gắn Git tag và phát hành.
