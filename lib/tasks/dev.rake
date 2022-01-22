namespace :dev do
  desc "TODO"
  task setup: :environment do
    show_spinner("Destruindo Banco de Dados...") { %x(rails db:drop) }
    show_spinner("Criando novo Banco de Dados...") { %x(rails db:create) }
    show_spinner("Construindo Tabelas...") { %x(rails db:migrate) }
    show_spinner("Adicionando usuários teste...") { %x(rails dev:add_users) }
  end

  desc "Adicionar usuários"
  task add_users: :environment do
    5.times do |i|
      User.create(email:"user#{i}@teste.com", password: "teste123", password_confirmation:"teste123")
    end
  end

  def show_spinner(msg_start, msg_end = "Sucesso!!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

end
