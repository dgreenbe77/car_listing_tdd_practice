require 'spec_helper'

feature 'add car manufacturer', %q{
As a car salesperson
I want to record a car listing's manufacturer
So that I can keep track of its manufacturer } do
# AC: When recording a car listing, I want to optionally associate it with its manufacturer.
# If I delete a manufacturer, the manufacturer and its primary key should no longer be associated with any car listings.

  before(:each) do
    FactoryGirl.create(:manufacturer)
    visit '/'
  end

  context 'choosing association' do

    it 'allows you to pick a manufacturer association' do
      fill_in 'Color', with: 'Red'
      fill_in 'Year', with: 1999
      fill_in 'Mileage', with: 35809
      select('Toyota', from: 'Manufacturer')
      click_on 'Create Car'
      expect(page).to have_content('Car Information Created')
      expect(current_path).to eq cars_path
    end

  end

end
