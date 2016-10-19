require 'Spark/version'
require 'colored'
require 'logger'

module Spark
  # Spark logger functionality
  class Spark
    # returns the medium on where to print the error
    attr_reader :out
    attr_reader :verbose
    # Initialize with default stdout output and verbose false
    def initialize(out: $stdout, verbose: false)
      @out = out
      @verbose = verbose
    end

    # Gets the logging object
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

    # Shows an error message
    def error(message)
      log.error(message.to_s.red)
    end

    # Show an important message in upper case
    def important(message)
      log.warn(message.to_s.upcase.magenta)
    end

    # Shows a warning message
    def warning(message)
      log.warn(message.to_s.yellow)
    end

    # Shows a success message
    def success(message)
      log.info(message.to_s.green)
    end

    # Shows an info message
    def info(message)
      log.info(message.to_s.blue)
    end

    # Shows a regular message
    def message(message)
      log.info(message.to_s)
    end
  end
end
