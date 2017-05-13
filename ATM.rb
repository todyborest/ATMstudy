class Atm

	def initialize(conta)
    @conta = conta
		@balanco_atm = rand(10000)
		mensagem_de_balanco_da_atm
	end

  def conta
    @conta
  end

	def depositar_na_atm(quantia)
		@balanco_atm += quantia
		puts "Voce depositou R$ #{quantia} no caixa eletronico, agora o saldo do caixa e R$ #{@balanco_atm}"
	end

	def depositar_conta(deposit)
    conta.deposit(deposit)
    puts "Voce depositou a quantia de R$ #{deposit} com sucesso, sua conta agora possui R$ #{conta.balanco}"
	end

  def pode_sacar?(amount)
    amount <= balanco_atm && conta.pode_sacar?(amount)
  end

  def balanco_atm
    @balanco_atm
  end

	def sacar(valor)
    if pode_sacar?(valor)
			@balanco_atm -= valor
      conta.withdraw(valor)
			puts mensagem_de_saque_com_sucesso(valor)
		else
			puts mensagem_de_saque_incompleto(valor)
		end

    	puts mensagem_de_balanco_da_atm
    	puts mensagem_de_balanco_do_usuario
	end

	def mensagem_de_balanco_da_atm
		if balanco_atm > 0
			"O caixa eletronico possui no momento:R$ #{balanco_atm}"
		else
			"O caixa eletronico no momento esta sem dinheiro para saque"
		end
	end

	def mensagem_de_balanco_do_usuario
    "Sua conta no momento possui R$ #{conta.balanco}."		
	end

	def mensagem_de_saque_com_sucesso(val)
    	"O saque foi realizado com sucesso. Foi sacado R$ #{val}"
	end

	def mensagem_de_saque_incompleto(quant)
		if quant > balanco_atm
			"A quantia socilitada R$ #{quant} excedeu a que o caixa eletronico possui no momento R$ #{balanco_atm}."
    elsif conta.saldo_insuficiente?(quant)
      "A quantia socilitada R$ #{quant} execedeu a que voce possui em sua conta no momento R$ #{conta.balanco}"
		end
	end

end
