class ContactsController < ApplicationController
  skip_before_action :set_global_contact
  before_action :authenticate_user!
  before_action :check_rights
  before_action :set_contact, only: %i[index update]

  def index
    if @contact.nil?
      @contact = Contact.new
      render :new
    else
      @contact
    end
  end

  def new; end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    if @contact.update(contact_params)
      redirect_to contacts_path
    else
      render :edit
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:vk_link, :email, :phone, :address,
                                    :small_address, :requisite)
  end

  def set_contact
    @contact = Contact.first
  end
end
