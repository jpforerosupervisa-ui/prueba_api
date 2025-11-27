class PeopleController < ApplicationController
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created
    else
      render json: { errors: @person.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @people = Person.all
    render json: @people
  end

  def show
    @person = Person.find(params[:id])
    render json: @person
  end

  private

  def person_params
    params.permit(:identification_number, :first_name, :last_name)
  end
end
