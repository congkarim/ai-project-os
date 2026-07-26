# Ghi chú phát hành AI Project OS v1.0.0

Ngày đóng gói nội dung: 2026-07-26.

Ngày phát hành: 2026-07-26.

Đây là bản phát hành chính thức đầu tiên của AI Project OS sau khi hoàn thành Phase 0–3. Git tag `v1.0.0` trỏ tới commit đóng gói `973aef7e91ba4aa48c2c22ebde42ffecdcbfa52b`. GitHub Release: https://github.com/congkarim/ai-project-os/releases/tag/v1.0.0

## Phạm vi bản phát hành

`v1.0.0` gồm bộ khung tài liệu, template starter, global rule mẫu, thiết kế cài đặt và script cài đặt cho Linux/macOS cùng Windows PowerShell.

## Cách dùng

1. Sao chép repository hoặc lấy đúng commit/tag `v1.0.0`.
2. Cài vào dự án mới bằng script hoặc sao chép thủ công từ `starter/`.
3. Tùy chọn cài `global/AGENTS.md` vào `~/.codex/AGENTS.md`.
4. Điền `.ai/context.md` và `roadmap.md` theo dự án thật.

Xem chi tiết trong `README.md`.

## Danh mục thành phần

| Thành phần | Đường dẫn | Vai trò |
| --- | --- | --- |
| Quy tắc project-level | `AGENTS.md` | Điểm khởi động coding agent |
| Hướng dẫn sử dụng | `README.md` | Hướng dẫn người dùng |
| Phiên bản | `VERSION` | Số phiên bản hiện tại |
| Changelog | `CHANGELOG.md` | Nhật ký thay đổi |
| Bối cảnh | `.ai/context.md` | Phạm vi và ràng buộc dài hạn |
| Roadmap | `.ai/roadmap.md` | Phase và task |
| Task hiện tại | `.ai/task.md` | Task đang xử lý |
| Checklist | `.ai/task-checklist.md` | Tiến độ task |
| Kế hoạch tạm | `.ai/plan.md` | Phân tích phương án |
| Quyết định | `.ai/decisions.md` | ADR |
| Thiết kế cài đặt | `docs/install-design.md` | Thiết kế script |
| Ghi chú phát hành | `docs/release-v1.0.0.md` | Tài liệu đóng gói này |
| Script Linux/macOS | `scripts/install.sh` | Cài đặt project/global |
| Script Windows | `scripts/install.ps1` | Cài đặt project/global |
| Global rule mẫu | `global/AGENTS.md` | Rule chung Codex |
| Starter rule | `starter/AGENTS.md` | Template project rule |
| Starter `.ai/` | `starter/.ai/*` | Template trạng thái sạch |

## Kiểm thử đã xác nhận trước khi đóng gói

- Phase 1: idempotency và bảo toàn file hiện có.
- Phase 2: repository mẫu, dự án đang phát triển, tiếp quản phiên mới.

## Ngoài phạm vi v1.0.0

- Kiểm tra schema Markdown tự động.
- Đồng bộ trạng thái tự động giữa các file `.ai/`.
- Workflow CI/CD.
- Package registry (npm, pip, v.v.).

## Nâng cấp từ v0.1.0

Người dùng đang dùng baseline `v0.1.0` có thể:

1. Cập nhật bản sao AI Project OS lên nội dung `v1.0.0`.
2. Giữ nguyên `AGENTS.md` / `.ai/` của dự án đích nếu đã tùy biến.
3. Dùng script cài đặt ở chế độ mặc định để tránh ghi đè; chỉ dùng `--backup` hoặc `--overwrite` khi chủ đích.
