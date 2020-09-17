class Song
    attr_reader :artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist=(artist)
        artist.songs << self
        @artist = artist
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        parsed = filename.split(" - ")
        artist, name = parsed[0], parsed[1]
        song = self.new(name)
        song.artist_name = artist
        song
    end

    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        self.artist = artist
    end

end