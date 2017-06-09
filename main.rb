require './utils'
require './atm'
require './menu'
require './user'
require './conta'
require './user_creator'
require './account_creator'

account = Conta.new(1,'qwer','asd','123456')
usuario = User.new('Felipe','01392807c445', '31/08/1992', account)
$users = [usuario]

m = Menu.new
m.tela_inicial
