class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    artist = new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs.push song unless songs.include?(song)
  end

  def genres
    songs.map(&:genre).uniq
  end


end














































# class Artist
#   attr_accessor :name, :songs
#
#
#   @@all = []
#
#   def initialize(name)
#     @name = name
#     @songs = []
#     save
#   end
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
#   def self.create(artist)
#      self.new(artist)
#    end
#
#    def add_song(song)
#      if song.artist != self
#         song.artist = self
#      end
#
#      if !@songs.include?(song)
#         @songs << song
#      end
#    end
#
#    def genres
#      songs.map(&:genre).uniq
#    end
#
#
# end
