require 'bookmark'

describe Bookmark do

  let(:url) { "http://airbnb.com" }
  let(:id) { 1 }
  let(:title) {"Airbnb"}

  describe '#initialize' do
    it 'sets id, url, title' do
      bookmark = Bookmark.new(id, url, title)
      expect(bookmark.id).to eq id
      expect(bookmark.url).to eq url
      expect(bookmark.title).to eq title
    end
  end

  describe'.all' do
    it 'returns an instance of Bookmark' do
      Bookmark.add('http://makersacademy.com', 'Makers Academy')
      expect(Bookmark.all.first).to be_instance_of(Bookmark)
    end

    it 'should return an array' do
      Bookmark.add('http://google.com', 'Google')
      expect(Bookmark.all).to be_instance_of(Array)
    end
  end

  describe '.add' do
    it 'add a bookmark to the list' do
      new_bookmark = 'http://asos.com'
      Bookmark.add('http://asos.com','Asos')
      expect(Bookmark.all.last.url).to eq new_bookmark
    end
  end

  describe '.delete' do
    it 'deletes a bookmark from the list' do
      Bookmark.add('http://bbc.co.uk','BBC')
      Bookmark.add('http://asos.com','Asos')
      bookmark_to_delete = "http://asos.com"
      Bookmark.delete('Asos')
      expect(Bookmark.all.last.url).not_to eq bookmark_to_delete
    end
  end

end
