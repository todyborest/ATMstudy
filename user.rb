require "date"

class User

  attr_accessor :name, :cpf, :born_at, :account

  def initialize(name, cpf, born_at, account)
    @name    = name
    @cpf     = cpf
    @born_at = born_at
    @account = account
  end

end