require "telemon/version"
require 'telegram/bot'
require 'gli'

module Telemon

  extend GLI::App

  CONFIG = YAML.load_file('/home/robert/git/telemond/config.yml')
  
  command :push do |c|
    c.action do |global_options,options,args|
      p args
      message = args[0]
  
      token = CONFIG['token']
      chat_id = CONFIG['chat_id']
      Telegram::Bot::Client.run(token) do |bot|
        bot.api.send_message(chat_id: chat_id, text: message)
      end
    end
  end

end
