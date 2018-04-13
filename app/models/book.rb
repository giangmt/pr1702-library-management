class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  belongs_to :publisher
  has_many :borrows
  validates :author_id, presence: true
  validates :category_id, presence: true
  validates :publisher_id, presence: true
  validates :name, presence: true
  validates :image, presence:true
  validates :page, presence:true
  validates :description, presence: true, length: {maximum: Settings.book.validates.description_maximum}
  scope :load_by_order, ->{order "created_at DESC"}

end
