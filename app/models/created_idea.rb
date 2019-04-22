class CreatedIdea < ApplicationRecord
    belongs_to :user
    belongs_to :idea
    validates :description, presence: true

end
