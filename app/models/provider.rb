class Provider < ActiveRecord::Base
  validates_acceptance_of :accepted_terms
  validates_presence_of :name, :address, :postcode, :about_me
  validates :paypal_email,
    uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end
