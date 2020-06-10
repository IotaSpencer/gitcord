#!/usr/bin/ruby
#
require "discordrb"
require "configatron"
require "json"
require "rest-client"
require "gitcord"

module Bot
  bot = Discordrb::Commands::CommandBot.new token: configatron.bot_token, prefix: configatron.bot_prefix

  # Discord commands
    module DiscordCommands; end

    Dir['lib/gitcord/commands/*.rb'].each { |file| load file }
    DiscordCommands.constants.each do |file|
    bot.include! DiscordCommands.const_get file
    end

    # Discord events
    module DiscordEvents; end

    Dir['lib/gitcord/events/*.rb'].each { |file| load file }
    DiscordEvents.constants.each do |file|
    bot.include! DiscordEvents.const_get file
    end

  # Run the Bot
  bot.run
end
