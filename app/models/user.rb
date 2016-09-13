class User < ActiveRecord::Base
  include Mail
  include Decktest

  has_many :decks

  attr_accessor :current_password
	before_save { self.email = email.downcase }
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: Decktest::VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validate :email_has_valid_domain

  def email_has_valid_domain
    domain = Address.new(email).domain.try(:downcase)
    tld = domain.try(:split, ".").try(:last).try(:upcase)
    errors.add(:email, "is not a valid email address") if TopLevelDomain.find_by_domain(tld).blank? || MisspelledDomain.find_by_domain(domain).present?
  end
end
