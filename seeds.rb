require('pry')
require_relative('models/artist.rb')

Artist.delete_all()

artist1 = Artist.new({'name' => 'Prince'})
artist2 = Artist.new({'name' => 'Foo Fighters'})

artist1.save()
artist2.save()

binding.pry

nil
