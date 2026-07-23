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

## ADR-003 - Chốt v0.1.0 là baseline tài liệu thủ công

- ID: `ADR-003`
- Ngày: 2026-07-23
- Trạng thái: Chấp nhận

### Bối cảnh

Sau Phase 0, AI Project OS cần một mốc baseline để người dùng có thể áp dụng thủ công trước khi có automation cài đặt, package release hoặc Git tag phát hành.

### Các phương án

- Chốt `v0.1.0` bằng tài liệu và tiếp tục phân phối thủ công.
- Gắn Git tag `v0.1.0`.
- Tạo package hoặc release artifact riêng.

### Phương án được chọn

Chốt `v0.1.0` bằng tài liệu và tiếp tục phân phối thủ công.

### Lý do

Phase 0 chỉ nhằm hoàn thiện nền tảng tài liệu. Git tag và phát hành chính thức đã thuộc Phase 3; script cài đặt thuộc Phase 1.

### Hệ quả

`v0.1.0` là baseline có thể sao chép và dùng thủ công, nhưng chưa phải release package và chưa có cam kết idempotency tự động.

### Điều kiện xem xét lại

Xem xét lại khi Phase 1 có script cài đặt hoặc khi Phase 3 chuẩn bị đóng gói release chính thức.

## ADR-004 - Mặc định không ghi đè khi cài đặt

- ID: `ADR-004`
- Ngày: 2026-07-23
- Trạng thái: Chấp nhận

### Bối cảnh

Phase 1 cần thiết kế cơ chế cài đặt AI Project OS vào repository mới hoặc repository đang có. Repository đang có có thể đã có `AGENTS.md`, `.ai/` hoặc `~/.codex/AGENTS.md` với nội dung riêng của người dùng.

### Các phương án

- Mặc định không ghi đè, báo conflict khi file đích khác nguồn.
- Luôn backup rồi ghi file mới.
- Luôn ghi đè file đích.

### Phương án được chọn

Mặc định không ghi đè. Script sau này chỉ ghi đè khi người dùng chọn rõ `--overwrite`, hoặc sao lưu rồi ghi khi chọn `--backup`.

### Lý do

Quy tắc an toàn của AI Project OS ưu tiên bảo toàn thay đổi của người dùng. Mặc định không ghi đè giúp script an toàn trên repository đang phát triển và buộc conflict phải được xử lý có chủ đích.

### Hệ quả

Script cài đặt cần có bước so sánh file, báo conflict, hỗ trợ dry-run và trả mã lỗi khi conflict chưa được xử lý.

### Điều kiện xem xét lại

Chỉ xem xét lại nếu Phase 2 chứng minh workflow backup mặc định an toàn và dễ hiểu hơn cho người dùng.
