require 'terminal-table'

module Rsummary
  class Status

    def initialize(json_obj)
      @json_obj = json_obj
      @total_size = @json_obj.size
      @unixtime = current_unixtime
      @current_status = @json_obj[@unixtime]
      @current_example_count = @json_obj[@unixtime]['example_count']
      @current_failure_count = @json_obj[@unixtime]['failure_count']
      @datetime = Time.at(@unixtime.to_i).strftime('%Y-%m-%d %H:%M:%S')
      @pass_rate = pass_rate
      @fully_formatted = fully_formatted
      set_table(@total_size, @pass_rate, @datetime)
    end

    def current_unixtime
      @json_obj.keys.sort!{|a, b| b <=> a }.first
    end

    def pass_rate
      100 - (100 * (@current_failure_count.to_f / @current_example_count.to_f).round(3))
    end

    def fully_formatted
      @current_status['fully_formatted'].gsub("\n", "\n\t")
    end

    def set_table(total_size, pass_rate, datetime)
      @table = Terminal::Table.new :headings => ['Number of Run', 'Recent Pass Rate', 'Last Ran At'], :rows => [[@total_size, @pass_rate, @datetime]]
      @table.style = { :alignment => :center }
    end

    def out
      puts "\n"
      puts @table
      puts "\n"
      puts 'Last Run Result:'
      puts @fully_formatted
    end
  end
end
