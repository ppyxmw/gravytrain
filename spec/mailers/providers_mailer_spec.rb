require 'rails_helper'

RSpec.describe ProvidersMailer do
  describe '.register' do
    let(:provider) { Provider.new(name: 'Dave', paypal_email: 'ben@ben.com') }

    subject { ProvidersMailer.register(provider).deliver_now }

    # subject in this case is the same as let, but we can also thing of it as a viriable that equals the thing in brackets. it could have been email = ProvidersMailer.register(provider).deliver_now  and we could have replaced subject with email in the tests

    it 'is sent to the provider' do
      expect(subject.to.first).to eq(provider.paypal_email)
    end

    it 'has a subject' do
      expect(subject.subject).to eq('Thanks for registering')
    end

    it 'is addressed to the provider' do
      expect(subject.body.parts.first.decoded).to include(provider.name)
      # the parts part is to do this SMTP emails. the first part is the plain text the second is the html, so we need to specify. as web evolved and html came about and people had browesers. So it is a backwards compatibilty thing that when emails are sent u will have the plain text and the html version hence two parts.
    end

    it 'has a confirmation link' do
      expect(subject.body.parts.first.decoded).to include('Please click here to confirm your account.')
    end






  end
end
