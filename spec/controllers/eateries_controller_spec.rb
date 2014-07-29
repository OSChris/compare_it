require 'rails_helper'

RSpec.describe EateriesController, :type => :controller do

  describe "get #index" do 

    let(:eatery)  { create(:eatery) }
    let(:eatery1) { create(:eatery) }

    it "responds successfully with a 200 status code" do 
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do 
      get :index
      expect(response).to render_template(:index)
    end

    # it "loads all of the eateries into @eateries" do 
    #   eatery
    #   Eatery.search "#{eatery.name}"
    #   Eatery.searchkick_index.refresh
    #   get :index
    #   expect(assigns(:eateries).results).to include(eatery)
    #   # expect(assigns(:eateries).results).to include(eatery)
    #   # expect(assigns(:eateries).results).to include(eatery1)
    end

  end

end
