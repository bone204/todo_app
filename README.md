
# Todo App

TodoApp là một ứng dụng Flutter giúp người dùng tạo, theo dõi và quản lý danh sách công việc hằng ngày một cách nhanh chóng và hiệu quả. Dữ liệu được lưu trữ cục bộ bằng shared_preferences, đảm bảo tốc độ truy cập nhanh và không cần kết nối internet.


## Tính năng

- Tạo công việc mới: Người dùng có thể thêm công việc cần làm kèm mô tả.

- Hiển thị danh sách công việc: Giao diện rõ ràng, hiển thị danh sách các công việc đã tạo.

- Đánh dấu hoàn thành: Cho phép người dùng đánh dấu công việc đã hoàn tất.

- Xoá công việc: Xoá từng công việc hoặc toàn bộ danh sách.

- Lưu dữ liệu cục bộ: Sử dụng shared_preferences để lưu và khôi phục danh sách công việc khi mở lại ứng dụng.


## Công nghệ sử dụng

- Flutter: Framework chính dùng để xây dựng giao diện và logic ứng dụng.

- Dart: Ngôn ngữ lập trình được sử dụng trong Flutter.

- shared_preferences: Dùng để lưu trữ danh sách công việc cục bộ ở dạng JSON.

- BloC: Kiến trúc quản lý trạng thái giúp tách biệt giao diện (UI) và logic xử lý (business logic).


## Cài đặt

Clone repository

```bash
  git clone https://github.com/bone204/todo_app.git
```

Điều hướng terminal tới thư mục dự án

```bash
  cd todo_app
```

Cài đặt dependencies

```bash
  flutter pub get
```

Chạy ứng dụng

```bash
  flutter run hoặc bấm f5
```

