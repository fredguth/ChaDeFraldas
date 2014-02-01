class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:show, :edit, :update, :destroy]

  # GET /contributions
  # GET /contributions.json
  def index
    @contributions = Contribution.all
  end

  # GET /contributions/1
  # GET /contributions/1.json
  def show
  end

  # GET /contributions/new
  def new
    @current_page = "contribution"
    @contribution = Contribution.new(params[:contribution])

  end

  # GET /contributions/1/edit
  def edit
  end

  # POST /contributions
  # POST /contributions.json
  def create
    @contribution = Contribution.new(params[:contribution])

    temp = params[:contribution][:card_number]
    @contribution.card_number = temp["first"]+temp["second"]+temp["third"]+temp["forth"]
    @contribution.ip = request.remote_ip
    respond_to do |format|
     
     #if @contribution.save
     if @contribution.purchase && @contribution.save
        format.html {
        #url="https://qpmiwsiqjj.localtunnel.me/payment_notifications"
        # redirect_to @contribution.paypal_url(url+"/confirmation",url)
        @current_page="success"
        render action: 'success',:params =>params[:contribution]
        }
        format.json { render action: 'show', status: :created, location: @contribution }
      else
        format.html {
        @current_page="failure"
        render action: 'failure',:params =>params[:contribution]
        }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /contributions/1
  # PATCH/PUT /contributions/1.json
  def update
    respond_to do |format|
      if @contribution.update(params[:contribution])
        format.html { redirect_to @contribution, notice: 'Contribution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contributions/1
  # DELETE /contributions/1.json
  def destroy
    @contribution.destroy
    respond_to do |format|
      format.html { redirect_to contributions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contribution
      @contribution = Contribution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contribution_params
      params.require(:contribution).permit(:user_id, :event_id,:product_id,:holder, :expires_on, :cvc)
    end
end
