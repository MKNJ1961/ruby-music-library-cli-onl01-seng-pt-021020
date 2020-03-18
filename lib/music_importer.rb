require'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files=Dir.glob(self.path+"/*.mp3")
    @files.collect {|file| File.basename(file)}
  end

end
