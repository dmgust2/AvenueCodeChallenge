require 'rails_helper'

# rspec spec/integration/sign_in_spec.rb


# TODO: Debug and get working
describe 'The sign-in process', :type => :feature do
  before :each do
    # Seed a user
    @user_1 = FactoryGirl.create(:user_1)
  end

  it 'signs me in' do
    visit '/users/sign_in'
    # Route: devise/sessions#new
    # CSS: app/assets/stylesheets/devise/new.css
    # new -> sign_in_up_div/sign_in_up_form_div/
    # TODO: Capybara::ElementNotFound:
    # Unable to find visible field "Email" that is not disabled within #<Capybara::Node::Element tag="div" path="/html/body/div/div[3]/form/div[1]">
    find('div#sign_in_up_form_email_div').fill_in('Email', with: @user_1.email)
    # May need to pass password string: 'foobar'
    find('div#sign_in_up_form_password_div').fill_in('Password', with: @user_1.password)
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end
