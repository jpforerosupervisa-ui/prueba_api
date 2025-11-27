class AuthorizationsController < ApplicationController
  def create
    person = Person.find(params[:person_id])

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
end
