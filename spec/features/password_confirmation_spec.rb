require 'spec_helper'

feature 'Password confirmation' do
  scenario 'user signup' do
    visit('/user/new')
    fill_in(:email, with: 'a@gmail.com')
    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1235')
    expect{click_button('Submit')}.to change{User.count}.by(0)
    visit('/user/new')
  end
end
