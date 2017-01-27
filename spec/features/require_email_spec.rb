feature 'Email Validation' do
  scenario 'User signing up without email' do
    visit('/user/new')

    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1234')
    expect{click_button('Submit')}.to change{User.count}.by(0)
    expect(current_path).to eq "/user"

  end
  scenario "I can't sign up with an invalid email address" do
    visit('/user/new')
    fill_in :email, with: "invalid@email"
    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1234')
    expect{click_button('Submit')}.not_to change{User.count}
  end
end
