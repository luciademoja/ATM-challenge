class Person

attr_accessor :name, :cash, :account

  def initialize(attrs={})
    @name = set_name(attrs[:name])
    @cash
    @account
  end

  private
  #if the object equals nil then set missing owner otherwise set owner equal object
  def set_name(obj)
    obj == nil ?  missing_name : @name = obj
  end
end
