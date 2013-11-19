require 'spec_helper'

describe Goal do
  let(:invalid_goal) { Goal.new }

  it "validates presence of title" do
    expect(invalid_goal).to have_at_least(1).error_on(:title)
  end

  it "validates presence of description" do
    expect(invalid_goal).to have_at_least(1).error_on(:description)
  end
end
