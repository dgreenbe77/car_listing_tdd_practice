require 'spec_helper'

feature 'add manufacturer record', %q{
As a car salesperson
I want to record a car manufacturer
So that I can keep track of the types of cars found in the lot } do
# AC: I must specify a manufacturer name and country.
# If I do not specify the required information, I am presented with errors.
# If I specify the required information, the manufacturer is recorded and I am redirected to enter another new manufacturer.

  before(:each) do
    visit '/manufacturers'
  end

  context 'filling out manufacturer information' do

    it 'requires name, country' do
      fill_in 'Name', with: ''
      fill_in 'Country', with: ''
      click_on 'submit'
      expect(page).to have_content('Invalid Information')
      expect(current_path).to eq manufacturers_path
    end

    it 'redirects me to the front page when I enter valid information so I can record another car' do
      fill_in 'Name', with: 'Daniel'
      fill_in 'Country', with: 'Arzbekistan'
      click_on 'submit'
      expect(page).to have_content('Manufacturer Information Created')
      expect(current_path).to eq manufacturers_path
    end

    it 'only allows for valid formats for Name and Country' do
      fill_in 'Name', with: ''
      fill_in 'Country', with: ''
      click_on 'submit'
      expect(page).to have_content('Invalid Information')
      expect(current_path).to eq manufacturers_path
    end

  end

end
