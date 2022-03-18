namespace :dev do
  desc "TODO"
  task setup: :environment do
    spinner_show("Apagando banco de dados...") { %x( rails db:drop )}
    spinner_show("Criando novo banco de dados...") { %x( rails db:create )}
    spinner_show("Construindo tabelas do banco...") { %x( rails db:migrate )}
    spinner_show("Construindo tabelas do banco...") { %x( rails dev:add_default_user )}
    spinner_show("Adicionando objetivos...") { %x( rails dev:add_objectives )}
    spinner_show("Adicionando passos...") { %x( rails dev:add_steps )}
  end

  task add_default_user: :environment do
    User.create(email:"user@user.com", password:"user123", password_confirmation:"user123")
  end

  desc "Adicionar objetivos testes"
  task add_objectives: :environment do
    5.times do
      Objective.create(user_id: 1, name: Faker::Esport.event, deadline: Faker::Date.in_date_period)
    end
  end

  task add_steps: :environment do
    Objective.all.each do |objective|
      rand(2..5).times do
        Step.create(objective: objective, name: Faker::Esport.event, deadline: Faker::Date.in_date_period)
      end
    end
  end

  private

  def spinner_show(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")   
    spinner.auto_spin 
    spinner.success(msg_end)
  end

end
