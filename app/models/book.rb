class Book < ApplicationRecord

  has_one_attached :image##おそらく必要ないので後で消す

  belongs_to :user

end
