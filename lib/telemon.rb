require "telemon/version"
require 'telegram/bot'
require 'gli'

module Telemon

  extend GLI::App

  CONFIG = YAML.load_file(File.join(ENV['HOME'], '.telemon.yml'))

  program_desc 'Push you message to Telegram'

  desc 'Push to Telegram'
  command :push do |c|
    c.flag [:chat_id], default_value: CONFIG['chat_id']
    c.flag [:token], default_value: CONFIG['token']
    c.action do |global_options,options,args|
      message = args[0]
      Telegram::Bot::Client.run(options[:token]) do |bot|
        bot.api.send_message(chat_id: options[:chat_id], text: message.to_s)
      end
    end
  end

end
