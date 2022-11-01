class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_is_clickbait?

    def title_is_clickbait?
        if !title
            return
        end
       unless self.title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
        errors.add(:title, "make it juicier")
       end
    end
end
