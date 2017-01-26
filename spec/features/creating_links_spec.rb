require 'spec_helper'

feature 'User Story 2: add a url with a name to the bookmark manager' do
  scenario 'I can save a website' do
    sign_in
    visit ('/links')

    click_link ('Add link')

    fill_in(:title, with: 'BBC')
    fill_in(:url, with: 'www.bbc.co.uk')

    click_button ('Submit')

    within 'ul#links' do
      expect(page).to have_content 'BBC'
    end

  end
end
