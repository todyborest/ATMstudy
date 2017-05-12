require "date"

class Utils


	def self.custom_get
		gets.strip
	end

end

class Usuario

	def set_nome
		puts "Informe seu nome completo."
		@nome = gets
	end

	def nome
		@nome
	end

	def set_cpf
		puts "informe seu cpf"
		@cpf = Utils.custom_get
		while @cpf.length != 11
			puts"Informe seu cpf corretamente, por favor"
			@cpf = Utils.custom_get
		end
	end

	def cpf
		@cpf
	end

	def set_data_de_nascimento
		puts "informe sua data de nascimento"
		@data_de_nascimento = Utils.custom_get
		dat = Date.parse @data_de_nascimento
		idade = Time.now.year - dat.year
		if dat.month > Time.now.month
			if dat.day >= Time.now.day
				idade -= 1
			end
		end
	end

	def data_de_nascimento
		@data_de_nascimento
		
	end


	def create_cartao
		puts "Voce gostaria de um cartao de conta poupanca ou conta corrente?
	1 - Conta Poupanca		2 -	Conta Corrente"
		conta = gets.to_i

		if conta == 1
			puts "Qual senha voce gostaria para seu cartao de Conta Poupanca com 4 digitos?"
			@senha_poupanca = Utils.custom_get
			while @senha_poupanca.length != 4
				puts "Sua senha esta incorreta, digite apenas 4 digitos."
				@senha_poupanca = Utils.custom_get
			end
			puts "Sua senha foi criada com sucesso."
			puts "Agora socilitamos que escolha uma senha de seguranca com 3 letras"
			@senha_seguranca = Utils.custom_get
			while @senha_seguranca.length != 3
				puts "Por favor escolha apenas 3 letras"
				@senha_seguranca = Utils.custom_get
			end
			@num_poupanca = ""
			while @num_poupanca.length < 6
				@num_poupanca << rand(10)
			end
			puts "obrigado pela paciencia, seu cartao de conta poupanca chegará em sua residencia dentro de 15 dias devidamente configurado e pronto para uso."
		end

		if conta == 2
			puts "Qual senha voce gostaria para seu cartao de Conta Corrent com 6 digitos?"
			@senha_corrente = Utils.custom_get
			while @senha_corrente.length != 6
				puts "Sua senha esta incorreta, digite apenas 6 digitos."
				@senha_corrente = Utils.custom_get
			end
			puts "Sua senha foi criada com sucesso."
			puts "Agora socilitamos que escolha uma senha de seguranca com 3 letras"
			@senha_seguranca2 = Utils.custom_get
			while @senha_seguranca2.length != 3
				puts "Por favor escolha apenas 3 letras"
				@senha_seguranca2 = Utils.custom_get
			end
			@num_corrente = ""
			while @num_corrente.length < 10
				@num_corrente << rand(10)
			end
			puts "obrigado pela paciencia, seu cartao de conta corrente chegará em sua residencia dentro de 15 dias devidamente configurado e pronto para uso."
		end
	end

	def cartao_poupanca
		@senha_poupanca
		@senha_seguranca
		@num_poupanca
	end

	def cartao_corrente
		@senha_corrente
		@senha_seguranca2
		@num_corrente
	end

end

