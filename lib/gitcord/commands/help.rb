module Bot
  module DiscordCommands
    module Help
      extend Discordrb::Commands::CommandContainer
      command(:help) do |event|
        $footer = "GitChan Bot - Created by Yugateri"
        event.channel.send_embed do |embed|
          embed.colour = "0x00ED00"
          embed.title = "**Daftar Bantuan GitChan Bot**"
          embed.add_field name: "|| General", value: "`#{configatron.bot_prefix}ping`, `#{configatron.bot_prefix}info`"
          embed.add_field name: "|| GitHub", value: "`#{configatron.bot_prefix}user`, `#{configatron.bot_prefix}orgz`, `#{configatron.bot_prefix}repo`"
          embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: $footer)
        end
      end
    end
  end
end
