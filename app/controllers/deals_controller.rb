class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy, :apply]
  
  # GET /deals
  # GET /deals.json
  def index
    unless params[:deals].present?
      @deals = Deal.all
      authorize @deals
    else
      deal_description = params[:deals][:search]
      @deals = Deal.search_by_name(deal_description)
    end
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
  end

  # GET /deals/new
  def new
    @deal = Deal.new
    authorize @deal
  end

  # GET /deals/1/edit
  def edit
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(deal_params)
    @deal.merchant = Merchant.find(current_user.id)
    authorize @deal
    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  def apply
    flash[:notice] = "You applied for the deal!"
    # create a voucher using the Voucher model (Voucher.new)
    @voucher = Voucher.new
    # Voucher is for Voucher.deal =  @deal
    @voucher.deal = @deal
    # Voucher is for User Voucher.user = current_user
    @voucher.user = current_user
    # Save the new Voucher
    @voucher.save
    # redirect_to root_path

    if @voucher.save
      VoucherMailer.voucher_mail(@voucher).deliver_now
      # format.html{ redirect_to @voucher }
      redirect_to root_path
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
      authorize @deal
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_params
      params.require(:deal).permit(:title, :description, :image, :original_price, :offer_price, :expiry, :quantity, :voucher_limit_per_user, :charge_id)
    end
end
