require 'meta_bridge/command'

# Wrapper class for the Android Debug Bridge (adb).
class MetaBridge::Bridge

  include MetaBridge::Command

  attr_accessor :device_id

  def get_state
    run(adb 'get-state') { |out| out.gets.strip }
  end

  def logcat(opts = {})
    params = []
    params << '-v threadtime'
    params << '-d'

    run(adb 'logcat', params) do |out|
      while line = out.gets
        puts line    
      end
    end
  end

  def connect_to_device
    run(adb 'connect', device_id)
  end

  def adb(subcommand, params = [])
    connect_to_device if device_id && subcommand != 'connect'

    cmd = []
    params = params.respond_to?(:join) ? params.join(' ') : params.to_s

    cmd << 'adb'
    cmd << "-s #{device_id}" if device_id
    cmd << subcommand
    cmd << params.is_a?(String) ? params : params.join(' ')

    cmd.join(' ')
  end

end
