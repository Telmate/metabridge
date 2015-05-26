require 'thor'
require 'meta_bridge/device'

class MetaBridge::CLI < Thor

  desc 'list', 'List all the connected Android devices'
  long_desc <<RAG
The list command will show all the possible tablets that might be connected to
the current AP using the ARP table. It's a different method than using plain
`adb devices` because it also shows devices without any previous connections.

The `list` command will also cycle through all the possible tablets and try to
get the state of the device using the Android Debug Bridge.

Example usage:

  $ metabridge list\x5
  Device found: 10.10.1.50      00:27:22:d4:d5:da\x5
  Device found: 10.10.1.79      ac:22:0b:45:99:49\x5
  Device found: 10.10.1.82      ac:22:0b:67:94:91\x5
RAG
  def list
    devices = MetaBridge::Device.all
    str = []

    devices.each do |device|
      device_str = 'Device found: '
      device_str += set_color(device.ip.ljust(16), :yellow) # 255.255.255.255
      device_str += set_color(device.mac.ljust(18), :green) # aa:aa:aa:aa:aa:aa

      str << device_str
    end

    if str.empty?
      say 'No devices found'
    else
      say str.join("\n")
    end
  end

  desc 'log', 'Output the logcat for a specific device'
  option 'd', required: true
  long_desc <<RAG
Get the output of logcat for a specific Android device using the Android
Debug Bridge. The required parameter is the device MAC address, which can be
obtained using `metabridge list`

Example usage:

  $ metabridge log -d 00:27:22:d4:d5:da
  <OUTPUT>

In order to save the output to a file, simply run the following command:
  $ metabridge log -d 00:27:22:d4:d5:da > logcat.txt
RAG
  def log
    mac = options[:d]

    devices = MetaBridge::Device.all
    device = devices.select { |d| d.mac == mac }.first

    if device
      say device.log
    else
      say 'No device found'
    end
  end
end
