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
  expect(page).to have_content('has been saved')
end

When(/^I have not accepted the T&Cs$/) do
  uncheck 'Accepted terms'
end

Then(/^A Provider account is not created$/) do
  expect(Provider.count).to eq(0)
end

Then(/^I see an error message$/) do
  expect(page).to have_content('Accepted terms must be accepted')
end

Given(/^a Provider exists$/) do
  @provider = Provider.create!(name: 'jojo', address: '5 Yolo lane', postcode: 'mk44 3nu', about_me: 'Nasty', paypal_email: 'big@daddy.com')

end

When(/^I view the Provider$/) do
  visit provider_path(@provider)
end

Then(/^I see their details$/) do
  expect(page).to have_content('jojo')
  expect(page).to have_content('5 Yolo lane')
  expect(page).to have_content('mk44 3nu')
  expect(page).to have_content('Nasty')
  expect(page).to have_content('big@daddy.com')
end
