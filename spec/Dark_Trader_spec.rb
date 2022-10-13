require_relative '../lib/Dark_Trader'

describe "crypto" do

  it "return an hash of all crypto with their prices" do
    expect(crypto(source)).to be_an(Array)
  end

  it "return the name of crypto" do  
    expect(crypto(source)).to include {"BTC"}
    expect(crypto(source)).to include {"ETH"}
    expect(crypto(source)).to include {"USDT"}
  end 

end