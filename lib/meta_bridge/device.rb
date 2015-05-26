require 'meta_bridge/bridge'
require 'meta_bridge/arp'

class MetaBridge::Device

  DEFAULT_IP = '0.0.0.0'
  DEFAULT_MAC = '00:00:00:00:00:00'
  ONLINE_STATE = 'device'.freeze

  attr_reader :ip
  attr_reader :mac
  attr_reader :port
  attr_reader :bridge

  class << self
    def all(opts = {})
      proxy = opts.delete(:proxy) || MetaBridge::ARP.new

      devices = proxy.connections.map do |con| 
        MetaBridge::Device.new(con.merge(opts))
      end

      devices.select { |d| d.online? }
    end
  end

  def initialize(hsh = {})
    @ip   = hsh[:ip] || MetaBridge::Device::DEFAULT_IP
    @mac  = hsh[:mac] || MetaBridge::Device::DEFAULT_MAC
    @port = hsh[:port] || MetaBridge::DEFAULT_PORT

    @bridge = hsh[:bridge] || MetaBridge::Bridge.new
    @bridge.device_id = "#{ip}:#{port}"
  end

  def online?
    bridge.get_state == ONLINE_STATE
  end

  def log
    bridge.logcat
  end
end
