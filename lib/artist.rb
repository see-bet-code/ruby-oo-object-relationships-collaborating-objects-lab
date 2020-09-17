class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def songs
        @songs
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_by_name(name)
        @@all.find {|artist| artist.name == name}
    end

    def self.find_or_create_by_name(name)
        artist = self.find_by_name(name)
        artist ? artist : Artist.new(name)
    end

    def print_songs
        @songs.each do |song|
            puts song.name
        end
    end
end