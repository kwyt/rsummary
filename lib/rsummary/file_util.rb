require 'json'

module Rsummary
  module FileUtil

    DIR_PATH ="#{ENV['HOME']}/.rsummary/"
    FILE_NAME = "#{Dir.pwd.split('/').last}_rspec_out.json"

    def save_to_file(result)
      make_dir
      write_to_file(result)
    end

    def load_json
      if file_exists?
        open(DIR_PATH + FILE_NAME) do |io|
          JSON.load(io)
        end
      end
    end

    def file_exists?
      File.exist?(DIR_PATH + FILE_NAME)
    end

    def make_dir
      FileUtils.mkdir_p(DIR_PATH) unless FileTest.exist?(DIR_PATH)
    end

    def write_to_file(result)
      File.open(DIR_PATH + FILE_NAME, "w") do |f|
        f.puts(result)
      end
    end

    def delete_file
      File.delete(DIR_PATH + FILE_NAME) if file_exists?
    end

  end
end
