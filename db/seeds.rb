# Categories
Category.create!(name: "Truyện đọc")
# Publishers
Publisher.create!(name: "NXB Trẻ")
# Author
Author.create!(name:"Charles Dickens",
  description: "Charles Dickens")
#Books
Book.create!(name:  "Tôi là gay",
  image: "https://307a0e78.vws.vegacdn.vn/view/v2/image/img.book/0/0/0/10544.jpg",
  page: "200",
  category_id: "1",
  publisher_id: "1",
  description: "Lúc viết cuốn sách này, tôi nghĩ tới luật nhân quả. Bụt dạy, có nhân ắt có quả, muốn không quả thì đừng có nhân. Nhưng trời ơi, làm sao mà bứt hết được những quả Đớn Đau, Tăm Tối nếu người ta cứ vãi mầm thành kiến và kỳ thị lên đầu người đồng tính...",
  author_id: "1")
Author.create!(name: "Dale Carnegie",
  description: "Dale Carnegie")
# Category
Category.create!(name: "Kỹ năng sống")
# Publisher
Publisher.create!(name: "NXB Thanh Niên")
# Book
Book.create!(name: "Bậc thầy của nghệ thuật giao tiếp",
  page: "330",
  author_id: 2,
  image: "https://307a0e78.vws.vegacdn.vn/view/v2/image/img.book/0/0/0/17289.jpg",
  category_id: 2,
  publisher_id: 2,
  description: "Dale Carnegie là bậc thầy nhân sinh vĩ đại của thế kỷ XX. Nửa thế kỷ trở lại đây, danh tiếng của ông ngày càng được nhiều người biết đến.")
User.create!(name: "giangmt",
  email: "giangmt@gmail.com",
  fullname: "Mai Truong Giang",
  phone: 1693995313,
  password: "123456",
  password_confirmation: "123456",
  admin: true)
