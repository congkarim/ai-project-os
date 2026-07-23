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

- Phase hiện tại: Phase 2 - Validation.
- Task hiện tại: `P2-T1` - Thử nghiệm trên một repository mẫu.
- Trạng thái task hiện tại: `DONE`.
- Tiến độ: đã thử nghiệm áp dụng AI Project OS vào repository mẫu trong `/tmp`.

## Bảng các phase

| Phase | Tên | Mục tiêu | Trạng thái |
| --- | --- | --- | --- |
| Phase 0 | Foundation | Tạo nền tảng tài liệu và schema ban đầu | `DONE` |
| Phase 1 | Automation | Thiết kế và viết cơ chế cài đặt | `DONE` |
| Phase 2 | Validation | Thử nghiệm trên repository mẫu và dự án thật | `DOING` |
| Phase 3 | Release | Hoàn thiện hướng dẫn và phát hành | `TODO` |

## Các task trong từng phase

### Phase 0 - Foundation

| ID | Task | Trạng thái |
| --- | --- | --- |
| `P0-T1` | Khởi tạo nền tảng AI Project OS | `DONE` |
| `P0-T2` | Rà soát schema và loại bỏ nội dung trùng lặp | `DONE` |
| `P0-T3` | Chốt AI Project OS v0.1 | `DONE` |

### Phase 1 - Automation

| ID | Task | Trạng thái |
| --- | --- | --- |
| `P1-T1` | Thiết kế cơ chế cài đặt vào repository mới | `DONE` |
| `P1-T2` | Viết script cài đặt cho Linux/macOS | `DONE` |
| `P1-T3` | Viết script cài đặt cho Windows PowerShell | `DONE` |
| `P1-T4` | Kiểm thử idempotency và bảo toàn file hiện có | `DONE` |

### Phase 2 - Validation

| ID | Task | Trạng thái |
| --- | --- | --- |
| `P2-T1` | Thử nghiệm trên một repository mẫu | `DONE` |
| `P2-T2` | Thử nghiệm trên một dự án đang phát triển | `TODO` |
| `P2-T3` | Đánh giá khả năng tiếp quản sau khi mở phiên Codex mới | `TODO` |

### Phase 3 - Release

| ID | Task | Trạng thái |
| --- | --- | --- |
| `P3-T1` | Hoàn thiện tài liệu hướng dẫn | `TODO` |
| `P3-T2` | Đóng gói phiên bản `v1.0.0` | `TODO` |
| `P3-T3` | Gắn Git tag và phát hành | `TODO` |

## Task hiện tại

- ID: `P2-T1`
- Tên: Thử nghiệm trên một repository mẫu
- Trạng thái: `DONE`
- Mục tiêu: áp dụng AI Project OS vào một Git repository mẫu để xác nhận starter và script cài đặt tạo được bộ khung dùng được.

## Task tiếp theo dự kiến

- `P2-T2`: Thử nghiệm trên một dự án đang phát triển.

## Phụ thuộc

- Cần Git repository hoạt động để commit task.
- Không phụ thuộc dependency production.
- Không phụ thuộc network.

## Rủi ro hoặc blocker

- Git identity cục bộ có thể chưa được cấu hình, khiến commit thất bại.
- Script cài đặt sau này phải giữ hành vi tương đương giữa Linux/macOS và Windows.
- Cần kiểm thử idempotency kỹ ở `P1-T4`.

## Nhật ký cập nhật ngắn

- 2026-07-23: Khởi tạo roadmap ban đầu cho AI Project OS và bắt đầu `P0-T1`.
- 2026-07-23: Hoàn thành `P0-T1`; task tiếp theo dự kiến là `P0-T2`.
- 2026-07-23: Bắt đầu `P0-T2` để rà soát schema và loại bỏ nội dung trùng lặp.
- 2026-07-23: Hoàn thành `P0-T2`; task tiếp theo dự kiến là `P0-T3`.
- 2026-07-23: Bắt đầu `P0-T3` để chốt baseline AI Project OS v0.1.
- 2026-07-23: Hoàn thành `P0-T3`; Phase 0 hoàn thành, task tiếp theo dự kiến là `P1-T1`.
- 2026-07-23: Bắt đầu `P1-T1` để thiết kế cơ chế cài đặt vào repository mới.
- 2026-07-23: Hoàn thành `P1-T1`; task tiếp theo dự kiến là `P1-T2`.
- 2026-07-23: Bắt đầu `P1-T2` để viết script cài đặt cho Linux/macOS.
- 2026-07-23: Hoàn thành `P1-T2`; task tiếp theo dự kiến là `P1-T3`.
- 2026-07-23: Bắt đầu `P1-T3` để viết script cài đặt cho Windows PowerShell.
- 2026-07-23: Hoàn thành `P1-T3`; task tiếp theo dự kiến là `P1-T4`.
- 2026-07-23: Bắt đầu `P1-T4` để kiểm thử idempotency và bảo toàn file hiện có.
- 2026-07-23: Hoàn thành `P1-T4`; Phase 1 hoàn thành, task tiếp theo dự kiến là `P2-T1`.
- 2026-07-23: Bắt đầu `P2-T1` để thử nghiệm trên một repository mẫu.
- 2026-07-23: Hoàn thành `P2-T1`; task tiếp theo dự kiến là `P2-T2`.
