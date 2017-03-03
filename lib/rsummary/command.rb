require 'rsummary/file_util'

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

    private

    def limit?
      @num <= @cnt
    end

    def json_obj
      @json.to_h
    end

  end
end
