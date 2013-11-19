require 'spec_helper'

describe User do
  context "without giving it any attributes" do
    let(:empty_user) { User.new }

    it "has a session_token anyways" do
      expect(empty_user.session_token).to_not be(nil)
    end

    it "validates presence of username" do
      expect(empty_user).to have_at_least(1).error_on(:username)
    end
  end

  context "with a username" do
    let(:valid_user) { User.new(username: "Tommy") }

    it "is valid" do
      expect(valid_user).to be_valid
    end
  end
end
