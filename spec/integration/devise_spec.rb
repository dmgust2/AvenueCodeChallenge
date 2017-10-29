require 'rails_helper'

# rspec spec/integration/devise_spec.rb


describe 'The authentication process', :type => :feature do
  before :each do
    # Seed a user
    @user_1 = FactoryGirl.create(:user_1)
  end

  it 'signs me in' do
    # Route: GET /users/sign_in -> devise/sessions#new
    visit '/users/sign_in'

    # Find the email and password fields and fill-in
    find('#sign_in_up_form_email_div').fill_in('user_email', with: @user_1.email)
    find('#sign_in_up_form_password_div').fill_in('user_password', with: @user_1.password)
    click_button 'Sign in'

    # Verify you redirect to the index page with the expected notice message
    expect(page).to have_content('Signed in successfully')
  end

  it 'signs me up' do
    # Route: GET /users/sign_up -> devise/registrations#new
    visit '/users/sign_up'

    # Find the email and password fields and fill-in
    find('#sign_in_up_form_email_div').fill_in('user_email', with: 'user2@example123.com')
    find('#sign_in_up_form_password_div').fill_in('user_password', with: 'foobar3')
    find('#sign_in_up_form_password_conf_div').fill_in('user_password_confirmation', with: 'foobar3')
    click_button 'Sign up'

    # Verify you redirect to the index page with the expected notice message
    expect(page).to have_content('You have signed up successfully')
  end
end