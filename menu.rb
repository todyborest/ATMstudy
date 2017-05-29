class Menu

  def initialize
    @usuario = Usuario.new
    conta = Conta.new
    @atm = Atm.new(conta)
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

  def senha_corrente
    @pass_corrente = @usuario.senha_cartao_corrente
  end

  def mensagem_senha_conta_corrente
    'Por favor digite a senha de sua Conta Corrente'
  end

  def confirmacao_senha_corrente(pass_corrente)
    while senha_corrente != pass_corrente
      puts'Deseja digitar novamente a senha ou voltar para o menu de cadastro?
        1 - Digitar senha novamente  2 - Menu de cadastro'
      choice = gets.to_i
      if choice == 1
        puts 'Por favor digite a senha de sua Conta Corrente'
        pass_corrente = Utils.custom_get
      end
      if choice == 2
        tela_inicial
      end
    end
    emitir
  end

  def senha_poupanca
    @pass_poupanca = @usuario.senha_cartao_poupanca
  end

  def mensagem_senha_conta_poupanca
    'Por favor digite a senha de sua Conta Poupanca'
  end

  def confirmacao_senha_poupanca(pass_poupanca)
    while senha_poupanca != pass_poupanca
      puts 'Deseja digitar novamente a senha ou voltar para o menu de cadastro?
        1 - Digitar senha novamente  2 - Menu de cadastro'
      escolha = gets.to_i
      if escolha == 1
        puts 'Por favor digite a senha de sua Conta Poupanca'
        pass_poupanca = Utils.custom_get
      end
      if escolha == 2
        tela_inicial
      end
    end
      emitir
  end

  def tela_inicial
    puts 'Seja bem vindo, voce ja possui cadastro em nosso banco ou deseja se cadastrar?
        1 - Possuo cadastro          2 - Desejo me cadastrar'
    opcao = gets.to_i
    if opcao == 1
      puts 'Qual o tipo de conta que voce possui em nosso banco?
        1 - Conta Poupanca           2 - Conta Corrente'
      opcao2 = gets.to_i
      if opcao2 == 1
        puts mensagem_senha_conta_poupanca
        senha_conta_poupanca = Utils.custom_get
        confirmacao_senha_poupanca(senha_conta_poupanca)
      end
      if opcao2 == 2
        puts mensagem_senha_conta_corrente
        senha_conta_corrente = Utils.custom_get
        confirmacao_senha_corrente(senha_conta_corrente)
      end
    end
    if opcao == 2
      creator = UserCreator.new()
      creator.create()
      tela_inicial
    end
  end

  def emitir
    puts "Seja bem vindo senhor #{@usuario.nome}
Em que podemos lhe ajudar hoje?"
		puts "1 - Balanco do caixa eletronico"
		puts "2 - Balanco da conta"
    puts "3 - Sacar"
    puts "4 - Deposito no caixa eletronico"
    puts "5 - Deposito na conta"
    escolha_de_acao
  end

  def mensagem_de_finalizacao
  	'Agradecemos por ser nosso cliente tenha uma otima semana'
  end
end
