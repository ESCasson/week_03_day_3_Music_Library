require('pry')
require_relative('models/artist.rb')
require_relative('models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Prince'})
artist2 = Artist.new({'name' => 'Foo Fighters'})

artist1.save()
artist2.save()

album1 = Album.new({
  'title' => 'Purple Rain',
  'genre' => 'Pop',
  'artist_id' => artist1.id
})

album2 = Album.new({
  'title' => 'In Your Honour',
  'genre' => 'Awesome',
  'artist_id' => artist2.id
 })

 album3 = Album.new({
   'title' => 'Concert and Gold',
   'genre' => 'Awesome',
   'artist_id' => artist2.id
  })

album1.save()
album2.save()
album3.save()

binding.pry

nil
