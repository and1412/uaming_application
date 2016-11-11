require 'rails_helper'

RSpec.describe EventsController, type: :controller do

	describe "POST #create" do
		it "responds successfully with an HTTP 200 status code" do
	      json = { :format => 'json', :event => { :event_date => "2016-11-11T00:54:22", :user => "fgt3y457", :resource => "pages/home" } }
	      post :create, json
	      Event.count.should == 1
	      expect(response).to be_success
	      expect(response).to have_http_status(201)
	    end

	    it "fails with an HTTP 501 status code" do
	      json = { :format => 'json', :event => {:user => "fgt3y457", :resource => "pages/home" } }
	      post :create, json
	      expect(response).to have_http_status(422)
	    end
	end

end
