require 'spec_helper'

feature 'User Story 1: see list of links' do
  scenario 'I can see existing links on the links' do

    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    sign_in
    visit ('/links')

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content 'Makers Academy'
    end
  end
end
