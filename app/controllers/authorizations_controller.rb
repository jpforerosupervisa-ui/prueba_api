class AuthorizationsController < ApplicationController
  include AuthorizationsHelper

  def create
    person, person_errors = find_or_create_person(
      params[:identification_number],
      person_params
    )

    if person_errors
      return render json: { errors: person_errors }, status: :unprocessable_entity
    end

    authorization, auth_errors = create_authorization_for_person(person, authorization_params)

    if auth_errors
      render json: { errors: auth_errors }, status: :unprocessable_entity
    else
      render json: authorization, status: :created
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
