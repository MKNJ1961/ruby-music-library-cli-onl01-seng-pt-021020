class MusicLibraryController


  def initialize(path='./db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(@path).tap do |importer|
      importer.import
    end
  end


end
