require("rspec")
  require("pg")
  require("list")
  require("to_do_list")
  require('capybara/rspec')
    require('./app')
    Capybara.app = Sinatra::Application
    set(:show_exceptions, false)
  DB = PG.connect({:dbname => "to_do_test"})

  RSpec.configure do |config|
    config.after(:each) do
      DB.exec("DELETE FROM lists *;")
      DB.exec("DELETE FROM tasks *;")
    end
  end
