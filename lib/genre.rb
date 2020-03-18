class Genre

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @song = []
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

  def self.create(name )
    genre = new(name)
    genre.save
    genre
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
