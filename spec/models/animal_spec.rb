require "rails_helper"

RSpec.describe Animal, :type => :model do
  it "requires common_name and subspecie" do
  	animal = Animal.new
  	expect(animal.valid?).to eq(false)
  	animal = Animal.new(common_name: 'Dog')
  	expect(animal.valid?).to eq(false)
  	animal = Animal.new(subspecie: 'Canis lupus familiaris')
  	expect(animal.valid?).to eq(false)
  	animal = Animal.new(common_name: 'Dog', subspecie: 'Canis lupus familiaris')
  	expect(animal.valid?).to eq(true)
  end

  it "belongs to kingdom" do
	kingdom = Kingdom.new(name: 'Animal')
	animal = Animal.new(common_name: 'Dog', subspecie: 'Canis lupus familiaris')
	animal.kingdom = kingdom
	expect(animal.kingdom.name).to eq('Animal')
  end
end