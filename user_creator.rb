class UserCreator

  def initialize
    @name    = gets_name
    @cpf     = gets_cpf
    @born_at = gets_born_at
    @account = AccCreator.new().create()
  end

  def create
    if all_attributes_are_valid?
      return User.new(@name, @cpf, @born_at, @account)
    end

    puts 'Usuário não criado'
    return nil
  end

  private

  def all_attributes_are_valid?
    !@name.nil? && @name != '' && !@cpf.nil? && @cpf != '' && !@born_at.nil? && @born_at != ''
  end

  def gets_name
		puts "Informe seu nome completo."
		gets
	end

  def gets_cpf
		puts "informe seu cpf"
		cpf = Utils.custom_get
		while cpf.length != 11
			puts"Informe seu cpf corretamente, por favor"
			cpf = Utils.custom_get
		end

    cpf
	end

  def gets_born_at
		puts "informe sua data de nascimento"
		born_at = Utils.custom_get
		dat = Date.parse born_at
		idade = Time.now.year - dat.year
		if dat.month > Time.now.month
			if dat.day >= Time.now.day
				idade -= 1
			end
		end

    idade
	end

end
