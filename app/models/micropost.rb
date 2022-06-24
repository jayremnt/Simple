class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: I18n.t("microposts.model.must_be_valid_image") },
                    size: { less_than: 5.megabytes,
                            message: I18n.t("microposts.model.should_less_than_5_megabytes") }

  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
