class Post < ApplicationRecord
  validates :title, presence: :true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_is_clickbait

  def title_is_clickbait
    clickbaity_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if clickbaity_titles.include?(:title) || title == "True Facts"
      errors.add(:title, "Your title needs to be more clickbaity!")
    end
  end

end
