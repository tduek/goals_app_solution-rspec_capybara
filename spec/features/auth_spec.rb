require 'spec_helper'

describe "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  describe "signing up a user" do
    it "shows username on the homepage after signup" do
      visit new_user_url
      fill_in "user_username", with: "Tommy"
      fill_in "user_password", with: "crack_this_i_dare_you"
      click_on "Save"

      expect(page).to have_content("Tommy")
    end
  end

end

describe "logging in" do
  let(:user) { User.create(username: "Tommy", password: "uncrackable") }
  before(:each) do
     visit root_url
     fill_in "username", with: user.username
   end

  it "shows username on the homepage after successful login" do
    fill_in "password", with: "uncrackable"
    click_on "Log in"

    expect(page).to have_content("Successfully logged in")
    expect(page).to have_button("Log out")
  end

  it "shows 'invalid username/password combo' on failed login" do
    fill_in "password", with: "keep_trying"
    click_on "Log in"

    expect(page).to have_content("Invalid username/password combo")
  end

end

describe "logging out" do
  let(:user) { User.create(username: "Tommy", password: "uncrackable") }

  it "begins with logged out state" do
    visit root_url
    expect(page).to have_button("Log in")
  end

  it "doesn't show username on the homepage after logout" do
    visit root_url
    fill_in "username", with: user.username
    fill_in "password", with: "uncrackable"
    click_on "Log in"
    click_on "Log out"

    expect(page).to have_content("Successfully logged out")
  end
end