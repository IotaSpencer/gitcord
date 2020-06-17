module GitCord
  module Execeptions
    class NotOwnerError < StandardError
      def initialize(event, msg = nil)
        msg = msg || "Current #{event.user.id} is not owner"
        rply = event.respond(msg)
        Timeout.timeout(2.5) do
          event.delete
          rply.delete
        end
        super(msg)
      end
    end
  end
end
