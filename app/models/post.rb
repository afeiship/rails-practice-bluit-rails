class Post < ApplicationRecord
    belongs_to :category
    belongs_to :user
    
    default_scope { order(updated_at: :desc).includes(:category) }

    validates :title, length: { maximum: 255 }, presence: true
    enum post_type: [:link, :text]

    self.per_page = 4

    # presence: 出席 
    validates :link, presence: true, if: :link?
    validates :body, presence: true, if: :text?
    validates :category_id, presence: true
    
end