require './utils'
class AccCreator

	def intialize
		@senha_poupanca = gets_pass_poupanca
		@senha_seguranca_poupanca = gets_safe_poupanca
		@num_poupanca = gets_numb_poupanca
		@senha_corrente = gets_pass_corrente
		@senha_seguranca_corrente = gets_safe_corrente
		@num_corrente = gets_numb_corrente
	end

	def create
		puts "Voce gostaria de um cartao de conta poupanca ou conta corrente?
	1 - Conta Poupanca		2 -	Conta Corrente"
		conta = gets.to_i

		if conta == 1
			gets_pass_poupanca
			gets_safe_poupanca
			gets_numb_poupanca
			puts "#{@senha_poupanca}, #{@senha_seguranca_poupanca}, #{@num_poupanca}"
		end

		if conta == 2
			gets_pass_corrente
			gets_safe_corrente
			gets_numb_corrente
			puts "#{@senha_corrente}, #{@senha_seguranca_corrente}, #{@num_corrente}"
		end
	end

	private

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
		num_poupanca = ""
			while num_poupanca.length < 6
				num_poupanca << rand(10)
			end
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
		num_corrente = ""
			while num_corrente.length < 10
				num_corrente << rand(10)
			end
		num_corrente
	end
end