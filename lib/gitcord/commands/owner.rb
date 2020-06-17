module Bot
  module DiscordCommands
    module Owner
      extend Discordrb::Commands::CommandContainer
      command(:shutdown, help_available: false, aliases: [:k]) do |event|
        begin
          if event.user.id == configatron.owner_id
            event.respond ":skull:"
          else
            event.respond "No can do, you're not my owner."
          end
          exec('clear')
          exit
        rescue
          event.respond ":negative_squared_cross_mark: | An error occurred"
        end
      end

      command(:restart, help_available: false, aliases: [:r]) do |event|
        begin
          if event.user.id == configatron.owner_id
            event.respond ":white_check_mark:"
          else
            raise GitCord::Exceptions::NotOwnerError
          end
          sleep 1
          exec('ruby gitcord.rb')
        rescue NotOwnerError.new(event)
          event.respond "No can do, you're not my owner."
        rescue
          event.respond ":negative_squared_cross_mark: | An error occurred"
        end
      end

      command(:clear, help_available: false, min_args: 1, aliases: [:c]) do |event, count|
        if event.user.id == configatron.owner_id
          c = count.to_i
          return "1:100" if c > 100
          event.channel.prune c, true
          puts "Deleted Messages"
        else
          raise GitCord::Execeptions::NotOwnerError.new(event)
        end
      end
      command(:eval) do |event, *code|
        if event.user.id == configatron.owner_id
          eval code.join(' ')
        else
          raise GitCord::Execeptions::NotOwnerError.new(event)
        end
      end
    end
  end
end
