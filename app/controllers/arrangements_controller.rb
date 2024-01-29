class ArrangementsController < ApplicationController
  def index
    @arrangements = Arrangement.all
  end

  def show
    @arrangement = Arrangement.find(params[:id])
  end

  def new
    @arrangement = Arrangement.new
  end

  def create
    @arrangement = Arrangement.new(arrangement_params)
    if current_user.client.blank?
      client = Client.new(user_id: current_user.id)
      client.save
      current_user.client = client
    end
    @arrangement.client_id = current_user.client.id
    @arrangement.agent_id = Agent.first.id
    if @arrangement.save!
      redirect_to arrangement_path(@arrangement)
    else
      render :new, status: :unprocessable_entity
    end
  end

    def edit
      @arrangement = Arrangement.find(params[:id])
    end

    def update
      @arrangement = Arrangement.find(params[:id])
      @arrangement.update(arrangement_params)
      if @arrangement.save!
        redirect_to arrangement_path(@arrangement)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @arrangement = Arrangement.find(params[:id])
      @arrangement.destroy
      redirect_to arrangements_path, status: :see_other
    end
    
  private

  def arrangement_params
    params.require(:arrangement).permit(:date, :subject, :agent_id)
  end
end
