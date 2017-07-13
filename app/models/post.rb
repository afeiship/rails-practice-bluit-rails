class Post < ApplicationRecord
    validates :title, length: { maximum: 255 }, presence: true
    enum post_type: [:link, :text]

    # presence: 出席 
    validates :link, presence: true, if: :link?
    validates :body, presence: true, if: :text?
    
end