class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_select(song)
    if song.artist.nil?
      select_tag "post[author_id]",
      options_from_collection_for_select(Artist.all, :id, :name)
    else
      hidden_field_tag "post[author_id]"
    end
  end    
end
