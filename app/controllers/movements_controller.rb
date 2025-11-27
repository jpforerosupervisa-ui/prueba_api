class MovementsController < ApplicationController
  def create
    now = Time.current

    authorization = Authorization.find_by(authorization_id: movement_params[:authorization_id])

    unless authorization
      return render json: { error: "Authorization not found" }, status: 404
    end

    message = authorization.authorized_at?(now) ? "Autorizado" : "No autorizado"

    movement = Movement.create!(
      authorization: authorization,
      create_time: now,
      way: movement_params[:way],
      vehicle_plate: movement_params[:vehicle_plate],
      message: message
    )

    render json: {
      message: message,
      movement: movement
    }
  end

  def index
    today = Time.current.beginning_of_day..Time.current.end_of_day
    movements = Movement.includes(authorization: :person).where(create_time: today)

    render json: movements.to_json(include: { authorization: { include: :person } })
  end

  private

  def movement_params
    params.require(:movement).permit(:authorization_id, :way, :vehicle_plate)
  end
end
