class ArrangementsController < ApplicationController
  def index
    @arrangements = Arrangement.all
  end

  def new
    @arrangement = Arrangement.new
  end

  def create
    @arrangement = Arrangement.new(arrangement_params)
    Client.create!(user_id: current_user.id) if current_user.client.blank?

    @arrangement.client_id = current_user.client.id
    @arrangement.agent_id = Agent.first.id
    if @arrangement.save!
      redirect_to arrangements_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def arrangement_params
    params.require(:arrangement).permit(:date, :subject, :agent_id, :client_id)
  end
end
