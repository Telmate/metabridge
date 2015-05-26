require 'minitest_helper'

class MetaBridge::TestBridge
  attr_accessor :get_state
  attr_accessor :device_id
end

class MetaBridge::TestARP
  attr_accessor :connections
end

describe MetaBridge::Device do
  describe '.all' do

    let(:proxy) { MetaBridge::TestARP.new }

    describe 'when no devices are connected' do
      let(:connections) { [] }

      before { proxy.connections = connections }

      it 'returns an empty array' do
        actual = MetaBridge::Device.all(proxy: proxy)
        expected = []

        actual.must_equal expected
      end
    end

    describe 'when multiple devices are connected' do
      let(:bridge)  { MetaBridge::TestBridge.new }
      let(:connections) { [] }

      before do 
        3.times { connections << { ip: '0', mac: 'a', bridge: bridge } }

        proxy.connections = connections
        bridge.get_state = MetaBridge::Device::ONLINE_STATE
      end

      subject { MetaBridge::Device.all(proxy: proxy) }
      
      it 'returns an array of items' do
        subject.size.must_equal connections.size
      end

      it 'returns devices' do
        subject.first.must_be_kind_of MetaBridge::Device
      end
    end
  end

  describe '#online?' do

    let(:bridge) { MetaBridge::TestBridge.new }
    let(:device) { MetaBridge::Device.new(bridge: bridge) }

    describe 'when the tablet is offline' do

      before { bridge.get_state = 'unknown' }

      it 'returns false' do
        device.online?.must_equal false
      end
    end

    describe 'when the tablet is online' do

      before { bridge.get_state = MetaBridge::Device::ONLINE_STATE }

      it 'returns true' do
        device.online?.must_equal true
      end
    end

  end 
end
