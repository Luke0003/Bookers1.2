class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_one_attached :image
  belongs_to :user

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/default-image.jpeg")
      image.attach(io: File.open(file_path), filename: "default_image", content_type: "image/jpeg")
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
