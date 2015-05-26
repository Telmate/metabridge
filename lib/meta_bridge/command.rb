require 'open3'

module MetaBridge::Command
  def run(cmd, &block)
    Open3.popen2e(cmd) do |stdin, out, wait_thr|
      yield(out, wait_thr) if block_given?
    end
  end
end
