require "rails_helper"

RSpec.describe Kingdom, :type => :model do
  it "requires name" do
  	kingdom = Kingdom.new
  	expect(kingdom.valid?).to eq(false)
  	kingdom = Kingdom.new(name: 'Animal')
  	expect(kingdom.valid?).to eq(true)
  end

  it "has animals" do
  	kingdom = Kingdom.new(name: 'Animal')
	animal = Animal.new(common_name: 'Dog', subspecie: 'Canis lupus familiaris')
	kingdom.animals << animal
	expect(kingdom.animals[0].common_name).to eq('Dog')
  end
end