require 'rails_helper'

RSpec.describe "login", :type => :view do
  it "displays 'Login' link if the user is not logged in" do
    visit '/'
    expect(page.body).to have_link('Login', href: root_path)
  end

  it "'Hi' message appears if the user is logged in" do
    session[:name] = 'a session has no name'
    render root
    expect(page.body).not_to have_link('Login', href: root_path)
  end

end
