require 'rails_helper'

RSpec.feature 'Provider can register' do
  scenario 'A Provider account is created' do
    visit new_provider_path

    fill_in 'Name', with: 'Dave'
    fill_in 'Address', with: '10 Pie Lane'
    fill_in 'Postcode', with: 'RG2 9FL'
    fill_in 'About me', with: 'I am the best!'
    fill_in 'Paypal email', with: 'ben@ben.com'
    check 'Accepted terms'

    expect { click_button 'Create Provider' }.to change { Provider.count }.by(1)
  end

  scenario 'The Provider does not accept the terms' do
    visit new_provider_path

    uncheck 'Accepted terms'

    expect { click_button 'Create Provider' }.not_to change { Provider.count }
  end

  scenario 'Given a Provider registers they can view their registered details' do
    provider = Provider.create!(name: 'Dave',
      address: '10 Pie Lane',
      postcode: 'RG2 9FL',
      about_me: 'I am the best!',
      paypal_email: 'ben@ben.com'
    )

    visit provider_path(provider)

    expect(page).to have_content('Dave')
    expect(page).to have_content('10 Pie Lane')
    expect(page).to have_content('RG2 9FL')
    expect(page).to have_content('I am the best!')
    expect(page).to have_content('ben@ben.com')
  end
end
