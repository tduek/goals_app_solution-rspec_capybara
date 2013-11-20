require 'spec_helper'

describe Goal do
  context "with an invalid goal" do
    let(:invalid_goal) { Goal.new }

    it "validates presence of title" do
      expect(invalid_goal).to have_at_least(1).error_on(:title)
    end

    it "validates presence of description" do
      expect(invalid_goal).to have_at_least(1).error_on(:description)
    end

    it "can't be marked completed" do
      invalid_goal.mark_completed!

      expect(invalid_goal).to_not be_persisted
    end
  end

  context "with a valid goal" do
    let(:valid_goal) { Goal.new(title: "Awesome title", description: "Even awesomer") }

    it "is valid with a title and description" do
      expect(valid_goal).to be_valid
    end

    it "gets marked completed" do
      valid_goal.mark_completed!

      expect(valid_goal).to be_is_completed
    end
  end
end
