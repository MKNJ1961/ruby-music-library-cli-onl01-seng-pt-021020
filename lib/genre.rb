# class Genre
#
#   attr_accessor :name
#   attr_reader :songs
#
#   @@all = []
#
#   def initialize(name)
#     @name = name
#     @songs = []
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
#   def self.create(name )
#     genre = new(name)
#     genre.save
#     genre
#   end
#
#   def artists
#     songs.map(&:artist).uniq
#   end
#
# end
#
#
class Genre
  # extend Concerns::Findable
  # include Concerns::Savable

  @@all = []

  def self.all
    @@all
  end
  attr_accessor :songs, :name

  def initialize(name)
    super(name)
    self.save unless Genre.all.map{|g| g.name}.include?(name)
    @songs = []
  end

  def artists
    self.songs.map{|song| song.artist }.uniq
  end

end




































































































# class Genre
#   attr_accessor :name, :songs
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
#   def self.create(genre)
#      self.new(genre)
#    end
#
#    def artists
#      songs.map(&:artist).uniq
#    end
#
# end
