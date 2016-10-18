require "Spark/version"
require 'colored'
require 'logger'

module Spark
  # Spark logger functionality
  class Spark
    # returns the medium on where to print the error
    attr_reader :out
    attr_reader :verbose

    def initialize(out: $stdout, verbose: false)
      @out = out
      @verbose = verbose
    end

    def log
      out.sync = true
      @log ||= Logger.new(out)

      @log.formatter = proc do |severity, datetime, progname, msg|
        if verbose
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
      log.warn(message.to_s.purple)
    end

    def warning(message)
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
