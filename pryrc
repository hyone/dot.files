# -*- ruby -*-
# vim: filetype=ruby

# Pry.Config.pager = false

# Hit Enter to repeat last command
Pry::Commands.command /^$/, 'repeat last command' do
  _pry_.run_command Pry.history.to_a.last
end

# Prompt
# ----------------------------------------

# Add ruby version prompt string
Pry.config.prompt = [
  proc do |target_self, nest_level, pry|
    nested = nest_level.zero? ? '' : ":#{nest_level}"
    "[#{pry.input_array.size}] pry #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} (#{Pry.view_clip(target_self)})#{nested}> "
  end,
  proc do |target_self, nest_level, pry|
    nested = nest_level.zero? ? '' : ":#{nest_level}"
    "[#{pry.input_array.size}] pry #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} (#{Pry.view_clip(target_self)})#{nested}* "
  end
]

# awesome_print
# ----------------------------------------

begin
  require 'awesome_print'
rescue LoadError
end

AwesomePrint.pry! if defined? AwesomePrint

# hirb
# ----------------------------------------

begin
  require 'hirb'
rescue LoadError
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable width: 114

  extend Hirb::Console
  def vtable(record, options = {}, *args)
    table record, { vertical: true }.merge(options), *args
  end
end

# byebug
# ----------------------------------------

if defined?(PryByebug)
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'c', 'continue'
end
