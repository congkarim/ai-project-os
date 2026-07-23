# Plan task P0-T2

File này đã được rút gọn sau khi hoàn thành task theo quy tắc reset.

## Task vừa hoàn thành

- ID: `P0-T2`
- Tên: Rà soát schema và loại bỏ nội dung trùng lặp.
- Ngày hoàn thành: 2026-07-23.

## Các phương án chính đã xem xét

- Rút gọn README và bổ sung ranh giới nguồn sự thật.
- Rút mạnh starter để chỉ còn placeholder.
- Tách schema thành file riêng.

## Phương án được chọn

Rút gọn README và bổ sung ranh giới nguồn sự thật.

## Lý do

Phương án này giảm lặp ở nơi ít rủi ro nhưng vẫn giữ `AGENTS.md` là rule vận hành chính và giữ starter template tự dùng được khi sao chép sang repository mới.

## Phát hiện quan trọng

- `README.md` nên hướng dẫn sử dụng bộ khung, không sao chép đầy đủ workflow đã có trong `AGENTS.md`.
- `global/AGENTS.md` và `starter/AGENTS.md` vẫn cần lặp một số Git rule vì chúng được dùng độc lập ngoài repository này.
- Một số dòng lặp còn lại là cấu trúc Markdown hoặc schema bắt buộc, không nên xóa trong task này.
- Không cần ADR mới vì không thay đổi kiến trúc đã chốt.

## Kết quả kiểm thử

- `wc -l`: tổng Markdown giảm từ 1.439 xuống 1.401 dòng.
- `awk` tìm dòng lặp: đạt, các dòng còn lặp là cấu trúc/schema hoặc rule cần dùng độc lập.
- `rg` keyword/rule quan trọng: đạt.
- Kiểm tra starter không chứa `AI Project OS`, `ai-project-os` hoặc task riêng của repository chính: đạt.
- Kiểm tra global rule không chứa trạng thái task cụ thể: đạt.
- Kiểm tra không có file rỗng: đạt.
- Kiểm tra Markdown cơ bản: đạt, các file Markdown có H1 và code fence cân bằng.
- Kiểm tra thống nhất `P0-T2` giữa `roadmap.md`, `task.md` và `task-checklist.md`: đạt.
- Chạy `git diff --check`: đạt.
- Xem lại diff: đạt.

## Vấn đề chuyển sang task sau

- `P0-T3`: chốt AI Project OS v0.1, bao gồm rà soát lần cuối các tiêu chí release nội bộ trước khi chuyển sang Phase 1.
