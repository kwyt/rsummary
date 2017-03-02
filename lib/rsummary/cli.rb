require 'rsummary'
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
    def history 
    end

    desc 'remove', 'Remove summaries'
    def remove
    end

    desc 'status', 'show status of latest summary'
    def status
    end

  end
end
