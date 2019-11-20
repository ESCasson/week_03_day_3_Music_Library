require_relative('../db/sql_runner')
require_relative('artist')

class Album
attr_reader :id, :artist_id
attr_accessor :title, :genre

def initialize(details)
  @id = details['id'].to_i() if details['id']
  @title = details['title']
  @genre = details['genre']
  @artist_id = details['artist_id'].to_i()
end

def save()
  sql = "INSERT INTO album_list (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id;"
  values = [@title, @genre, @artist_id]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i()
end

def self.delete_all()
  sql = "DELETE FROM album_list"
  SqlRunner.run(sql)
end

def self.list_all()
  sql = "SELECT * FROM album_list"
  result = SqlRunner.run(sql)
  return result.map{|album| Album.new(album)}
end

def get_artist()
  sql = "SELECT * FROM artist_list WHERE id = $1"
  values = [@artist_id]
  result = SqlRunner.run(sql, values)
  return Artist.new(result[0])
end

def edit(new_title, new_genre)
  sql = "UPDATE album_list SET
  (title, genre) = ($1, $2)
  WHERE id = $3"
  values = [new_title, new_genre, @id]
  SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM  album_list WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.find_album_by_id(id)
  sql = "SELECT * FROM album_list WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values)
  return Album.new(result[0])
end

def self.delete_by_artist_id(id)
  sql = "DELETE FROM album_list WHERE artist_id = $1"
  values = [id]
  SqlRunner.run(sql, values)
end



end
