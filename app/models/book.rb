class Book < ApplicationRecord

  has_one_attached :image##おそらく必要ないので後で消す1/23

  belongs_to :user

end
