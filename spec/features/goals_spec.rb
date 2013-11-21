require 'spec_helper'

feature "Goals" do
  2.times { FactoryGirl.create(:user_with_goals) }

  context "when not signed in" do
    it "should allow to see goals index" do
      visit goals_url

      expect(page).to have_content("Goals index")
    end

    it "doesn't allow you to visit new goal view" do
      visit new_goal_url

      expect(page).to have_content("You must be logged in")
    end

    it "doesn't allow you to visit a goal edit view" do
      visit edit_goal_url(1)

      expect(page).to have_content("You don't have permission")
    end

    it "doesn't have links to mark goals completed" do
      visit goals_url

      expect(page).to_not have_button("Completed!")
    end
  end

  context "when signed in" do
    let(:user_with_goals) { FactoryGirl.create(:user_with_goals) }
    # before(:each) { sign_in(user_with_goals) }

    it "redirects to user show page on sign in" do
      sign_in(user_with_goals)
      expect(page).to have_content(user_with_goals.username)
    end

    it "allows you to edit your own goals" do
      sign_in(user_with_goals)
      visit edit_goal_url(user_with_goals.goals.last)
      puts user_with_goals.goals.first.user_id

      expect(page).to have_content("Edit goal")
    end

  end

end