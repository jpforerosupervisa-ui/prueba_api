class MovementsController < ApplicationController
  def create
    now = Time.current

    # Buscar la persona por número de identificación
    person = find_person_by_identification(movement_params[:identification_number])

    unless person
      return render json: { error: "Persona no encontrada" }, status: 404
    end

    # Buscar cualquier autorización de esa persona (no necesariamente activa)
    authorization = find_authorization_for_person(person)

    unless authorization
      return render json: { error: "No hay autorización para esta persona" }, status: 403
    end

    # Determinar el mensaje según si está activa o no
    message = determine_authorization_message(authorization, now)

    create_movement(
      authorization: authorization,
      current_time: now,
      way: movement_params[:way],
      vehicle_plate: movement_params[:vehicle_plate],
      message: message
    )

    render json: {
      message: message
    }
  end

  def index
    today = Time.current.beginning_of_day..Time.current.end_of_day
    movements = Movement.includes(authorization: :person).where(create_time: today)

    render json: movements.to_json(include: { authorization: { include: :person } })
  end

  private

  def movement_params
    params.require(:movement).permit(:identification_number, :way, :vehicle_plate)
  end

  def find_person_by_identification(identification_number)
    Person.find_by(identification_number: identification_number)
  end

  def find_authorization_for_person(person)
    person.authorizations.last
  end

  def determine_authorization_message(authorization, current_time)
    authorization.authorized_at?(current_time) ? "Autorizado" : "No autorizado"
  end

  def create_movement(authorization:, current_time:, way:, vehicle_plate:, message:)
    Movement.create!(
      authorization: authorization,
      create_time: current_time,
      way: way,
      vehicle_plate: vehicle_plate,
      message: message
    )
  end
end
