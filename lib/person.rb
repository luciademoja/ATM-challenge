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

  private
  #if the object equals nil then set missing owner otherwise set owner equal object
  def set_name(obj)
    obj == nil ?  missing_name : @name = obj
  end

  def missing_name
    raise "A person needs a name"
  end
end
