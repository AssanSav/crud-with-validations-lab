class Song < ApplicationRecord
    validates :title, presence: true
    validates :release_year, inclusion: {in: 1..Time.current.year}, if: :released?
    validate :not_twice_in_the_same_year?

    def not_twice_in_the_same_year?
        if Song.any? {|a| a.title == title && a.artist_name == artist_name && a.release_year == release_year}
            errors.add(:release_year, "Forbidden to release the same song title twice within a year!")
        end
    end
end
