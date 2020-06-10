module Bot
  module DiscordEvents
    module Ready
      extend Discordrb::EventContainer
      ready do |event|
        event.bot.game = "#{configatron.bot_game}"
      end
      puts "Beep Beep Boop - Bot Ready!"
    end
  end
end
