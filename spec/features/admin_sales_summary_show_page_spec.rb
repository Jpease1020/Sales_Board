require 'rails_helper'

feature 'the login page' do
  fixtures :sales
  fixtures :users

  describe "as an admin loggin in" do

    before(:each) do
      it "loggs me in and takes me to the company sales summary page" do
        # visit '/'
        # select(value='Admin', :from => 'user_name')
        # page.fill_in("Password", with: "adminpassword")
        # expect(current_path).to eq.(admin_home_path)
        # expect(page).to have_content("Admin")
        assert_equal 7, Sale.count
      end
    end

    it "after I am logged in, I am directed to a page that displays the sales summary for the current month" do

    end

  end
end
