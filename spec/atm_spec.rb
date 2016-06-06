require '.lib/atm.rb'
describe Atm do
  it "Has 1000$ on initialize" do
    expect(subject.funds).to eq 1000
  end
end
