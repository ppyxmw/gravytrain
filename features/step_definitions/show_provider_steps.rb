Given(/^a Provider registers$/) do
  @provider = Provider.create!(name: 'jojo',
    address: '5 Yolo lane',
    postcode: 'mk44 3nu',
    about_me: 'Nasty',
    paypal_email: 'big@daddy.com'
    )
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

When(/^I follow the link within my confirmation email$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^my account is confirmed$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am directed to my profile$/) do
  pending # express the regexp above with the code you wish you had
end
