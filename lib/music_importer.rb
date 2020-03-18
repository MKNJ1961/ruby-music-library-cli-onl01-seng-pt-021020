require'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    ruby-music-library-cli-onl01-seng-pt-021020\spec\fixtures
  end

end
