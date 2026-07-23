# Bối cảnh dự án

## Tên dự án

AI Project OS.

## Mục đích

Xây dựng một bộ khung quản lý dự án có thể tái sử dụng trong mọi repository làm việc với Codex hoặc coding agent khác. Bộ khung giúp agent bắt đầu phiên làm việc từ tài liệu trong repository, theo dõi task hiện tại, kiểm tra Definition of Done và ghi lại quyết định dài hạn.

Baseline hiện tại là `v0.1.0`, một phiên bản tài liệu thủ công để sử dụng bằng cách sao chép file. Đây chưa phải package release và chưa có Git tag phát hành.

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
- Tài liệu thiết kế automation.
- Script cài đặt Linux/macOS.
- Script cài đặt Windows PowerShell.
- Template starter cho repository mới.
- Mẫu global rule cho `~/.codex/AGENTS.md`.

## Ngoài phạm vi

- Ứng dụng web, API hoặc giao diện.
- Script hoặc automation ngoài roadmap hiện tại.
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
├── docs/
│   └── install-design.md
├── scripts/
│   ├── install.sh
│   └── install.ps1
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
scripts/install.sh --help
scripts/install.sh --target /duong/dan/toi/repo --dry-run
pwsh -File scripts/install.ps1 -Help
pwsh -File scripts/install.ps1 -Target C:\duong\dan\repo -DryRun
```

## Cách kiểm thử

Vì đây là repository tài liệu, kiểm thử tập trung vào:

- Xác nhận cấu trúc file bắt buộc tồn tại.
- Kiểm tra file không rỗng.
- Kiểm tra từ khóa bắt buộc.
- Kiểm tra Markdown cơ bản.
- Kiểm tra nội dung starter không lẫn trạng thái riêng của AI Project OS.
- Kiểm tra trạng thái task hiện tại thống nhất giữa roadmap, task và checklist.
- Kiểm thử script cài đặt bằng thư mục tạm trong `/tmp` khi task liên quan đến automation.
- Chạy `git diff --check`.
- Xem lại toàn bộ `git diff`.

## Cách phát hành hoặc phân phối

Baseline `v0.1.0` được phân phối bằng cách sao chép thủ công:

- `global/AGENTS.md` vào `~/.codex/AGENTS.md`.
- `starter/AGENTS.md` và `starter/.ai/` vào repository mới.

Cơ chế cài đặt được thiết kế và triển khai từng bước trong Phase 1. Package release và Git tag phát hành nằm ngoài `v0.1.0` và sẽ được xử lý ở Phase 3.

Thiết kế cơ chế cài đặt nằm ở `docs/install-design.md`. Script Linux/macOS nằm ở `scripts/install.sh`; script Windows PowerShell nằm ở `scripts/install.ps1`. Cả hai phải bám theo thiết kế này, đặc biệt là mặc định không ghi đè, có dry-run và xử lý conflict rõ ràng.

## Ràng buộc

- Tài liệu dùng tiếng Việt, UTF-8.
- Không chứa secret, token, mật khẩu hoặc file `.env`.
- Không tạo script cài đặt trước Phase 1.
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
