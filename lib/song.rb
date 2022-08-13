class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "")
    @name = name
  end
  def name
    @name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def name_the_song(song_name)
    @all << self
    self
  end
  def self.new_by_name(song_name)
    song = self.new(song_name)
  end

  def self.create_by_name(song_name)
    song = self.new(song_name)
    @@all << song
    song
  end

  def self.find_by_name(song)
    returned_song = @@all.find {|element| element.name == song}
    (returned_song != nil) ? returned_song : nil
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song)
    song_found = self.find_by_name(song)
    (song_found != nil) ? song_found : self.create_by_name(song)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(song_with_format)
    artist_and_song = song_with_format.split(" - ")
    song = artist_and_song.last.split(".")[0]
    song_obj = self.new_by_name(song)
    song_obj.artist_name = artist_and_song[0]
    song_obj
  end

  def self.create_from_filename(song_with_format)
    artist_and_song = song_with_format.split(" - ")
    song = artist_and_song.last.split(".")[0]
    song_obj = self.create_by_name(song)
    song_obj.artist_name = artist_and_song[0]
    song_obj
  end

  def self.destroy_all()
    @@all = []
  end
end

song = Song.create_from_filename("Thundercat - For Love I Come.mp3")

print song

