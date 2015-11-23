require 'rails_helper'

describe 'the login page', type: :feature do
  describe "as an admin loggin in" do
    it "loggs me in and takes me to the company sales summary page" do
      visit '/'
      # select(value='Justin', :from => 'user[name]')
      # within 'user[name]' do
      #   find("option[value='Justin']").click
      # end
      # find_field("user_name").select("Justin").click
      within "#names" do
        find('value[Justin]', text: 'Justin').select_option
      end
      fill_in(password)
      page.fill_in("Password", with: "password")
      expect(page).to have_content("Justin")
    end
  end
end
