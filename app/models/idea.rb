class Idea < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :likers, through: :likes, source: :user  
    belongs_to :user
    has_many :created_ideas, dependent: :destroy
    validates(:title, presence: true, uniqueness: true)
    validates(
        :description,  presence: { message: "must exist" }
        )
end
