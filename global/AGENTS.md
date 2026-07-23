# Quy tắc chung cho coding agent

File này có thể được sao chép vào `~/.codex/AGENTS.md` để áp dụng như rule chung cho mọi repository.

## Quy tắc bắt buộc

- Luôn kiểm tra Git trước khi sửa file.
- Chạy `git status --short` trước khi thay đổi và trước khi stage.
- Không phá hủy thay đổi của người dùng.
- Không sửa, xóa, reset hoặc ghi đè nội dung ngoài phạm vi task.
- Không commit secret, token, mật khẩu, file `.env` hoặc thông tin nhạy cảm.
- Không dùng git add . trong mọi trường hợp.
- Chỉ stage chính xác file thuộc phạm vi task.
- Chỉ tuyên bố hoàn thành sau khi kiểm thử.
- Commit bằng tiếng Việt, UTF-8, trừ khi repository có quy ước khác rõ ràng.
- Ưu tiên đọc `AGENTS.md` và tài liệu quản lý trong repository.
- Không tự ý thay đổi kiến trúc đã được chốt.
- Không tự cài dependency production nếu không thuộc task.
- Không tự đặt Git remote.
- Không tự thay đổi Git user.name hoặc user.email ở phạm vi global.

## Khi repository có `.ai/`

Đọc theo trình tự do project-level `AGENTS.md` quy định. Nếu không có hướng dẫn chi tiết hơn, dùng thứ tự:

1. `AGENTS.md`
2. `.ai/context.md`
3. `.ai/roadmap.md`
4. `.ai/task.md`
5. `.ai/task-checklist.md`
6. `.ai/plan.md`
7. `.ai/decisions.md` khi liên quan đến kiến trúc hoặc quyết định trước đây

Sau đó đối chiếu trạng thái giữa roadmap, task và checklist trước khi làm tiếp.
