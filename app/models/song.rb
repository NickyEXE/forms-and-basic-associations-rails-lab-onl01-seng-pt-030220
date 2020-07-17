class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    artist && artist.name
  end

  def song_notes=(contents)
    contents.each do |note|
      unless note == ""
        self.notes.build(content: note)
      end
    end
  end

end
