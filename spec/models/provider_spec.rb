require 'rails_helper'

RSpec.describe Provider do
  describe 'validation' do
    let(:provider) do
      provider = Provider.new(
        name: 'Ben',
        address: '10',
        postcode: 'RM1',
        about_me: 'Stuff',
        paypal_email: 'me@me.com',
        accepted_terms: '1'
      )
    end

    it 'is valid with valid attributes' do
      expect(provider).to be_valid
    end

    it 'expects the terms to be accepted' do
      provider.accepted_terms = '0'

      expect(provider).to_not be_valid
    end

    it 'expects the presence of name' do
      provider.name = ''

      expect(provider).to_not be_valid
    end

    it 'expects the presence of address' do
      provider.address = ''

      expect(provider).to_not be_valid
    end

    it 'expects the presence of postcode' do
      provider.postcode = ''

      expect(provider).to_not be_valid
    end

    it 'expects the presence of about_me' do
      provider.about_me = ''

      expect(provider).to_not be_valid
    end

    it 'expects the uniqueness of email' do
      provider2 = Provider.create!(name: 'Dave',
      address: '10 Pie Lane',
      postcode: 'RG2 9FL',
      about_me: 'I am the best!',
      paypal_email: 'me@me.com'
    )

      expect(provider).to_not be_valid
    end

    it 'expects the correct format of email' do
      provider.paypal_email = 'yoloyoyoyoy.com'

      expect(provider).to_not be_valid
    end

  end
end
