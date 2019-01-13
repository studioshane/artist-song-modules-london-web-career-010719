require 'pry'

class Artist

  extend Memorable::ClassMethods


  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    @@artists << self
    @songs = [] #artist has many songd
  end

  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def self.all
    @@artists
  end

  # def self.reset_all
  #   self.all.clear
  # end
  # 
  # def self.count
  #   self.all.count
  # end

  def add_song(song)
    @songs << song
    song.artist = self #calls aritst instance method on this instance of song, adds this instance of artist to song
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-') #"Taylor Swift" => "taylor-swift"
  end
end
