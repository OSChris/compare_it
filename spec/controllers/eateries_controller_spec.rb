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
    # end

  end

  describe "get #show" do 

    let(:eatery) { create(:eatery) }

    it "responds successfully with a 200 status code" do 
      get :show, id: eatery.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns the eatery instance variable with a passed id" do 
      get :show, id: eatery.id
      expect(assigns(:eatery)).to eq(eatery)
    end

    it "renders the show template" do 
      get :show, id: eatery.id
      expect(response).to render_template(:show)
    end

    it "raises an error when trying to access an eatery that doesn't exist" do 
      expect{get :show, id: (eatery.id + 1)}.to raise_error
    end

  end

end
