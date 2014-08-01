module Tmuxinator
  module Util
    include Thor::Actions

    def exit!(msg)
      puts msg
      Kernel.exit(1)
    end

    def yes_no(condition)
      condition ? say("Yes", :green) : say("No", :red)
    end

    def exec_script(script)
      temp = Tempfile.new('tmuxinator')
      temp.write(script)
      temp.close
      Kernel.system('sh', temp.path)
      exit $?.exitstatus
    ensure
      temp.unlink
    end
  end
end
