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
      Client.create!(user_id: current_user.id)
    end
    @arrangement.client_id = current_user.id
    @arrangement.agent_id = Agent.first.id
    if @arrangement.save!
      redirect_to arrangement_path(@arrangement)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def arrangement_params
    params.require(:arrangement).permit(:date, :subject, :agent_id, :client_id)
  end
end
