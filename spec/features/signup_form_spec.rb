require 'spec_helper'

feature 'Signing in' do
  scenario 'user signup' do
    visit('/user/new')
    fill_in(:email, with: 'a@gmail.com')
    fill_in(:password, with: '1234')
    expect{click_button('Submit')}.to change{User.count}.by(1)
    expect(current_path).to eq "/links"
    expect(page).to have_content("Welcome a@gmail.com")
  end
end
