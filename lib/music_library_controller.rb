class MusicLibraryController
  attr_accessor :path, :music_importer

  def initialize(path='./db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(@path).tap do |importer|
      importer.import
    end
  end

  def list_songs
    index=0
    Artist.all.each do |artist|
      artist.songs.each do |song|
        index+=1
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    puts "Enter the index of the song you would like to play =>"
    input = gets.strip

    if song_index = input.to_i
      song = Song.all[song_index-1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artist
    puts "Enter the artist's name =>"
    input = gets.strip
    songs = Song.all.select {|song| song.artist.name == input }
    songs.each {|song| puts"#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre
    puts "Enter the genre =>"
    input = gets.strip
    songs = Song.all.select {|song| song.genre.name == input }
    songs.each {|song| puts"#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def call
    while true
      puts "Music Library Controller >>"
      command = gets.strip
      case command
      when "exit"
        break;
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      else
        puts "Unknown command.  Please try again, or 'exit' to quit."
      end
    end
  end
end



# class MusicLibraryController
#
#   attr_accessor :path, :music_importer
#
#
#   def initialize(path='./db/mp3s')
#     @path = path
#     @music_importer = MusicImporter.new(@path).tap do |importer|
#       importer.import
#     end
#   end
#
#   def call
#     input = ''
#     while input != 'exit'
#
#       puts "Welcome to your music library!"
#       puts "To list all of your songs, enter 'list songs'."
#       puts "To list all of the artists in your library, enter 'list artists'."
#       puts "To list all of the genres in your library, enter 'list genres'."
#       puts "To list all of the songs by a particular artist, enter 'list artist'."
#       puts "To list all of the songs of a particular genre, enter 'list genre'."
#       puts "To play a song, enter 'play song'."
#       puts "To quit, type 'exit'."
#       puts "What would you like to do?"
#
#       input = gets.strip
#     end
#   end
#
#   def list_songs
#     Song.all.sort_by(&:name).each.with_index(1) do |song, idx|
#       puts "#{idx}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
#     end
#   end
#
#   def list_artists
#     Artist.all.sort_by(&:name).each.with_index(1) do |art, idx|
#       puts "#{idx}. #{art.name}"
#     end
#   end
#
#   def list_genres
#     Genre.all.sort_by(&:name).each.with_index(1) do |gn, idx|
#       puts "#{idx}. #{gn.name}"
#     end
#   end
#
#   def list_songs_by_artist
#     puts "Please enter the name of an artist:"
#       input = gets.strip
#       if artist = Artist.find_by_name(input)
#         artist.songs.sort_by(&:name).each.with_index(1) do |song, idx|
#           puts "#{idx}. #{song.name} - #{song.genre.name}"
#       end
#     end
#   end
#
#   def list_songs_by_genre
#     puts "Please enter the name of a genre:"
#       input = gets.strip
#       if genre = Genre.find_by_name(input)
#         genre.songs.sort_by(&:name).each.with_index(1) do |song, idx|
#           puts "#{idx}. #{song.artist. name} - #{song.name}"
#       end
#     end
#   end
#
#   def play_song
#     puts "Which song number would you like to play?"
#     input = gets.strip
#
#     if song_index = input.to_i
#       song = Song.all[song_index -1]
#       puts "Playing #{song.name} by #{song.artist.name}"
#     end
#   end
# end
