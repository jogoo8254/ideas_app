class CreateCreatedIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :created_ideas do |t|
      t.text :description
      t.references :idea, foreign_key: true
      t.timestamps
    end
  end
end
