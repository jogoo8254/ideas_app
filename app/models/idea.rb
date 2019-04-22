class Idea < ApplicationRecord
    belongs_to :user
    has_many :created_ideas, dependent: :destroy
    validates(:title, presence: true, uniqueness: true)
    validates(
        :description,  presence: { message: "must exist" }
        )
end
