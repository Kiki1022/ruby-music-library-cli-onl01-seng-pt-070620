require 'pry'

class Song 
  
  attr_accessor :name
  
  attr_reader :artist, :genre
   
    @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
    save
  end
  
  def artist
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre
    genre.songs.push self unless genre.songs.include? self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(song)
    song = new(name) 
    #song.save 
    song
  end
  
  def self.find_by_name(name)
   # binding.pry
     all.find {|s| s.name==name}
  end 
  
end