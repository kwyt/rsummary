require 'rsummary'
require 'rsummary/command'
require 'thor'

module Rsummary
  class CLI < Thor
    class_option :help, type: :boolean, aliases: '-h', desc: 'help message.'
    class_option :version, type: :boolean, aliases: '-v', desc: 'version'

    desc 'version', 'version'
    def version
     p Rsummary::VERSION
    end

    desc 'history', 'show histories of summary'
    method_option 'limit', desc: 'limit', default: 30
    def history 
      Command.new(options['limit'].to_i).send(__method__.to_sym)
    end

    desc 'remove', 'Remove summaries'
    def remove
      Command.new.send(__method__.to_sym)
    end

    desc 'status', 'Show status of latest summary'
    def status
      Command.new.send(__method__.to_sym)
    end

  end
end
