feature 'User Story 3: tagging links' do
  scenario 'I can add a tag when entering a new link' do
    visit ('/links')

    click_link ('Add link')

    fill_in(:title, with: 'BBC')
    fill_in(:url, with: 'www.bbc.co.uk')
    fill_in(:tags, with: 'News, Politics')

    click_button ('Submit')

    within 'ul#links' do
      link = Link.first
      expect(link.tags.map(&:name)).to include('news', 'politics')
    end
  end
end
