# Nhật ký quyết định kiến trúc

## ADR-001 - Dùng AGENTS.md làm điểm khởi động của coding agent

- ID: `ADR-001`
- Ngày: 2026-07-23
- Trạng thái: Chấp nhận

### Bối cảnh

Cần một file mà Codex có thể tự động nhận diện khi bắt đầu làm việc trong repository. File này phải đóng vai trò chỉ dẫn agent đọc các tài liệu trạng thái còn lại.

### Các phương án

- Đặt toàn bộ rule trong `AGENTS.md` tại root.
- Đặt rule trong `.ai/context.md` và yêu cầu agent tự tìm.
- Đặt rule trong README.

### Phương án được chọn

Đặt `AGENTS.md` tại root, các tài liệu trạng thái nằm trong `.ai/`.

### Lý do

`AGENTS.md` là tên file phù hợp với workflow của Codex và dễ được agent ưu tiên đọc. `.ai/` giữ các tài liệu trạng thái riêng biệt, giúp root repository gọn hơn.

### Hệ quả

Mọi coding agent không tự đọc các file `.ai/` phải được hướng dẫn qua `AGENTS.md`.

### Điều kiện xem xét lại

Xem xét lại nếu Codex hoặc công cụ agent chính thức chuyển sang một cơ chế cấu hình khác ổn định hơn và tương thích rộng hơn.

## ADR-002 - Không dùng state.yaml và session.md trong phiên bản đầu

- ID: `ADR-002`
- Ngày: 2026-07-23
- Trạng thái: Chấp nhận

### Bối cảnh

Phiên bản đầu cần ít nguồn trạng thái để giảm nguy cơ mất đồng bộ giữa roadmap, task, checklist và dữ liệu máy đọc được.

### Các phương án

- Chỉ dùng các file Markdown trong `.ai/`.
- Bổ sung `state.yaml` để máy đọc nhanh trạng thái.
- Bổ sung `session.md` để lưu nhật ký phiên làm việc.

### Phương án được chọn

Không dùng `state.yaml` và `session.md` trong phiên bản đầu.

### Lý do

Tránh nhiều nguồn trạng thái và nguy cơ mất đồng bộ. Markdown hiện đủ cho mục tiêu quản lý thủ công trong `P0-T1`.

### Hệ quả

Agent phải đọc và đối chiếu `roadmap.md`, `task.md`, `task-checklist.md` thay vì dựa vào một file trạng thái rút gọn.

### Điều kiện xem xét lại

Chỉ bổ sung khi có automation đảm bảo đồng bộ tự động.
