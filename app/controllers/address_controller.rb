class AddressController < ApplicationController
  before_action :authenticate_user!


  def index
    @addresses = User.find(current_user.id).addresses
  end

  def create
    @address = Address.new(addresses_params)
    if @address.save
      params[:status] = 'OK'
    else
      params[:status] = 'ERROR'
    end
    render :json => params
  end

  def edit

    @address = Address.find(params[:id])
    if @address.update_attributes(addresses_params)
      params[:status] = 'OK'
    else
      params[:status] = 'ERROR'
    end
    render :json => params
  end

  def delete
    Address.find(params[:id]).destroy
    params[:status] = 'OK'
    render :json => params
  end



  private
  def addresses_params
    params.require(:address).permit(:user_id, :first_name, :last_name, :address_field, :phone_number)

  end
end
