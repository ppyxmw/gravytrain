Given(/^no Providers exist$/) do
  expect(Provider.count).to eq(0)
end

When(/^I am on the registration page$/) do
  visit new_provider_path
end

When(/^I complete the required fields$/) do
  fill_in 'Name', with: 'Dave'
  fill_in 'Address', with: '10 Pie Lane'
  fill_in 'Postcode', with: 'RG2 9FL'
  fill_in 'About me', with: 'I am the best!'
  fill_in 'Paypal email', with: 'ben@ben.com'
  check 'Accepted terms'
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