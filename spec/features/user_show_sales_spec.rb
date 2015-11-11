require "rails_helper"

describe "logged in salesperson is directed to thier sales show page", type: :feature do

  before(:each) do
    visit '/'
    page.fill_in("User Name", with: "Justin")
    page.fill_in("Password", with: "password")
    # save_and_open_page
    click_button("Login")
  end

  describe "as a sales person, when I log in" do

    it "takes me to my show page where I can see my current sales summary for the month" do
    assert sales_path, current_path
    end

    
  end

end
