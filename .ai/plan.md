# Plan task P3-T2

File này đã được rút gọn sau khi hoàn thành task theo quy tắc reset.

## Task vừa hoàn thành

- ID: `P3-T2`
- Tên: Đóng gói phiên bản `v1.0.0`.
- Ngày hoàn thành: 2026-07-26.

## Phương án được chọn

Đóng gói source-tree versioned: `VERSION` + `CHANGELOG.md` + `docs/release-v1.0.0.md` + cập nhật baseline; ADR-005.

## Kết quả

- Baseline chuyển sang `v1.0.0`.
- Chưa gắn Git tag `v1.0.0`.
- Không tạo npm/pip hoặc archive.

## Vấn đề chuyển sang task sau

- `P3-T3`: gắn Git tag `v1.0.0` và phát hành (GitHub Release nếu phù hợp).
- PowerShell runtime vẫn cần môi trường có `pwsh` hoặc Windows PowerShell.
