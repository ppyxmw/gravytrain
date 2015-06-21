class Provider < ActiveRecord::Base
  after_create :generate_token
  validates_acceptance_of :accepted_terms
  validates_presence_of :name, :address, :postcode, :about_me
  validates :paypal_email,
    uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  def generate_token
    self.token = SecureRandom.base64
    self.save!
  end
end

