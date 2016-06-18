class Account
  attr_accessor :pin_code, :exp_date, :balance, :account_status, :owner

  def initialize(attrs={})
    @pin_code = generate_pin_code
    @exp_date = set_expire_date
    @balance = 0
    @account_status = :active
    @owner = set_owner(attrs[:owner])
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

  private

  #if the object equals nil then set missing owner otherwise set owner equal object
  def set_owner(obj)
    obj == nil ?  missing_owner : @owner = obj
  end
  
  def missing_owner
    raise "An Account owner is required"
  end
end
