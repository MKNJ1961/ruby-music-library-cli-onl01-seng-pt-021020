class Song

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
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

  def self.create(name)
    song = new(name)
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
