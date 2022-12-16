# frozen_string_literal: true

namespace :dev do
  DEFAULT_PASSWORD = 123456

  desc 'Configura ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('apagando db...') { `rails db:drop` }
      show_spinner('criando db...') { `rails db:create` }
      show_spinner('migrando db...') { `rails db:migrate` }
      show_spinner('adiciona admin padrão...') { `rails dev:add_default_admin` }
      show_spinner('adiciona user padrão...') { `rails dev:add_default_user` }
      # %x(rails dev:add_minning_types)
    else
      puts 'você não está no ambiente de desenvolvimento'
    end
  end

  desc 'adiciona admin padrão'
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD
    )
  end

  desc 'adiciona user padrão'
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD
    )
  end

  private

  def show_spinner(msg_start, msg_end = 'Concluído')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
