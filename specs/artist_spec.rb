require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/artist')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ArtistTest < MiniTest::Test

  def test_create_artist_with_name()
    artist1 = {'name' => 'Prince'}
    assert_equal('Prince', Artist.new(artist1).name)
  end



end
