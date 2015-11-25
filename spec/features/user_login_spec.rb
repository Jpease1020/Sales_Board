require 'rails_helper'

describe 'the login page', type: :feature do
  describe "as a registered salesperson loggin in" do
    it "loggs me in and takes me to my sales summary page" do
      visit '/'
      select(value='salesperson', :from => 'user_name')
      page.fill_in("Password", with: "password")
      click_button("Login")
      save_and_open_page
      expect(page).to have_content("Welcome Sales Person")
    end
  end
end
