/*
tầng domain này để làm gì

bao gồm 2 thành phần chính:
Tầng thứ 1 là models:
chứa request và response: class hay là đối tượng
nhưng trong request đặt tên là request
còn nhận response về thì đặt tên là entity
request: truyền data model vào api khi call
response: nhận data về khi đã call api đặt tên là entity - Định nghĩa các thực thể như User, Message

tầng thứ 2 là respository:
- Kết nối giữa domain và các provider, cung cấp các phương thức như
sendMessage, getUserData.

- gọi các hàm call api đã định nghĩa ở service < ví dụ là các hàm login, logout>
nhận dữ liệu trả về entity ở nằm ở domain/model/response >
sau đó xử lí business logic < xử lý các nghiệp vụ liên quan đến dữ liệu đã gọi ra> lý giải
Sau khi call api và trả dữ liệu ra entity thì lưu dữ liệu vào local như token, account info hoặc thao tác gì
đó với dữ liệu >< ví dụ nhận về bạn được 5 điểm nhưng lại hiển thị bạn ra màn hình là 6 điểm>

get.find để gọi ra service đã lưu ở dependency hay là nơi khởi tạo locator
và chỉ sử dụng get.find khi mà những dữ liệu của nó không bị xóa ví du như api hoặc storage hay
và cũng thường dùng trong việc call api vì nó không trực tiếp kế thừa từ lớp GetView

 */