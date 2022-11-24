# frozen_string_literal: true

module TaskHelpers
  class Taskhelper
    class ComposeError < StandardError
      def initialize(message = "Docker Compose is not installed")
        super
      end
    end

    private
      def dev_error(e)
        if env_acceptable?
          puts "#{e.class}: #{e.message}"
          puts e.backtrace
        end
      end

      def env_acceptable?
        Rails.env.development? || Rails.env.test?
      end
  end
end
