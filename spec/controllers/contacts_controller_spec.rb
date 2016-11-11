require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

	describe "POST #create JSON" do
		it "responds successfully with an HTTP 200 status code" do
	      json = { :format => 'json', :contact => { :email => "test@hotmail.com", :user => "fgt3y457", :message => "Hello World!" } }
	      post :create, json
	      Contact.count.should == 1
	      expect(response).to be_success
	      expect(response).to have_http_status(201)
	    end

	    it "fails with an HTTP 501 status code" do
	      json = { :format => 'json', :contact => {:email => "test@hotmail.com", :user => "fgt3y457"} }
	      post :create, json
	      expect(response).to have_http_status(422)
	    end
	end

	describe "GET #index" do
	    it "responds successfully with an HTTP 200 status code" do
	      get :index
	      expect(response).to be_success
	      expect(response).to have_http_status(200)
	    end

	    it "renders the index template" do
	      get :index
	      expect(response).to render_template("index")
	    end
	end

	describe "GET #show" do

	    it "responds successfully with an HTTP 200 status code" do
	      Contact.create(email: "test2@hotmail.com", user: "fgt3y457", message: "Hello World!")
	      get :show, id: Contact.first.id
	      expect(response).to be_success
	      expect(response).to have_http_status(200)
	    end

	end


end
