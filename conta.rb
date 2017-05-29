class Conta

  def initialize
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
