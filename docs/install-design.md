# Thiết kế cơ chế cài đặt AI Project OS

Tài liệu này là đầu ra của task `P1-T1`. Đây là thiết kế cho các script ở `P1-T2` và `P1-T3`, chưa phải script cài đặt.

## Mục tiêu

Thiết kế cơ chế đưa AI Project OS vào một repository mới hoặc repository đang có theo cách an toàn, có thể kiểm tra trước, không ghi đè nội dung hiện có nếu người dùng chưa chọn rõ.

## Phạm vi

- Cài đặt project-level files từ `starter/` vào root repository đích.
- Cài đặt global rule từ `global/AGENTS.md` vào `~/.codex/AGENTS.md` khi người dùng chọn.
- Hỗ trợ kiểm tra trước bằng dry-run.
- Hỗ trợ phát hiện conflict và báo cáo rõ.
- Làm nền cho script Linux/macOS và Windows PowerShell.

## Ngoài phạm vi

- Không cài dependency production.
- Không cấu hình Git remote.
- Không sửa Git user.name hoặc user.email.
- Không tạo task nghiệp vụ cho dự án đích.
- Không đồng bộ trạng thái tự động giữa các file `.ai/`.
- Không gắn Git tag hoặc đóng gói release.

## Nguồn file

| Nguồn trong repository này | Đích mặc định | Ghi chú |
| --- | --- | --- |
| `starter/AGENTS.md` | `<repo>/AGENTS.md` | Rule project-level cho repository đích |
| `starter/.ai/` | `<repo>/.ai/` | Bộ file trạng thái ban đầu |
| `global/AGENTS.md` | `~/.codex/AGENTS.md` | Chỉ cài khi người dùng chọn global mode |

## Chế độ cài đặt

### Project mode

Cài `starter/AGENTS.md` và `starter/.ai/` vào repository đích.

Yêu cầu:

- Repository đích là thư mục tồn tại.
- Nếu có Git, script phải chạy `git status --short` trước khi ghi file.
- Nếu chưa có Git, script chỉ cảnh báo và không tự `git init` trừ khi người dùng chọn tùy chọn rõ ràng trong task tương lai.

### Global mode

Cài `global/AGENTS.md` vào `~/.codex/AGENTS.md`.

Yêu cầu:

- Tạo thư mục `~/.codex` nếu chưa tồn tại.
- Không ghi đè `~/.codex/AGENTS.md` nếu file đã tồn tại, trừ khi người dùng chọn overwrite.

### Dry-run mode

Chỉ in kế hoạch hành động:

- File sẽ tạo mới.
- File đã tồn tại.
- File có nội dung giống nguồn.
- File có conflict.
- Hành động bị bỏ qua.

Dry-run không ghi file.

## Chính sách ghi file

| Trạng thái file đích | Mặc định | Khi `--overwrite` | Khi `--backup` |
| --- | --- | --- | --- |
| Chưa tồn tại | Tạo file | Tạo file | Tạo file |
| Tồn tại và giống nguồn | Bỏ qua | Bỏ qua | Bỏ qua |
| Tồn tại và khác nguồn | Báo conflict, không ghi | Ghi đè | Tạo bản sao lưu rồi ghi |

`--overwrite` và `--backup` không nên dùng cùng lúc. Nếu người dùng truyền cả hai, script phải báo lỗi tham số.

## Backup

Khi dùng `--backup`, script tạo file sao lưu cạnh file đích theo mẫu:

```text
<tên_file>.bak.<YYYYMMDDHHMMSS>
```

Ví dụ:

```text
AGENTS.md.bak.20260723093000
```

Backup chỉ áp dụng cho file có conflict. Không backup file giống nguồn.

## Conflict

Conflict xảy ra khi:

- File đích tồn tại.
- File đích khác nội dung nguồn.
- Người dùng không chọn `--overwrite` hoặc `--backup`.

Khi có conflict:

- Không ghi file conflict.
- Tiếp tục kiểm tra các file khác nếu an toàn.
- Kết thúc với mã lỗi khác `0`.
- In danh sách conflict và hướng dẫn chạy lại với `--backup` hoặc xử lý thủ công.

## Idempotency

Chạy lại cùng một lệnh trên repository đã cài đặt không được tạo thay đổi mới nếu file nguồn và file đích giống nhau.

Yêu cầu kiểm tra:

- Lần chạy đầu tạo file thiếu.
- Lần chạy thứ hai báo `unchanged` hoặc `skipped`.
- `git status --short` không thay đổi sau lần chạy thứ hai.

## Tham số đề xuất

Tên tham số có thể khác nhẹ giữa shell và PowerShell, nhưng ý nghĩa phải tương đương.

```text
--target <path>       Repository đích, mặc định là thư mục hiện tại
--global              Cài global rule
--dry-run             Chỉ in kế hoạch, không ghi file
--overwrite           Ghi đè file conflict
--backup              Sao lưu file conflict rồi ghi
--yes                 Không hỏi xác nhận tương tác
--help                In hướng dẫn sử dụng
```

## Quy trình project mode

1. Xác định thư mục nguồn của AI Project OS.
2. Xác định target repository.
3. Kiểm tra target tồn tại và là thư mục.
4. Nếu target có Git, chạy `git status --short`.
5. Lập danh sách file cần cài từ `starter/`.
6. So sánh từng file nguồn và file đích.
7. In kế hoạch hành động.
8. Nếu dry-run, dừng tại đây.
9. Nếu có conflict mà không có `--overwrite` hoặc `--backup`, dừng với lỗi.
10. Tạo thư mục cần thiết.
11. Ghi file mới hoặc file được phép ghi.
12. In tổng kết.
13. Nếu target có Git, in lại `git status --short`.

## Quy trình global mode

1. Xác định file nguồn `global/AGENTS.md`.
2. Xác định đích `~/.codex/AGENTS.md`.
3. Tạo `~/.codex` nếu cần.
4. So sánh file nguồn và file đích nếu đã tồn tại.
5. Áp dụng chính sách ghi file.
6. In tổng kết.

## Mã kết thúc đề xuất

| Mã | Ý nghĩa |
| --- | --- |
| `0` | Thành công, không có conflict |
| `1` | Có conflict hoặc tham số không hợp lệ |
| `2` | Target không tồn tại hoặc không thể đọc |
| `3` | Lỗi ghi file |

## Yêu cầu kiểm thử cho script sau này

- Dry-run trên repository trống không ghi file.
- Cài project mode vào thư mục trống.
- Chạy lại project mode để kiểm tra idempotency.
- Cài khi `AGENTS.md` đã tồn tại và khác nội dung.
- Cài với `--backup`.
- Cài với `--overwrite`.
- Cài global mode khi `~/.codex/AGENTS.md` chưa tồn tại.
- Cài global mode khi `~/.codex/AGENTS.md` đã tồn tại và khác nội dung.
- Kiểm tra không dùng `git add .`.
- Kiểm tra script không ghi secret hoặc file `.env`.

## Quyết định thiết kế

- Dùng `starter/` làm nguồn duy nhất cho project-level install.
- Mặc định không ghi đè file đã tồn tại.
- Dry-run là chế độ bắt buộc.
- Backup là cơ chế an toàn ưu tiên hơn overwrite.
- Script Linux/macOS và PowerShell phải có hành vi tương đương.
