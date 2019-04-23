require 'rails_helper'

RSpec.describe Idea, type: :model do

  def idea
    @idea ||= FactoryBot.build(:idea)
  end
  describe "validates" do
    it("requires a title") do
      # GIVEN
      i = idea
      i.title = nil

      # WHEN
      idea.valid?

       # THEN

       expect(idea.errors.messages).to(have_key(:title))
    end

    it 'requires a unique title' do

	persisted_i = FactoryBot.create(
        :idea,
        title: "Lunch time"
      )

      i = FactoryBot.build(
        :idea,
        title: persisted_i.title
      )

      # WHEN
      i.valid?
      # THEN
      expect(i.errors.messages).to(have_key(:title))
      expect(i.errors.messages[:title]).to(include("has already been taken"))
    end
  end

  describe ".search" do
    it("returns only job posts containing the search term, regardless of case") do
      # GIVEN
      idea_a = FactoryBot.create(
        :idea,
        title: "My day"
      )
      idea_b = FactoryBot.create(
        :idea,
        title: "My weekend"
      )
      idea_c = FactoryBot.create(
        :idea,
        title: "Plans for the summer"
      )
	  idea_d = FactoryBot.create(
        :idea,
        title: "My home"
      )
      idea_e = FactoryBot.create(
        :idea,
        title: "My new year's resolution"
      )
      idea_f = FactoryBot.create(
        :idea,
        title: "Winter seems to be over"
      )
      # WHEN
      results = Idea.search('My')

      # THEN
      expect(results).to(eq([idea_a, idea_c]))
    end
  end

end