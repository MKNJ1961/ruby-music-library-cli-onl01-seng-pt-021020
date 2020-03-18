class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre


  @@all = []

  def initialize(name, artist=nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end


  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    parms = filename.split(" - ")
    artist = Artist.find_or_create_by_name(parms[0])
    song = self.new(parms[1])
    songGenre=parms[2].slice(0..parms[2].length-5)
    genre = Genre.find_or_create_by_name(songGenre)
    song.artist=artist
    song.genre=genre
    song
  end

  def self.create_from_filename(filename)
    song=self.new_from_filename(filename)
    song.save
    song
  end

end





















# class Song
#
#   attr_accessor :name, :genre
#
#   @@all = []
#
#   def initialize(name, artist = nil, genre = nil)
#     @name = name
#     if artist != nil
#       self.artist = artist
#     end
#     if genre != nil
#       self.genre = genre
#     end
#     save
#   end
#
#   def artist
#     @artist
#   end
#
#   def artist=(artist)
#     @artist = artist
#     artist.add_song(self)
#   end
#
#   def genre
#     @genre
#   end
#
#   def genre=(genre)
#     @genre = genre
#     genre.songs.push self unless genre.songs.include? self
#   end
#
#
#
#   def self.all
#     @@all
#   end
#
#   def self.destroy_all
#     @@all = []
#   end
#
#   def save
#     @@all << self
#   end
#
#   def self.find_by_name(name)
#       @@all.find(name)
#   end
#
#
#   def self.create(name)
#      self.new(name)
#   end
# end
