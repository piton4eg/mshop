class Post < ActiveRecord::Base
  include Images

  validates :title, :value, presence: true

  scope :latest, -> { order("created_at DESC") }
end
