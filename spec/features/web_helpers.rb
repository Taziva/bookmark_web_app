def sign_in
  visit('/user/new')
  fill_in(:email, with: 'a@gmail.com')
  fill_in(:password, with: '1234')
  click_button('Submit')
end
