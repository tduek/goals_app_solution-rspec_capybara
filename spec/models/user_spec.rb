require 'spec_helper'

describe User do
  context "without giving it any attributes" do
    let(:empty_user) { User.new }

    it "has a session_token anyways" do
      expect(empty_user).to_not be(nil)
    end

    it "validates presence of username" do
      expect(empty_user).to have_at_least(1).error_on(:username)
    end
  end

  context "with a username" do
    let(:user) { User.new }

    it "is valid" do
      expect(user).to be_valid
    end
  end
end
