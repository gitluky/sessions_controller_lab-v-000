require 'rails_helper'

RSpec.describe "login", :type => :view do

  it "displays 'Login' link if the user is not logged in" do
    visit '/'
    expect(page.body).to have_link('Login', href: root_path)
  end

  it "'Hi' message appears if the user is logged in" do
    visit '/sessions/new'
    fill_in 'name', with: 'a session has no name'
    click_button 'login'
    expect(page.body).to have_content('Hi, a session has no name')
  end

  it "redirects user to login when user enters a blank name" do
    visit '/logout'
    visit '/sessions/new'
    fill_in 'name', with: ''
    click_button 'login'
    expect(response).to redirect_to sessions_new_path
  end

end
