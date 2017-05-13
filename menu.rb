# 1- Juntar a conta com Usuário. Um usuário possui uma Conta
# 2- Assim que ligar a maquina ela devera solicitar o numero do cartao e a senha
# 3- Caso o numero do cartao e a senha estejam corretos, o menu principal devera ser mostrado
# 4- Caso o numero do cartao e a senha nao sejam corretos ou ainda nao existe, devera criar a mesma para poder acessar
class Menu

  def initialize
    conta = Conta.new
		@atm = Atm.new(conta)
    @usuario = Usuario.new
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
      elsif opcao == 6
        @usuario.set_nome
        @usuario.set_cpf
        @usuario.set_data_de_nascimento
        @usuario.create_cartao
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
    puts "6 - cadastrar usuario"
    escolha_de_acao
  end

  def mensagem_de_finalizacao
  	puts "Agradecemos por ser nosso cliente, tenha uma otima semana"
  end
end
