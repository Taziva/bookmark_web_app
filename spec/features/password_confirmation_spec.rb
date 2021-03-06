require 'spec_helper'

feature 'Password confirmation' do
  scenario 'Stops incorrect user made' do
        visit '/'
        fill_in(:email, with: 'a@gmail.com')
        fill_in(:password, with: '1234')
        fill_in(:password_confirmation, with: '1235')
        expect{click_button('Submit')}.to change{User.count}.by(0)
        expect(current_path).to eq ('/user')
        expect(page).to have_content('Password does not match the confirmation')
    end

end
