require 'spec_helper'

describe Car do

  describe 'validations' do

    it { should have_valid(:color).when('red') }
    it { should_not have_valid(:color).when('', nil, "8091284-0238")}

    it { should have_valid(:year).when(1980, 2000) }
    it { should_not have_valid(:year).when('', nil, "8091284-0238", "blue", 1950, 007, 21111111)}

    it { should have_valid(:mileage).when(3249058034985, 2000) }
    it { should_not have_valid(:mileage).when('', nil, "8091284-0238", "fire")}

  end

  describe 'associations' do

    it { should belong_to :manufacturer }

    it 'allows car salesman to optionally specify car manufacturer' do
      car = Car.create!(color: 'red', year: 1999, mileage: 38342)
      expect(car).to be_valid
      expect(car.errors).to be_blank
      car2 = Car.create!(color: 'red', year: 1999, mileage: 38342, manufacturer: FactoryGirl.create(:manufacturer))
      expect(car2).to be_valid
      expect(car2.errors).to be_blank
      expect(car2.manufacturer.name).to eq('Toyota')
    end

  end

end
