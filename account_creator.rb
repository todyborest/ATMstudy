require './utils'
class AccCreator

	def initialize
    puts "Voce gostaria de um cartao de conta poupanca ou conta corrente?
	1 - Conta Poupanca		2 -	Conta Corrente"

    @acc_type = gets.to_i
	
    if @acc_type == 1
      @password = gets_pass_poupanca
      @security_pass = gets_safe_poupanca
      @account_numb = gets_numb_poupanca
    elsif @acc_type == 2
      @password = gets_pass_corrente
      @security_pass = gets_safe_corrente
      @account_numb = gets_numb_corrente
    end
	end

	def create
    if all_attributes_are_valid?
      return Conta.new(@acc_type,@password,@security_pass,@account_numb)
    end

    puts 'Conta não criada'
    return nil
	end

	private

  def all_attributes_are_valid?
    !@password.nil? && @password != '' && !@security_pass.nil? && @security_pass != '' && !@account_numb.nil? && @account_numb != ''
  end

	def gets_pass_poupanca
		puts "Qual senha voce gostaria para seu cartao de Conta Poupanca com 4 digitos?"
			senha_poupanca = Utils.custom_get
			while senha_poupanca.length != 4
				puts "Sua senha esta incorreta, digite apenas 4 digitos."
				senha_poupanca = Utils.custom_get
			end
		puts "Sua senha foi criada com sucesso."
		senha_poupanca
	end

	def gets_safe_poupanca
		puts "Agora socilitamos que escolha uma senha de seguranca com 3 letras"
			senha_seguranca = Utils.custom_get
			while senha_seguranca.length != 3
				puts "Por favor escolha apenas 3 letras"
				senha_seguranca = Utils.custom_get
			end
		senha_seguranca
	end

	def gets_numb_poupanca
		num_poupanca = ''
		6.times do
      random_num = rand(10).to_s
			num_poupanca << random_num
		end
    puts "Seu numero de conta e #{num_poupanca}."
		 num_poupanca
	end

	def gets_pass_corrente
		puts "Qual senha voce gostaria para seu cartao de Conta Corrent com 6 digitos?"
			senha_corrente = Utils.custom_get
			while senha_corrente.length != 6
				puts "Sua senha esta incorreta, digite apenas 6 digitos."
				senha_corrente = Utils.custom_get
			end
		puts "Sua senha foi criada com sucesso."
		senha_corrente
	end

	def gets_safe_corrente
		puts "Agora socilitamos que escolha uma senha de seguranca com 3 letras"
			senha_seguranca2 = Utils.custom_get
			while senha_seguranca2.length != 3
				puts "Por favor escolha apenas 3 letras"
				senha_seguranca2 = Utils.custom_get
			end
		senha_seguranca2
	end

	def gets_numb_corrente
		num_corrente = ''
		10.times do
      num_corrente << rand(10).to_s
		end
    puts "Sua senha e #{num_corrente}."
    num_corrente
	end
end

