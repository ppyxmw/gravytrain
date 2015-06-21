class ProvidersController < ApplicationController
  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.create(provider_params)

    if @provider.valid?
      ProvidersMailer.register(@provider).deliver_later
      redirect_to @provider
    else
      render :new
    end
  end

  def show
    @provider = Provider.find(params[:id])
    render :show
  end

  def confirm
    @provider = Provider.find(params[:id])
    if @provider.token == params[:token]
      @provider.confirmed = true
      @provider.save!
      render :show
    else
      render :show
    end
  end

  private

  def provider_params
    params.require(:provider).permit(
      :name, :address, :postcode, :about_me, :paypal_email, :accepted_terms
    )
  end
end
