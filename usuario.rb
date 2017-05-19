require "date"

class Utils

	def self.custom_get
		gets.strip
	end

end

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

class Usuario 

	def initialize
		@senha_poupanca = ''
		@senha_corrente = ''
	end
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
		end
	end

	def senha_cartao_poupanca
		@senha_poupanca
	end

	def senha_de_seg_cartao_poupanca
		@senha_seguranca
	end

	def num_cartao_poupanca
		@num_poupanca
	end

	def senha_cartao_corrente
		@senha_corrente
	end

	def senha_de_seg_cartao_corrente
		@senha_seguranca2
	end

	def num_cartao_corrente
		@num_corrente
	end

end

