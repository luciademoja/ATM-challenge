require './lib/account.rb'
require 'date'

describe Account do

  it 'Check length pin_code digits' do
    pin_code = 1234
    pin_code_length = Math.log10(pin_code).to_i + 1
    expect(pin_code_length).to eq 4
    end

    it 'is expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end
end
