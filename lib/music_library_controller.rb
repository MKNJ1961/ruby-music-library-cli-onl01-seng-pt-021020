class MusicLibraryController

  attr_accessor :path, :music_importer


  def initialize(path='./db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(@path).tap do |importer|
      importer.import
    end
  end

  def call
    input = ''
    while input != 'exit'

      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip
      case input.downcase
   when "list songs"
     list_songs
   when "list artists"
     list_artists
   when "list genres"
     list_genres
   when "list artist"
     list_songs_by_artist
   when "list genre"
     list_songs_by_genre
   when "play song"
     play_song
   when "exit"
     return
   else
     call
   end
    end
  end

  def list_songs
    Song.all.sort_by(&:name).each.with_index(1) do |song, idx|
      puts "#{idx}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by(&:name).each.with_index(1) do |art, idx|
      puts "#{idx}. #{art.name}"
    end
  end

  def list_genres
    Genre.all.sort_by(&:name).each.with_index(1) do |gn, idx|
      puts "#{idx}. #{gn.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
      input = gets.strip
      if artist = Artist.find_by_name(input)
        artist.songs.sort_by(&:name).each.with_index(1) do |song, idx|
          puts "#{idx}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
      input = gets.strip
      if genre = Genre.find_by_name(input)
        genre.songs.sort_by(&:name).each.with_index(1) do |song, idx|
          puts "#{idx}. #{song.artist. name} - #{song.name}"
      end
    end
  end


  def play_song
    puts "Which song number would you like to play?"
    song_num = gets.strip.to_i
    return if song_num < 1 || song_num > Song.all.length
    song = Song.all.sort{|a,b| a.name <=> b.name}[song_num - 1]
    # binding.pry
    if !!song
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end
