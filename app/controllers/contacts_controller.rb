class ContactsController < ApplicationController
  before_action :set_contact, only: [:show]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact_events = Event.where(user: @contact.user).paginate(:page => params[:page], :per_page => 5).order(:created_at)
  end

  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.json { render :show, status: :created, location: @contact }
      else
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:email, :message, :user)
    end
end
