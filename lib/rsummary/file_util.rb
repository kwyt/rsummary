require 'json'

module Rsummary
  module FileUtil

    DIR_PATH ="#{ENV['HOME']}/.rsummary/"
    FILE_PATH = "rspec_out.json"

    def save_to_file(result)
      make_dir
      write_to_file(result)
    end

    def load_json
      if file_exists?
        open(DIR_PATH + FILE_PATH) do |io|
          JSON.load(io)
        end
      end
    end

    def file_exists?
      File.exist?(DIR_PATH + FILE_PATH)
    end

    def make_dir
      FileUtils.mkdir_p(DIR_PATH) unless FileTest.exist?(DIR_PATH)
    end

    def write_to_file(result)
      File.open(DIR_PATH + FILE_PATH, "w") do |f|
        f.puts(result)
      end
    end

    def delete_file
      File.delete(DIR_PATH + FILE_PATH) if file_exists?
    end

  end
end
