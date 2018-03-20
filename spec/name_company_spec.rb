require 'spec_helper'

describe NameCompany do

  before(:each) do
    @file = NameCompany.new('name_company.json')
  end

  it "First person in the array should be named Roobbie Jiroutek and works at Skipfire" do
    expect(@file.name_company.first['first_name']).to eq('Roobbie')
    expect(@file.name_company.first['last_name']).to eq('Jiroutek')
    expect(@file.name_company.first['company']['current']).to eq('Skipfire')
  end

  it "Each person must have 5 past companies" do
    @file.name_company.each do |past|
      expect(past['past_companies'].count).to eq 5
    end
  end

  it "Theresita Bewicke place of work should be Leexo, located in Sergelen and in the Business Development department" do
    expect(@file.name_company[4]['company']['current']).to eq('Leexo')
    expect(@file.name_company[4]['company']['location']).to eq('Sergelen')
    expect(@file.name_company[4]['company']['department']).to eq('Business Development')
  end

  it "2 companies that Tyne Towe worked for are Divape and Fivechat" do
    expect(@file.name_company[7]['past_companies']).to include("Divape", "Fivechat")
  end

  it "Last name must be of type string" do
    expect(@file.name_company[4]['first_name']).to be_instance_of(String)
  end

end
