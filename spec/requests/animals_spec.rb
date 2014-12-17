require 'rails_helper'

RSpec.describe "Animals", :type => :request do
	it "creates new animal" do
		get animals_path
		expect(response).to have_http_status(200)
		expect(response).to render_template('animals/index')
    	expect(assigns(:animals).count).to eq(0)

	    get new_animal_path
	    expect(response).to have_http_status(200)

	    post animals_path, :animal => { common_name: 'Dog', subspecie: 'Canis lupus familiaris' }
	    animal = assigns(:animal)
	    expect(response).to redirect_to(animal)
	    follow_redirect!
	    expect(response).to render_template('animals/show')

	    get animals_path
	    expect(response).to have_http_status(200)
	    expect(response).to render_template('animals/index')
	    expect(assigns(:animals).count).to eq(1)
	end
end
