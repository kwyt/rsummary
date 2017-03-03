require 'spec_helper'
require 'rsummary/command'

RSpec.describe Rsummary::Command do

  let(:command) { Rsummary::Command.new }
  let(:date) { "Date: 2017-01-01 00:00:00" }
  let(:fully_formatted) { "\n\tFinished in 0.00124 seconds (files took 0.07935 seconds to load)\n\t\u001b[32m0 examples, 0 failures\u001b[0m\n\t\n" }

  describe '#history' do

    before do
      allow(command).to receive(:json_obj).and_return({"1483196400"=>{"fully_formatted"=>"\nFinished in 0.00124 seconds (files took 0.07935 seconds to load)\n\u001b[32m0 examples, 0 failures\u001b[0m\n"}})
    end

    it 'work' do
      expect do
        command.history
      end.to output("\n#{date.yellow}\n#{fully_formatted}").to_stdout
    end


  end

end
