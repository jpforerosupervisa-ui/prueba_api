class AuthorizationsController < ApplicationController
  def create
    person = Person.find_by(identification_number: params[:identification_number])

    if person.nil?
      person = Person.new(person_params)
      unless person.save
        return render json: { errors: person.errors.full_messages }, status: :unprocessable_entity
      end
    end

    authorization = person.authorizations.new(authorization_params)

    if authorization.save
      render json: authorization, status: :created
    else
      render json: { errors: authorization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def authorization_params
    params.permit(:start_time, :end_time, :company_origin)
  end
  def person_params
    params.permit(:identification_number, :first_name, :last_name)
  end
end
