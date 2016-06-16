class Account
  attr_accessor :pin_code, :exp_date, :balance, :account_status

  def initialize
    @pin_code = generate_pin_code
    @exp_date = set_expire_date
    @balance = 0
    @account_status = :active
  end

  #The date is stored in a variable in capital letters because it's a constant
  STD_VALIDITY_YRS = 5

  def generate_pin_code
    rand (1000..9999)
  end

  def set_expire_date
    Date.today.next_year(STD_VALIDITY_YRS).strftime('%m/%y')
  end

  def deactivate
    @account_status = :deactivated
  end
end
