require 'bundler/setup'
Bundler.require(:default, :test)

ActiveRecord::Base.establish_connection(YAML::load(File.open('db/config.yml'))["test"])

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Event.all.each { |event| event.destroy }
  end
end
