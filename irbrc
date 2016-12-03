require 'rubygems'
require 'wirble'

Wirble.init
Wirble.colorize


IRB.conf[:AUTO_INDENT] = true

# IRB.conf[:PROMPT_MODE] = :INF_RUBY
IRB.conf[:PROMPT][:MY_INF_RUBY] = {
    :PROMPT_I => "irb> ",
    :PROMPT_S => "...  ",
    :PROMPT_C => "...  ",
    :RETURN   => "=> %s\n",
}

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = File.join ENV['HOME'], '.irb_history'
