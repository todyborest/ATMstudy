class Conta

  attr_accessor :acc_type, :password, :secutiry_pas,
    :account_numb

  def initialize(acc_type,password,security_pass,account_numb)
    @acc_type = acc_type
    @password = password
    @security_pass = security_pass
    @account_numb = account_numb
    @balanco = rand(10000)
  end

  def balanco
    @balanco
  end

  def deposit(amount)
    @balanco += amount
  end

  def pode_sacar?(amount)
    amount <= balanco
  end

  def withdraw(amount)
    @balanco -= amount
  end

  def saldo_insuficiente?(amount)
    !pode_sacar?(amount)
  end

end
