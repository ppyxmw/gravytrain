Given(/^a registered provider with events$/) do

  expect(Provider.first.events).not_to eq(0)
end

When(/^I view the provider's events$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a list of events offered by the provider$/) do
  pending # express the regexp above with the code you wish you had
end
