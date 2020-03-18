require'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir./spec/fixtures/mp3s
  end

end
