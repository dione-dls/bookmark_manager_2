feature 'View bookmarks' do
  scenario 'A user can see bookmarks' do
    con = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.add('http://makersacademy.com', 'Makers Academy')
    Bookmark.add('http://destroyallsoftware.com', 'Destroy All Software')
    Bookmark.add('http://google.com', 'Google')

    visit '/bookmarks'

    expect(page).to have_content 'http://makersacademy.com'
    expect(page).to have_content 'http://destroyallsoftware.com'
    expect(page).to have_content 'http://google.com'
  end
end
