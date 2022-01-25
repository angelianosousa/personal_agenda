namespace :dev do
  desc "TODO"
  task setup: :environment do
    show_spinner("Destruindo Banco de Dados...") { %x(rails db:drop) }
    show_spinner("Criando novo Banco de Dados...") { %x(rails db:create) }
    show_spinner("Construindo Tabelas...") { %x(rails db:migrate) }
    show_spinner("Adicionando usuários teste...") { %x(rails dev:add_users) }
    show_spinner("Adicionando assuntos padrões e atividades adjacentes...") { %x(rails dev:add_boards_and_tasks) }
  end

  desc "Adicionar usuários"
  task add_users: :environment do
    5.times do |i|
      User.create(email:"user#{i}@user.com", password: "user123", password_confirmation:"user123")
    end
  end

  task add_boards_and_tasks: :environment do
    20.times do |i|
      Board.create(
        title: Faker::Books::CultureSeries.book,
        description: Faker::Lorem.paragraph
      )
    end

    Board.all.each do |board|
      rand(3..8).times do |t|
        Task.create(board_id: board.id, title: Faker::Educator.university, description: Faker::Lorem.paragraph , start_time: Faker::Date.backward(days: 14), finish: ["true", "false"])
      end
    end
  end

  def show_spinner(msg_start, msg_end = "Concluído!!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

end
