namespace :dev do
  desc "TODO"
  task setup: :environment do
    show_spinner("Destruindo Banco de Dados...") { %x(rails db:drop) }
    show_spinner("Criando novo Banco de Dados...") { %x(rails db:create) }
    show_spinner("Construindo Tabelas...") { %x(rails db:migrate) }
    show_spinner("Adicionando usuários teste...") { %x(rails dev:add_users) }
    show_spinner("Adicionando assuntos padrões e topicos adjacentes...") { %x(rails dev:add_subjects_and_topics) }
  end

  desc "Adicionar usuários"
  task add_users: :environment do
    5.times do |i|
      User.create(email:"user#{i}@teste.com", password: "teste123", password_confirmation:"teste123")
    end
  end

  task add_subjects_and_topics: :environment do
    20.times do |i|
      Subject.create(
        name: Faker::Books::CultureSeries.book, description: Faker::Lorem.sentence
      )
    end

    @subjects = Subject.all

    @subjects.each do |sub|
      rand(3..5).times do |t|
        Topic.create(subject_id: sub.id, name: Faker::Educator.university, description: Faker::Lorem.paragraph , status: ["concluído", "pendente", "em andamento"].sample)
      end
    end
  end

  def show_spinner(msg_start, msg_end = "Sucesso!!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

end
