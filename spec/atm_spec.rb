require './lib/atm.rb'
require 'date'
describe Atm do
  let(:account) { class_double('Account', pin_code: '1234', exp_date: '08/18', account_status: :active) }

  before do
    allow(account).to receive(:balance).and_return(100)
    allow(account).to receive(:balance=)
  end
  it "Has 1000$ on initialize" do
    expect(subject.funds).to eq 1000
  end
  it "Funds are reduced at withdraw" do
    subject.withdraw(50, '1234', account)
    expect(subject.funds).to eq 950
  end
  it 'Allow withdraw if account has enough balance.' do
    expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
    expect(subject.withdraw(45, '1234', account)).to eq expected_output
  end
  it 'Reject withdraw if account has insufficient funds' do
    expected_output = { status: true, message: 'insufficient funds', date: Date.today }
    expect(subject.withdraw(105, '1234', account)).to eq expected_output
  end
  it 'Reject withdraw if ATM has insufficient funds' do
    subject.funds = 50
    expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
    expect(subject.withdraw(100, '1234', account)).to eq expected_output
  end
  it 'Reject withdraw with wrong pin-code' do
    expected_output = { status: false, message: "wrong pin", date: Date.today }
    expect(subject.withdraw(50, '4321', account)).to eq expected_output
  end
  it 'Reject withdraw if expiration date passed' do
    allow(account).to receive(:exp_date).and_return('12/15')
    expected_output = { status: false, message: "card expired", date: Date.today }
    expect(subject.withdraw(6, '1234', account)).to eq expected_output
  end
  it 'Reject withdraw if account_status is disabled' do
    allow(account).to receive(:account_status).and_return(:disabled)
    expected_output = { status: false, message: 'account disabled', date: Date.today }
    expect(subject.withdraw(10, '1234', account)).to eq expected_output
  end
end
