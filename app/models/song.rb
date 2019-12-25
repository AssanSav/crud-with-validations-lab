class Song < ApplicationRecord
    validates :title, presence: true
    validates :release_year, inclusion: {in: 1..Time.current.year}, if: :released?
    validate :not_twice_in_the_same_year?

    def not_twice_in_the_same_year?
        if Song.all.any? {|song| song.title == self.title && song.artist_name == self.artist_name && song.release_year == self.release_year}
            errors.add(:release_year, "Forbidden to release the same song title twice within a year!")
        end
    end
end
