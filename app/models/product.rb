class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, :description, :price, presence: true
  validates :name, length: { minimum: 4 }, uniqueness: { case_sensitive: false }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  # validates :image_url, allow_blank: true, format: {
  #   with: %r{\.(gif|jpg|png)\z}i,
  #   message: 'должно иметь один из форматов: GIF, JPG, PNG'
  # }

  private
  def ensure_not_referenced_by_any_line_item
     if line_items.empty?
       return true
     else
       errors.add(:base, t('errors.product.line_items_present'))
     end
  end
end
