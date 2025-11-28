module AuthorizationsHelper
  def find_or_create_person(identification_number, person_params)
    person = Person.find_by(identification_number: identification_number)

    if person.nil?
      person = Person.new(person_params)
      unless person.save
        return [ nil, person.errors.full_messages ]
      end
    end

    [ person, nil ]
  end


  def create_authorization_for_person(person, authorization_params)
    authorization = person.authorizations.new(authorization_params)

    if authorization.save
      [ authorization, nil ]
    else
      [ nil, authorization.errors.full_messages ]
    end
  end
end
