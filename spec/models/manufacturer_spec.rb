require 'spec_helper'

describe Manufacturer do
  
  describe 'validations' do

    it { should have_valid(:name).when('Daniel') }
    it { should_not have_valid(:name).when(nil, 342434, '45302983459083', '') }

    it { should have_valid(:country).when('Blurgerstan') }
    it { should_not have_valid(:name).when(nil, 342434, '45302983459083', '') }

  end

  describe 'associations' do

    it { should have_many(:cars).dependent(:nullify) }

  end

end
