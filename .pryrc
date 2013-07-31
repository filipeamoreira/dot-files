# # Pry.config.editor = "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw"
# Pry.config.editor = proc { |file, line| "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw +#{line} #{file}" }
# Pry.config.prompt = proc do |obj, level, _|
#   prompt = ""
#   prompt << "#{Rails.version}@" if defined?(Rails)
#   prompt << "#{RUBY_VERSION}"
#   "#{prompt} (#{obj})> "
# end

# Pry.config.exception_handler = proc do |output, exception, _|
#   output.puts "\e[31m#{exception.class}: #{exception.message}"
#   output.puts "from #{exception.backtrace.first}\e[0m"
# end

# if defined?(Rails) && Rails.env
#   begin
#     if defined? Rails::ConsoleMethods
#       TOPLEVEL_BINDING.eval('self').extend Rails::ConsoleMethods
#       require "rails/console/app"
#       require "rails/console/helpers"
#     end
#   rescue LoadError => e
#     require "console_app"
#     require "console_with_helpers"
#   end
# end

# begin
#   require "awesome_print"
#   Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)}
# rescue LoadError => err
#    warn "=> Unable to load awesome_print"
# end

# # Pry.config.hooks.add_hook(:before_session, :add_rails_console_methods) do
# #   self.extend Rails::ConsoleMethods if defined?(Rails::ConsoleMethods)
# # end

# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false
Pry.plugins["doc"].activate!

# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  
  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
    require 'ruby18_source_location'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end

Pry.commands.alias_command "c", "continue"
Pry.commands.alias_command "s", "step"
Pry.commands.alias_command "n", "next"
