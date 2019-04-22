class Idea < ApplicationRecord
    has_many :created_ideas, dependent: :destroy
    validates(:title, presence: true, uniqueness: true)
    validates(
        :description,  presence: { message: "must exist" }
        )
        validates(
            :view_count, numericality: {
               greater_than_or_equal_to: 0
             }
          )
end
