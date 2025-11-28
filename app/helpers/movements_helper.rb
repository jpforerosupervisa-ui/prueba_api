module MovementsHelper
  # Busca una persona por su número de identificación
  def find_person_by_identification(identification_number)
    Person.find_by(identification_number: identification_number)
  end

  # Busca la última autorización de una persona
  def find_authorization_for_person(person)
    person.authorizations.last
  end

  # Determina el mensaje de autorización según el estado y tiempo
  def determine_authorization_message(authorization, current_time)
    authorization.authorized_at?(current_time) ? "Autorizado" : "No autorizado"
  end

  # Crea un nuevo movimiento con los parámetros proporcionados
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
