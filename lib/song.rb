class Song
  extend Concerns::Findable
  include Concerns::Savable

  @@all = []

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    name = data[1]
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2].gsub(".mp3",""))
    Song.new(name,artist,genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    self.artist.add_genre(genre) unless self.artist.nil?
    genre.songs.push(self) unless genre.songs.include?(self)
  end

end
# require'pry'
# class Song
#
#   attr_accessor :name
#   attr_reader :artist, :genre
#
#
#   @@all = []
#
#   def initialize(name, artist=nil, genre = nil)
#     @name = name
#     self.artist = artist if artist
#     self.genre = genre if genre
#   end
#
#   def artist=(artist)
#     @artist = artist
#     artist.add_song(self)
#   end
#
#   def genre=(genre)
#     @genre = genre
#     genre.songs.push self unless genre.songs.include? self
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.destroy_all
#     all.clear
#   end
#
#   def save
#     self.class.all << self
#   end
#
#   def self.find_by_name(name)
#     all.find(&:name)
#   end
#
#   def self.create(name)
#     song = new(name)
#     song.save
#     song
#   end
#
# end





















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
