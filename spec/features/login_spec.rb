require 'rails_helper'

RSpec.describe "login", :type => :view do

  it "displays 'Login' link if the user is not logged in" do
    visit '/'
    expect(page.body).to have_link('Login', href: root_path)
  end

  it "'Hi' message appears if the user is logged in" do
    visit '/sessions/new'
    fill_in 'name', with: 'a session has no name'
    click_button 'Login'
    expect(page.body).not_to have_link('Login', href: root_path)
  end

end
