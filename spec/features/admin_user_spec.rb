require 'rails_helper'

describe 'the login page', type: :feature do
  describe "as an admin loggin in" do
    # User.create(name: "Admin", password: "admin", role: 3, assistant_id: 0)
    # User.create(name: "Assistant", password: "password", role: 2, assistant_id: 0)
    # User.create(name: "salesperson", password: "password", role: 1, assistant_id: 2)
    # User.create(name: "salesperson2", password: "password", role: 1, assistant_id: 2)
    before(:each) do
        visit '/'

        select(value='Admin', :from => 'user_name')
        page.fill_in("Password", with: "admin")
        expect(page).to have_content("Admin")
    end

    it "loggs me in and takes me to the company sales summary page" do
      visit '/'
      select(value='Admin', :from => 'user_name')
      page.fill_in("Password", with: "admin")
      expect(page).to have_content("Admin")
    end
  end
end
