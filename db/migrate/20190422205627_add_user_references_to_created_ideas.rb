class AddUserReferencesToCreatedIdeas < ActiveRecord::Migration[5.2]
  def change
    add_reference :created_ideas, :user, foreign_key: true
  end
end
