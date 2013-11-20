require 'spec_helper'

feature "Goals" do
  2.times { FactoryGirl.create(:user_with_goals) }

  context "when not signed in" do
    it "should allow to see goals index" do
      visit goals_url

      expect(page).to have_content("Goals index")
    end
  end

  context "when signed in" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { sign_in(user) }

    it "redirects to user show page on sign in" do
      expect(page).to have_content(user.username)
    end

  end

end