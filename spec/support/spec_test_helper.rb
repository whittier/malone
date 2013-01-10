module SpecTestHelper
  def login(person)
    person = Person.where(:login => person.to_s).first if person.is_a?(Symbol)
    session[:person] = person.id
  end

  def current_person
    Person.find(request.session[:person])
  end
end
