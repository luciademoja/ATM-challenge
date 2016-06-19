require './lib/atm.rb'
require './lib/account.rb'

class Person

attr_accessor :name, :cash, :account

  def initialize(attrs={})
    @name = set_name(attrs[:name])
    @cash = 0
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(amount)
    @account.nil? ? missing_account? : funds_deposit(amount)
  end

  def withdraw(args = {})
    @account == nil ? missing_account : withdraw_funds(args)
  end

  private
  #if the object equals nil then set missing owner otherwise set owner equal object
  def set_name(obj)
    obj == nil ?  missing_name : @name = obj
  end

  def missing_name
    raise "A person needs a name"
  end

  def missing_account?
    raise RuntimeError, 'No account present'
  end

  def missing_atm
   raise RuntimeError, 'An ATM is required'
 end

  def funds_deposit(amount)
    @account.balance += amount
    @cash -= amount
  end

  def withdraw_funds(args)
    args[:atm] == nil ? missing_atm : atm = args[:atm]
    account = @account
    amount = args[:amount]
    pin = args[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
  end

  def increase_cash(response)
    @cash += response[:amount]
  end
end
