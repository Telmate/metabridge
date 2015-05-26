require 'meta_bridge/command'

class MetaBridge::ARP
  include MetaBridge::Command

  IP_REGEX = /(\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b)/i
  MAC_REGEX = /([0-9A-F]{2}[:-]){5}([0-9A-F]{2})/i

  def connections
    connections = []
    run('arp -i eth1 -a') do |out|
      while line = out.gets
        connections << parse_arp_line(line)
      end
    end

    connections
  end
  
  def parse_arp_line(line)
    hsh = {}
    
    line.split.each do |token|
      hsh[:ip] = $1 if token =~ IP_REGEX
      hsh[:mac] = token if token =~ MAC_REGEX
    end

    hsh
  end
end
