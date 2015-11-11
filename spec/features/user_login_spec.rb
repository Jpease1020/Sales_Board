require 'rails_helper'

describe 'the login page', type: :feature do
  describe "as a registered salesperson loggin in" do
    it "loggs me in and takes me to the sales summary page" do
      visit "login"
      click_button "Login"
      expect(page).to have_content("Welcome Sales Person")
    end
  end
end
