require 'json'

class NameCompany
  attr_reader :name_company

  def initialize(name_company)
    @name_company = JSON.parse(File.read(name_company))
  end

end
