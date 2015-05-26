require 'minitest_helper'

describe MetaBridge::CLI do
  describe 'all' do

    let(:cmd) { MetaBridge::CLI.start ['list'] }

    describe 'when no devices are present' do
      it 'returns a message' do
        MetaBridge::Device.stub :all, [] do
          actual = capture_io { cmd }.first
          expected = /No devices found/

          actual.must_match expected
        end
      end
    end

    describe 'when devices are present' do
      before do
        @devices = []

        10.times do 
          @devices << MetaBridge::Device.new
        end
      end

      it 'returns a list of devices' do
        MetaBridge::Device.stub :all, @devices do
          actual = capture_io { cmd }.first
          expected = /Device found/

          actual.must_match expected
        end
      end
    end
  end
end
