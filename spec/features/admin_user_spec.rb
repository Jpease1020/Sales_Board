require 'rails_helper'

describe 'the login page', type: :feature do
  describe "as an admin loggin in" do
    it "loggs me in and takes me to the company sales summary page" do
      visit '/'
      ("User Name", with: "Justin")
      page.fill_in("Password", with: "password")
      click_button("Login")
      expect(page).to have_content("Welcome Sales Person")
    end
  end
end
