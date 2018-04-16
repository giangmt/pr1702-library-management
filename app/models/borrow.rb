class Borrow < ApplicationRecord
  belongs_to :book
  belongs_to :user

  enum status: [:pending, :accepted, :discard]

  scope :load_by_order, ->{order created_at: :desc}
end
