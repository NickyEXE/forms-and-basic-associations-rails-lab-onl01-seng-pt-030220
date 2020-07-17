class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist && artist.name
  end

  def song_notes=(notes)
    notes.each do |note|
      unless note === ""
        self.notes.build(content: note)
      end
    end
  end

end
