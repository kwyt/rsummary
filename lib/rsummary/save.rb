require 'rspec/core/formatters/base_text_formatter'
require 'rsummary/file_util'

module Rsummary
  class Save < ::RSpec::Core::Formatters::BaseTextFormatter

    include FileUtil

    ::RSpec::Core::Formatters.register self, :dump_summary

    def dump_summary(notification)
      super(notification)

      summary = summary(notification)

      data = if file_exists?
               merge(summary, load_json)
             else
               merge(summary)
             end.to_json

      save_to_file(data)
    end

    def summary(notification)
      { example_count: notification.example_count,
        pending_count: notification.pending_count,
        failure_count: notification.failure_count,
        duration: notification.duration,
        totals_line: notification.totals_line,
        formatted_duration: notification.formatted_duration,
        fully_formatted: notification.fully_formatted
      }
    end

    def merge(result, json = {})
      json[Time.now.to_i.to_s] = result
      json
    end

  end
end
