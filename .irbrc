begin
  require 'pry'
  Pry.start
  exit
rescue LoadError => e
  warn '=> Unable to load pry'
end

# begin
#   require 'awesome_print'
#   AwesomePrint.irb!
# rescue LoadError => e
#   warn '=> Unable to load awesome_print'
# end
