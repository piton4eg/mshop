module Images
  extend ActiveSupport::Concern

  included do
    has_many :images, as: :owner

    accepts_nested_attributes_for :images, allow_destroy: true
  end
end
