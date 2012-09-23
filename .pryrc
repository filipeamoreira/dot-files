# Pry.config.editor = "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw"
Pry.config.editor = proc { |file, line| "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw +#{line} #{file}" }
Pry.config.prompt = proc do |obj, level, _|
  prompt = ""
  prompt << "#{Rails.version}@" if defined?(Rails)
  prompt << "#{RUBY_VERSION}"
  "#{prompt} (#{obj})> "
end

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "\e[31m#{exception.class}: #{exception.message}"
  output.puts "from #{exception.backtrace.first}\e[0m"
end

if defined?(Rails) && Rails.env
  begin
    if defined? Rails::ConsoleMethods
      TOPLEVEL_BINDING.eval('self').extend Rails::ConsoleMethods
      require "rails/console/app"
      require "rails/console/helpers"
    end
  rescue LoadError => e
    require "console_app"
    require "console_with_helpers"
  end
end

begin
  require "awesome_print"
  Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)}
rescue LoadError => err
   warn "=> Unable to load awesome_print"
end

# Pry.config.hooks.add_hook(:before_session, :add_rails_console_methods) do
#   self.extend Rails::ConsoleMethods if defined?(Rails::ConsoleMethods)
# end

Pry.commands.alias_command "c", "continue"
Pry.commands.alias_command "s", "step"
Pry.commands.alias_command "n", "next"
