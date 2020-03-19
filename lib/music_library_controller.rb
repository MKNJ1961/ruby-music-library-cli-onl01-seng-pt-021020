class MusicLibraryController

  attr_accessor :path, :music_importer


  def initialize(path='./db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(@path).tap do |importer|
      importer.import
    end
  end

  def call

    puts "Welcome to your music library"
  end


end
