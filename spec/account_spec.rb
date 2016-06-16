require './lib/account.rb'
require 'date'

describe Account do

  it 'Check length pin_code digits' do
    pin_code = 1234
    pin_code_length = Math.log10(pin_code).to_i + 1
    expect(pin_code_length).to eq 4
  end

  it 'Is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end

  it 'Expect balance of 0 on initialize' do
    expect(subject.balance).to eq 0
  end

  it 'Expect account_status to be active on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'deactivates account using Instance method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end
end
