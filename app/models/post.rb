class Post < ActiveRecord::Base
  validates :title, :value, presence: true

  scope :latest, -> { order("created_at DESC") }

end
