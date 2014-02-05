class User < ActiveRecord::Base
  after_destroy :ensure_an_admin_remains

  validates :name, presence: true, uniqueness: true
  has_secure_password

  private

  def ensure_an_admin_remains
    raise(I18n.t('errors.last_user')) if User.count.zero?
  end
end
