require 'rsummary/file_util'
require 'rsummary/status'

module Rsummary
  class Command

    include FileUtil

    def initialize(num=100)
      @num = num
      @cnt = 0
      @json = load_json
    end

    def history
      json_obj.each do |k, v|
        break if limit?
        @cnt += 1

        puts "\n"
        puts "Date: #{Time.at(k.to_i).strftime('%Y-%m-%d %H:%M:%S')}".yellow
        puts v['fully_formatted'].gsub("\n", "\n\t")
      end
    end

    def remove
      delete_file
    end

    def status
      return if json_obj.empty?

      Rsummary::Status.new(json_obj).out
    end

    private

    def limit?
      @num <= @cnt
    end

    def json_obj
      @json.to_h
    end

  end
end
