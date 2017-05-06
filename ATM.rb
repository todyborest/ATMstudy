class Atm

	def initialize
		@conta_usuario = rand(10000)
		@balanco_atm = rand(10000)
		mensagem_de_balanco_da_atm
	end

	def depositar_na_atm(quantia)
		@balanco_atm += quantia
		puts "Voce depositou R$ #{quantia} no caixa eletronico, agora o saldo do caixa e R$ #{@balanco_atm}"
	end

	def depositar_conta(deposit)
		@conta_usuario += deposit
		puts "Voce depositou a quantia de R$ #{deposit} com sucesso, sua conta agora possui R$ #{@conta_usuario}"
	end

	def sacar(valor)
		if valor <= @balanco_atm and valor <= @conta_usuario
			@balanco_atm -= valor
			@conta_usuario -= valor
			puts mensagem_de_saque_com_sucesso(valor)
		else
			puts mensagem_de_saque_incompleto(valor,@balanco_atm,@conta_usuario)
		end

    	puts mensagem_de_balanco_da_atm
    	puts mensagem_de_balanco_do_usuario
	end

	def mensagem_de_balanco_da_atm
		if @balanco_atm > 0
			"O caixa eletronico possui no momento:R$ #{@balanco_atm}"
		else
			"O caixa eletronico no momento esta sem dinheiro para saque"
		end
	end

	def mensagem_de_balanco_do_usuario
		"Sua conta no momento possui R$ #{@conta_usuario}."		
	end

	def mensagem_de_saque_com_sucesso(val)
    	"O saque foi realizado com sucesso. Foi sacado R$ #{val}"
	end

	def mensagem_de_saque_incompleto(quant,balan,balan_cli)
		if quant > balan
			"A quantia socilitada R$ #{quant} excedeu a que o caixa eletronico possui no momento R$ #{balan}."
		elsif quant > balan_cli
			"A quantia socilitada R$ #{quant} execedeu a que voce possui em sua conta no momento R$ #{balan_cli}"
		end
	end

end

class Menu

  def initialize
		@atm = Atm.new
  end

  def escolha_de_acao
    	opcao = gets.to_i

    	if opcao == 1
    		puts @atm.mensagem_de_balanco_da_atm
    	elsif opcao == 2
    		puts @atm.mensagem_de_balanco_do_usuario
    	elsif opcao == 3
    		puts "Qual o valor a ser sacado?"
    		valor_a_ser_sacado = gets.to_i
    		@atm.sacar(valor_a_ser_sacado)
    	elsif opcao == 4
    		puts "Qual o valor a ser depositado no caixa?"
    		valor_depositado_no_caixa = gets.to_i
    		@atm.depositar_na_atm(valor_depositado_no_caixa)
    	elsif opcao == 5
    		puts "Qual o valor a ser depositado na conta?"
    		valor_depositado_na_conta = gets.to_i
    		@atm.depositar_conta(valor_depositado_na_conta)
    	end
    	puts "Gostaria de voltar ao menu?
    			1 - Voltar   2- Sair"
    	voltar_menu = gets.to_i
    	if voltar_menu == 1
   			emitir
   		else
   			mensagem_de_finalizacao
   		end
  end

  def emitir
		puts "1 - Balanco do caixa eletronico"
		puts "2 - Balanco da conta"
    	puts "3 - Sacar"
    	puts "4 - Deposito no caixa eletronico"
    	puts "5 - Deposito na conta"
    	escolha_de_acao
  end

  def mensagem_de_finalizacao
  	puts "Agradecemos por ser nosso cliente, tenha uma otima semana"
  end
end

m = Menu.new
m.emitir

# Exercicio:
# 1- Poder depositar na ATM [X]
# 2- Poder depositar na Conta do Usuário[X]
# 3- Saldo da Conta do Usuário[X]
# 4- Adicionar a msg se o dinheiro acabar no ATM[X]