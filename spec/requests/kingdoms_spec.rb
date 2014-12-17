require 'rails_helper'

RSpec.describe "Kingdoms", :type => :request do
	let(:kingdom) { kingdom = create :kingdom }
	it "add and deletes kingdom" do
		get kingdoms_path
		expect(response).to have_http_status(200)
		expect(response).to render_template('kingdoms/index')
    	expect(assigns(:kingdoms).count).to eq(0)

	    get new_kingdom_path
	    expect(response).to have_http_status(200)

	    post kingdoms_path, :kingdom => { name: 'Animal' }
	    kingdom = assigns(:kingdom)
	    expect(response).to redirect_to(kingdom)
	    follow_redirect!
	    expect(response).to render_template('kingdoms/show')

	    get kingdoms_path
	    expect(response).to have_http_status(200)
	    expect(response).to render_template('kingdoms/index')
	    expect(assigns(:kingdoms).count).to eq(1)

    	delete kingdom_path(kingdom)
	    expect(response).to redirect_to(kingdoms_path)
	    follow_redirect!
	    expect(response).to render_template('kingdoms/index')
	end
end
