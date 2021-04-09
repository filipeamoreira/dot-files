begin
  require 'pry'
  Pry.start
  exit
rescue LoadError
  warn '=> Unable to load pry'
end

IRB.conf[:EVAL_HISTORY] = 3

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
  warn '=> Unable to load awesome_print'
end
