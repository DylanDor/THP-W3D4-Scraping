require_relative '../lib/Mairie_Christmas'

describe "townhall_name_and_email" do

  it "return an hash of all townhall with their emails" do
    expect(perform).to be_an(Array)
  end

  it "return the name of townhall" do  
    expect(perform).to include {"BEZONS"}
    expect(perform).to include {"HODENT"}
    expect(perform).to include {"SAGY"}
  end 

  it "return the email of townhall" do  
    expect(perform).to include {"accueil-mairie@ville-beauchamp.fr"}
  end 

end