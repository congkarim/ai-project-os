# Plan task P1-T1

File này đã được rút gọn sau khi hoàn thành task theo quy tắc reset.

## Task vừa hoàn thành

- ID: `P1-T1`
- Tên: Thiết kế cơ chế cài đặt vào repository mới.
- Ngày hoàn thành: 2026-07-23.

## Các phương án chính đã xem xét

- Mặc định không ghi đè, báo conflict khi file đích khác nguồn.
- Luôn backup rồi ghi file mới.
- Luôn ghi đè file đích.

## Phương án được chọn

Mặc định không ghi đè, hỗ trợ dry-run, backup và overwrite rõ ràng.

## Lý do

Phương án này bảo toàn file hiện có của người dùng, phù hợp quy tắc an toàn của AI Project OS và vẫn cho phép người dùng chủ động chọn backup hoặc overwrite.

## Phát hiện quan trọng

- Project mode và global mode cần tách rõ vì ghi vào các đích khác nhau.
- Dry-run là yêu cầu bắt buộc để kiểm tra tác động trước khi ghi file.
- Script Linux/macOS và PowerShell phải có hành vi tương đương.
- Cần `ADR-004` để ghi quyết định mặc định không ghi đè.

## Kết quả kiểm thử

- `docs/install-design.md` tồn tại và không rỗng: đạt.
- Tìm `dry-run`, `backup`, `overwrite`, `conflict`, `idempotency`: đạt.
- Kiểm tra không có script mới: đạt.
- Kiểm tra không có file rỗng: đạt.
- Kiểm tra Markdown cơ bản: đạt, các file Markdown có H1 và code fence cân bằng.
- Kiểm tra starter không chứa thông tin riêng của AI Project OS hoặc task Phase 1 của repository chính: đạt.
- Kiểm tra global rule không chứa trạng thái task cụ thể: đạt.
- Kiểm tra thống nhất `P1-T1` giữa `roadmap.md`, `task.md` và `task-checklist.md`: đạt.
- Chạy `git diff --check`: đạt.
- Xem lại diff: đạt.

## Vấn đề chuyển sang task sau

- `P1-T2`: viết script cài đặt cho Linux/macOS theo `docs/install-design.md`, chưa bắt đầu trong task này.
