class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name, artist_name)
  #   @name = name

  #   @@all << self
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  def self.create
    song = Song.new
    song.save
    song
  end
  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end
  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end
  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name) 
  end
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  def self.new_from_filename(filename)
    #create a new song
    #need a song name
    #need artist name
    song_name = filename.split(" - ")[1]
    song_name = song_name.split(".")[0]
    artist_name = filename.split(" - ")[0]
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end
  def self.create_from_filename(filename)
    song_name = filename.split(" - ")[1]
    song_name = song_name.split(".")[0]
    artist_name = filename.split(" - ")[0]
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end






  

end
