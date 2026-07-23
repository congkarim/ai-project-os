# Checklist task P0-T2

Ký hiệu:

- `[ ]` Chưa hoàn thành
- `[x]` Đã hoàn thành
- `[~]` Đang thực hiện
- `[!]` Bị chặn
- `[-]` Không áp dụng

Trước khi đóng task, không được còn `[~]` hoặc `[!]`.

## Chuẩn bị

- [x] Xác nhận task tiếp theo từ `P0-T1` là `P0-T2`.
- [x] Đọc `AGENTS.md`.
- [x] Đọc `.ai/context.md`.
- [x] Đọc `.ai/roadmap.md`.
- [x] Đọc `.ai/task.md` cũ.
- [x] Đọc `.ai/task-checklist.md` cũ.
- [x] Đọc `.ai/plan.md`.
- [x] Đọc `.ai/decisions.md`.
- [x] Chạy `git status --short` trước khi sửa.

## Khảo sát repository

- [x] Liệt kê các file Markdown.
- [x] Thống kê số dòng từng file bằng `wc -l`.
- [x] Tìm dòng lặp bằng `awk`.
- [x] Tìm rule/keyword quan trọng bằng `rg`.
- [x] Xác định các đoạn lặp cần giữ vì phục vụ vai trò khác nhau.
- [x] Xác định các đoạn lặp cần rút gọn.

## Thiết kế

- [x] Chốt root `AGENTS.md` là nguồn sự thật workflow cho repository này.
- [x] Chốt `README.md` là hướng dẫn sử dụng, không phải rule vận hành đầy đủ.
- [x] Chốt `global/AGENTS.md` là rule chung tối thiểu.
- [x] Chốt `starter/AGENTS.md` phải độc lập cho repository mới.
- [x] Chốt danh sách file cần sửa.

## Triển khai

- [x] Chuyển `roadmap.md` sang task `P0-T2`.
- [x] Viết lại `.ai/task.md` cho `P0-T2`.
- [x] Viết lại `.ai/task-checklist.md` cho `P0-T2`.
- [x] Viết lại `.ai/plan.md` cho `P0-T2`.
- [x] Rút gọn `README.md` ở các đoạn lặp workflow.
- [x] Bổ sung ranh giới nguồn sự thật nếu cần.
- [x] Cập nhật checklist sau khi sửa nội dung.

## Kiểm tra nội dung

- [x] Kiểm tra README còn đủ hướng dẫn áp dụng bộ khung.
- [x] Kiểm tra root `AGENTS.md` còn đủ workflow, Definition of Done và Git rule.
- [x] Kiểm tra `global/AGENTS.md` không chứa trạng thái task cụ thể.
- [x] Kiểm tra `starter/AGENTS.md` còn dùng được độc lập.
- [x] Kiểm tra `starter/.ai/` vẫn có schema đầy đủ và placeholder rõ ràng.
- [x] Kiểm tra `decisions.md` không cần ADR mới.

## Kiểm thử kỹ thuật

- [x] Chạy `wc -l` sau khi chỉnh.
- [x] Chạy `awk` tìm dòng lặp sau khi chỉnh.
- [x] Chạy `rg` tìm keyword/rule quan trọng.
- [x] Kiểm tra starter không chứa thông tin riêng như tên `AI Project OS`.
- [x] Kiểm tra global rule không chứa trạng thái task cụ thể.
- [x] Kiểm tra không có file rỗng.
- [x] Kiểm tra Markdown cơ bản.
- [x] Kiểm tra `roadmap.md`, `task.md` và `task-checklist.md` thống nhất về `P0-T2`.
- [x] Chạy `git diff --check`.
- [x] Xem lại toàn bộ `git diff`.

## Cập nhật tài liệu

- [x] Chuyển `P0-T2` thành `DONE` trong `.ai/roadmap.md`.
- [x] Ghi kết quả thực hiện vào `.ai/task.md`.
- [x] Đặt task tiếp theo dự kiến là `P0-T3`.
- [x] Rút gọn `.ai/plan.md` theo quy tắc reset.
- [x] Cập nhật checklist sau khi kiểm thử đạt.

## Kiểm tra Git

- [x] Chạy `git status --short` trước khi stage.
- [x] Stage chính xác file thuộc task, không dùng git add . trong mọi trường hợp.
- [x] Chạy `git diff --cached`.
- [x] Commit với thông điệp `[P0-T2] Rà soát schema và giảm trùng lặp`.
- [x] Lấy commit hash sau commit.

## Đóng task

- [x] Xác nhận Definition of Done đã đủ.
- [x] Xác nhận không còn `[~]` hoặc `[!]`.
- [x] Xác nhận không còn mục bắt buộc `[ ]`.
- [x] Xác nhận task không bắt đầu `P0-T3`.

## Chuẩn bị handoff

- [x] Báo cáo file đã tạo hoặc sửa.
- [x] Báo cáo kiểm thử đã chạy.
- [x] Báo cáo kết quả kiểm thử.
- [x] Báo cáo commit hash.
- [x] Báo cáo task tiếp theo.
- [x] Báo cáo giới hạn hoặc vấn đề còn lại nếu có.
