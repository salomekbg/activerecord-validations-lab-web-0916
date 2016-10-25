class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :clickbait

  def clickbait
    array = ["Won't Believe", "Secret", "Top" "Guess"]
    if title && array.none?{ |element| title.include?(element)}
        errors.add(:title, "has to be clickbaity")
    end
  end
end
