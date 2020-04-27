require 'rails_helper'

RSpec.describe 'Creating a city', type: :feature do
  scenario 'Log in as a saved user' do
    User.create(name: 'Foobar')
    visit login_path
    have_link 'Log in', href: login_path
    have_link 'Sign up now', href: signup_path
    page.fill_in 'Name', with: 'Foobar'
    click_button 'Log in'
    expect(page.current_path).to eq '/users/1'
    have_link 'ALL EVENTS', href: events_path
    have_link('Log out', :href => '/logout')
  end
end
