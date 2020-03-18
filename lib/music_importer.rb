require'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{(path}/*").map{ |file| foile.gsub("#{path}/", '')})

  end

end
