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
    @account.nil? ? no_account? : funds_deposit(amount)
  end

  def no_account?
    raise RuntimeError, 'No account present'
  end

  private
  #if the object equals nil then set missing owner otherwise set owner equal object
  def set_name(obj)
    obj == nil ?  missing_name : @name = obj
  end

  def missing_name
    raise "A person needs a name"
  end

  def funds_deposit(amount)
    @account.balance += amount
    @cash -= amount
  end


end
