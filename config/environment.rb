require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/battlebuilder'
require_relative '../apps/admin/application'

Hanami.configure do
  mount Admin::Application, at: '/admin'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/battlebuilder_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/battlebuilder_development'
    #    adapter :sql, 'mysql://localhost/battlebuilder_development'
    #
    adapter :sql, ENV['DATABASE_URL']

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/battlebuilder/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json

    mailer do
      delivery :smtp, address: ENV['SMTP_HOST'], port: ENV['SMTP_PORT']
    end
  end
end
