# Roadmap

## Mục tiêu tổng thể

Tạo bộ khung AI Project OS có thể tái sử dụng trong nhiều repository để quản lý bối cảnh, roadmap, task, checklist, kế hoạch và quyết định dài hạn khi làm việc với Codex hoặc coding agent khác.

## Chú giải trạng thái

- `TODO`: chưa bắt đầu.
- `PLANNING`: đang phân tích và chốt phương án.
- `DOING`: đang triển khai.
- `VERIFYING`: đang kiểm thử và đối chiếu tiêu chí hoàn thành.
- `DONE`: đã hoàn thành và đã commit.
- `HANDOFF`: đã bàn giao, sẵn sàng chuyển task.

## Trạng thái hiện tại

- Phase hiện tại: Phase 0 - Foundation.
- Task hiện tại: `P0-T1` - Khởi tạo nền tảng AI Project OS.
- Trạng thái task hiện tại: `DONE`.
- Tiến độ: đã tạo bộ quy tắc và template ban đầu, đã chạy kiểm thử bắt buộc.

## Bảng các phase

| Phase | Tên | Mục tiêu | Trạng thái |
| --- | --- | --- | --- |
| Phase 0 | Foundation | Tạo nền tảng tài liệu và schema ban đầu | `DONE` |
| Phase 1 | Automation | Thiết kế và viết cơ chế cài đặt | `TODO` |
| Phase 2 | Validation | Thử nghiệm trên repository mẫu và dự án thật | `TODO` |
| Phase 3 | Release | Hoàn thiện hướng dẫn và phát hành | `TODO` |

## Các task trong từng phase

### Phase 0 - Foundation

| ID | Task | Trạng thái |
| --- | --- | --- |
| `P0-T1` | Khởi tạo nền tảng AI Project OS | `DONE` |
| `P0-T2` | Rà soát schema và loại bỏ nội dung trùng lặp | `TODO` |
| `P0-T3` | Chốt AI Project OS v0.1 | `TODO` |

### Phase 1 - Automation

| ID | Task | Trạng thái |
| --- | --- | --- |
| `P1-T1` | Thiết kế cơ chế cài đặt vào repository mới | `TODO` |
| `P1-T2` | Viết script cài đặt cho Linux/macOS | `TODO` |
| `P1-T3` | Viết script cài đặt cho Windows PowerShell | `TODO` |
| `P1-T4` | Kiểm thử idempotency và bảo toàn file hiện có | `TODO` |

### Phase 2 - Validation

| ID | Task | Trạng thái |
| --- | --- | --- |
| `P2-T1` | Thử nghiệm trên một repository mẫu | `TODO` |
| `P2-T2` | Thử nghiệm trên một dự án đang phát triển | `TODO` |
| `P2-T3` | Đánh giá khả năng tiếp quản sau khi mở phiên Codex mới | `TODO` |

### Phase 3 - Release

| ID | Task | Trạng thái |
| --- | --- | --- |
| `P3-T1` | Hoàn thiện tài liệu hướng dẫn | `TODO` |
| `P3-T2` | Đóng gói phiên bản `v1.0.0` | `TODO` |
| `P3-T3` | Gắn Git tag và phát hành | `TODO` |

## Task hiện tại

- ID: `P0-T1`
- Tên: Khởi tạo nền tảng AI Project OS
- Trạng thái: `DONE`
- Mục tiêu: tạo cấu trúc tài liệu, rule và starter template để dùng lại cho các repository khác.

## Task tiếp theo dự kiến

- `P0-T2`: Rà soát schema và loại bỏ nội dung trùng lặp.

## Phụ thuộc

- Cần Git repository hoạt động để commit task.
- Không phụ thuộc dependency production.
- Không phụ thuộc network.

## Rủi ro hoặc blocker

- Git identity cục bộ có thể chưa được cấu hình, khiến commit thất bại.
- Nội dung template có thể trùng lặp giữa root và starter, cần rà soát ở `P0-T2`.

## Nhật ký cập nhật ngắn

- 2026-07-23: Khởi tạo roadmap ban đầu cho AI Project OS và bắt đầu `P0-T1`.
- 2026-07-23: Hoàn thành `P0-T1`; task tiếp theo dự kiến là `P0-T2`.
