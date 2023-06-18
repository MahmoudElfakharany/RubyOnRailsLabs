class Student < ApplicationRecord
  belongs_to :track
  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :track_id, presence: true
  validate :valid_track

  private

  def valid_track
    errors.add(:track, "must be valid track") unless track && track.persisted?
  end

end