feature 'Signing in' do
  scenario 'user signup' do
    visit('/user/new')
    fill_in(:email, with: 'a@gmail.com')
    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1234')
    expect{click_button('Submit')}.to change{User.count}.by(1)
    expect(current_path).to eq "/links"
    expect(page).to have_content("Welcome a@gmail.com")
    visit('/user/new')
    fill_in(:email, with: 'a@gmail.com')
    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1234')
    expect{click_button('Submit')}.not_to change{User.count}
    expect(page).to have_content 'Email is already taken'
  end
end
