Given(/^no Providers exist$/) do
<<<<<<< HEAD
<<<<<<< HEAD
  expect(Provider.count).to eq(0)
=======
 Provider.delete_all
>>>>>>> uses cucumber to do and pass tests
=======
 expect(Provider.count).to eq(0)
>>>>>>> uses cucumber to do and pass tests and show screen
end

When(/^I am on the registration page$/) do
  visit new_provider_path
end

When(/^I complete the required fields$/) do
  fill_in 'Name', with: 'Dave'
<<<<<<< HEAD
  fill_in 'Address', with: '10 Pie Lane'
  fill_in 'Postcode', with: 'RG2 9FL'
=======
  fill_in 'Address', with: '10 pie lane'
  fill_in 'Postcode', with: 'RG2  9FL'
>>>>>>> uses cucumber to do and pass tests
  fill_in 'About me', with: 'I am the best!'
  fill_in 'Paypal email', with: 'ben@ben.com'
  check 'Accepted terms'

  save_and_open_page
end

When(/^I submit my information$/) do
  click_button 'Create Provider'
end

Then(/^my Provider account is created$/) do
  expect(Provider.count).to eq(1)
end

Then(/^I see a confirmation message$/) do
  expect(page).to have_content('Done!')
end
