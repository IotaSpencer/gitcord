module Bot
  module DiscordCommands
    module Github
      extend Discordrb::Commands::CommandContainer
      command(:user, aliases: [:u]) do |event, *text|
        u_url = text.join("")
        gu_url = "https://api.github.com/users/#{u_url}"
        user = RestClient::Request.new(
          :method => :get,
          :url => "#{gu_url}"
        ).execute

        res_u = JSON.parse(user.to_s)
        puts res_u
        u_avatar = res_u['avatar_url']
        u_nick = res_u['login']
        u_name = res_u['name']
        u_bio = res_u['bio']
        u_id = res_u['id']
        u_url = res_u['html_url']
        u_followers = res_u['followers']
        u_following = res_u['following']
        u_location = res_u['location']
        u_repo = res_u['public_repos']
        u_gists = res_u['public_gists']

        event.channel.send_embed do |e|
          e.colour = "0x00ED00"
          e.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: "#{u_avatar}")
          e.title = "User Information on #{u_nick}"
          e.description = "#{u_bio}"
          e.add_field name: "|| Name", value: "#{u_name}"
          e.add_field name: "|| ID", value: "#{u_id}"
          e.add_field name: "|| GitHub URL", value: "[#{u_nick}](#{u_url})"
          e.add_field name: "|| Location", value: "#{u_location}"
          e.add_field name: "|| Followers", value: "#{u_followers}"
          e.add_field name: "|| Following", value: "#{u_following}"
          e.add_field name: "|| Public Repos", value: "#{u_repo}"
          e.add_field name: "|| Public Gists", value: "#{u_gists}"
        end
      end
    end
  end
end
