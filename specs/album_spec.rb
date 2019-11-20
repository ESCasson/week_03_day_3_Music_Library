require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/album')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class AlbumTest < MiniTest::Test

  def test_create_album_with_title()
    album1 = {
      'title' => 'Purple Rain',
      'genre' => 'Pop',
      'artist_id' => 1
    }
    assert_equal('Purple Rain', Album.new(album1).title)
  end

end
