class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update, :destroy, :delete]

  # GET /targets
  # GET /targets.json
  def index
    @targets = Target.all
  end

  # GET /targets/1
  # GET /targets/1.json
  def show
  end

  # GET /targets/new
  def new
    @target = Target.new
    @target.user_id = session[:login_user_id]
  end

  # GET /targets/1/edit
  def edit
  end

  # GET /targets/1/delete
  def delete
    if session[:login_user_id] != @target.user.id
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'You cannot delete this target.' }
      end
      return
    end
    @target.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Target was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  # POST /targets
  # POST /targets.json
  def create
    login_user = User.find(session[:login_user_id])
    if login_user.target.present?
      return respond_to do |format|
        format.html { redirect_to login_user.target, notice: "你只能关注一个人，你已经关注了#{login_user.target.wb_uid}了" }
        format.json { render json: @target.errors, status: :bad_request }
      end
    end

    @target = Target.new(target_params)

    respond_to do |format|
      if @target.save
        format.html { redirect_to @target, notice: 'Target was successfully created.' }
        format.json { render :show, status: :created, location: @target }
      else
        format.html { render :new }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /targets/1
  # PATCH/PUT /targets/1.json
  def update
    respond_to do |format|
      if @target.update(target_params)
        format.html { redirect_to @target, notice: 'Target was successfully updated.' }
        format.json { render :show, status: :ok, location: @target }
      else
        format.html { render :edit }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /targets/1
  # DELETE /targets/1.json
  def destroy
    @target.destroy
    respond_to do |format|
      format.html { redirect_to targets_url, notice: 'Target was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_target
      @target = Target.find(params[:id]||params[:target_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def target_params
      params.require(:target).permit(:wb_uid, :user_id)
    end
end
