class User < ApplicationRecord
# Here it looks like there are two callbacks, an in-line callback that runs
# Before the "before_save" callback.
  before_save { self.email.downcase if email.present? }
  before_save :capital_name
  validates :name, length: { minimum: 1, maximum: 100}, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }
has_secure_password

  def capital_name
    if name
      capitals = []
      name.split.each do |word|
        capitals << word.capitalize
      end
    self.name = capitals.join(" ")
    end
  end
# Adds methods to set and authenticate against a BCrypt password.
# A password_digest attribute has to be present with this mechanism.
# 2 attributes (virtual): password(set-up) and password_confirmation(save)
end
