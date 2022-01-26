class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length:{ maximum: 200 }
  ##最大200文字まで

end
