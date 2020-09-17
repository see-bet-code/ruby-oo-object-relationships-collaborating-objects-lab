class MP3Importer
    attr_accessor :path, :files

    def initialize(path)
        @path = path
        @files = []
    end

    def files
        @files = Dir.entries(@path).select do |f|
            File.file? File.join(@path, f)
        end
    end

    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end
end