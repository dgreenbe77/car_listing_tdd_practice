require 'spec_helper'

feature 'add car record', %q{
As a car salesperson
I want to record a newly acquired car
So that I can list it in my lot } do
# AC: I must specify the color, year, and mileage of the car.
# Only years from 1980 and above can be specified.
# I can optionally specify a description of the car.
# If I enter all of the required information in the required formats, the car is recorded.
# If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# Upon successfully creating a car, I am redirected so that I can create another car.

  before(:each) do
    visit '/'
  end

  context 'filling out car information' do

    it 'requires color, year, and mileage' do
      fill_in 'Color', with: ''
      fill_in 'Year', with: ''
      fill_in 'Mileage', with: ''
      click_on 'Create Car'
      expect(page).to have_content('Invalid Information')
      expect(current_path).to eq cars_path
    end

    it 'optionally will take in a description, and redirects me to the front page so I can record another car' do
      fill_in 'Color', with: 'Red'
      fill_in 'Year', with: 1999
      fill_in 'Mileage', with: 35809
      fill_in "Description", with: ''
      click_on 'Create Car'
      expect(page).to have_content('Car Information Created')
      expect(current_path).to eq cars_path
    end

    it 'only allows for cars from 1980 and above' do
      fill_in 'Color', with: 'Red'
      fill_in 'Year', with: 9999
      fill_in 'Mileage', with: 35809
      click_on 'Create Car'
      expect(page).to have_content('Invalid Information')
      expect(current_path).to eq cars_path
    end

  end

end
