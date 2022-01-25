class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  # has_one_attached :profile_image
  # # プロフィール画像用

  # def get_profile_image(size)
  #   unless profile_image.attached?
  #     file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
  #     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   profile_image.variant(resize: size).processed
  # end
  # プロフィール画像関連については一旦保留

end
