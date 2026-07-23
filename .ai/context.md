# Bối cảnh dự án

## Tên dự án

AI Project OS.

## Mục đích

Xây dựng một bộ khung quản lý dự án có thể tái sử dụng trong mọi repository làm việc với Codex hoặc coding agent khác. Bộ khung giúp agent bắt đầu phiên làm việc từ tài liệu trong repository, theo dõi task hiện tại, kiểm tra Definition of Done và ghi lại quyết định dài hạn.

## Vấn đề cần giải quyết

Coding agent thường mất bối cảnh giữa các phiên, dễ dựa vào lịch sử chat, dễ bỏ sót checklist, dễ commit ngoài phạm vi hoặc tuyên bố hoàn thành khi chưa kiểm thử. AI Project OS giải quyết bằng cách chuẩn hóa các file quản lý tối thiểu ngay trong repository.

## Người sử dụng

- Người dùng Codex hoặc coding agent trong dự án phần mềm.
- Maintainer muốn agent tuân thủ cùng một workflow qua nhiều repository.
- Nhóm nhỏ cần quản lý task, roadmap và quyết định kiến trúc bằng Markdown nhẹ.

## Phạm vi

- Quy tắc khởi động agent.
- Tài liệu bối cảnh dự án.
- Roadmap theo phase và task.
- Task hiện tại và checklist.
- Không gian lập kế hoạch tạm thời.
- Nhật ký quyết định kiến trúc.
- Template starter cho repository mới.
- Mẫu global rule cho `~/.codex/AGENTS.md`.

## Ngoài phạm vi

- Ứng dụng web, API hoặc giao diện.
- Script cài đặt tự động.
- Automation đồng bộ trạng thái.
- Tích hợp CI/CD.
- Quản lý secret.
- Thay thế issue tracker chuyên dụng.

## Nguyên tắc thiết kế

- Repository là nguồn sự thật chính.
- Markdown rõ ràng, dễ đọc, dễ diff.
- Ít file nhưng đủ để tiếp quản sau phiên mới.
- Tránh nhiều nguồn trạng thái cho cùng một thông tin.
- Không yêu cầu công nghệ riêng để áp dụng.
- Không phá hủy nội dung hiện có khi đưa vào repository đang có.

## Công nghệ hoặc định dạng sử dụng

- Markdown UTF-8.
- Git.
- Cấu trúc thư mục quy ước: `AGENTS.md`, `.ai/`, `global/`, `starter/`.
- Không dùng `state.yaml` hoặc `session.md` trong phiên bản đầu.

## Môi trường phát triển

- Làm việc trực tiếp trong repository Git.
- Có shell để chạy lệnh kiểm tra file và Git.
- Không yêu cầu dependency production.
- Không yêu cầu runtime ứng dụng.

## Cấu trúc repository chính

```text
.
├── AGENTS.md
├── README.md
├── .ai/
│   ├── context.md
│   ├── roadmap.md
│   ├── task.md
│   ├── task-checklist.md
│   ├── plan.md
│   └── decisions.md
├── global/
│   └── AGENTS.md
└── starter/
    ├── AGENTS.md
    └── .ai/
        ├── context.md
        ├── roadmap.md
        ├── task.md
        ├── task-checklist.md
        ├── plan.md
        └── decisions.md
```

## Các lệnh thường dùng

```sh
git status --short
git diff
git diff --check
git diff --cached
git log --oneline -5
```

## Cách kiểm thử

Vì đây là repository tài liệu, kiểm thử tập trung vào:

- Xác nhận cấu trúc file bắt buộc tồn tại.
- Kiểm tra file không rỗng.
- Kiểm tra từ khóa bắt buộc.
- Kiểm tra Markdown cơ bản.
- Kiểm tra nội dung starter không lẫn trạng thái riêng của AI Project OS.
- Kiểm tra trạng thái `P0-T1` thống nhất giữa roadmap, task và checklist.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Cách phát hành hoặc phân phối

Phiên bản đầu được phân phối bằng cách sao chép thủ công:

- `global/AGENTS.md` vào `~/.codex/AGENTS.md`.
- `starter/AGENTS.md` và `starter/.ai/` vào repository mới.

Các script cài đặt và đóng gói release sẽ được thiết kế ở các phase sau.

## Ràng buộc

- Tài liệu dùng tiếng Việt, UTF-8.
- Không chứa secret, token, mật khẩu hoặc file `.env`.
- Không tạo script cài đặt trong `P0-T1`.
- Không triển khai tính năng nghiệp vụ.
- Không tự đặt Git remote.
- Không tự thay đổi Git user.name hoặc user.email ở phạm vi global.

## Rủi ro

- Trạng thái giữa `roadmap.md`, `task.md` và `task-checklist.md` có thể lệch nếu cập nhật thủ công thiếu bước.
- Template quá dài có thể khiến agent bỏ qua nội dung quan trọng.
- Thiếu automation khiến việc áp dụng vào repository lớn cần rà soát thủ công.
- Người dùng có thể quên reset `plan.md` sau khi đóng task.

## Thuật ngữ

- Coding agent: công cụ AI có khả năng đọc, sửa file và chạy lệnh trong repository.
- Project-level rule: quy tắc nằm trong `AGENTS.md` tại root repository.
- Global rule: quy tắc chung đặt tại `~/.codex/AGENTS.md`.
- Task hiện tại: task duy nhất đang được xử lý trong `.ai/task.md`.
- Definition of Done: tập điều kiện bắt buộc trước khi đánh dấu task hoàn thành.
- ADR: Architecture Decision Record, bản ghi quyết định kiến trúc dài hạn.
