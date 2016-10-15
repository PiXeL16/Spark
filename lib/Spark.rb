require "Spark/version"

module Spark
  # Spark logger functionality
  class Spark
    class << self
      def log
        $stdout.sync = true
        @log ||= Logger.new($stdout)

        @log.formatter = proc do |severity, datetime, progname, msg|
          if $verbose
            string = "#{severity} [#{datetime.strftime('%Y-%m-%d %H:%M:%S.%2N')}]: "
          else
            string = "[#{datetime.strftime('%H:%M:%S')}]: "
          end

          string += "#{msg}\n"

          string
        end
        @log
      end

      def error(message)
        log.error(message.to_s.red)
      end

      def important(message)
        log.warn(message.to_s.yellow)
      end

      def success(message)
        log.info(message.to_s.green)
      end

      def info(message)
        log.info(message.to_s.blue)
      end

      def message(message)
        log.info(message.to_s)
      end
    end
  end
end
