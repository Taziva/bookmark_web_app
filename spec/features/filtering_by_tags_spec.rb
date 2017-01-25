require 'spec_helper'

feature 'User Story 4: filtering by tags' do
  scenario 'I can filter my links by their tag' do
    visit ('/links')

    click_link ('Add link')

    fill_in(:title, with: 'BBC')
    fill_in(:url, with: 'www.bbc.co.uk')
    fill_in(:tags, with: 'News')

    click_button ('Submit')

    click_link ('Add link')

    fill_in(:title, with: 'Twitter')
    fill_in(:url, with: 'www.twitter.com')
    fill_in(:tags, with: 'Social Media')

    click_button ('Submit')

    click_button ('News')

    visit ('/tags/news')

    expect(page).not_to have_content('Twitter')
    expect(page).to have_content('BBC')
  end
end
