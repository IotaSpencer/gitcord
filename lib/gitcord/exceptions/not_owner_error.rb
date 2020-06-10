module GitCord
  module Execeptions
    class NotOwnerError < StandardError
      def initialize(msg = "Current event.user.id is not owner")
        super(msg)
      end
    end
  end
end
