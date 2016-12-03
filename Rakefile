require 'rake'

def run_task(task)
  Rake::Task[task].reenable
  Rake::Task[task].invoke
end

task :default do
  run_task :install
end

desc 'prepare the home directory environment'
task :install do
  [:build_symlinks].each do |task|
    run_task task
  end
end

SYMLINKS = {
  '.agignore'         => 'etc/sh/agignore',
  '.bashrc.local'     => 'etc/local/bashrc.local',
  '.config/peco'      => 'etc/sh/peco',
  '.editrc'           => 'etc/sh/editrc',
  '.emacs.d'          => 'etc/emacs/',
  '.gemrc'            => 'etc/sh/gemrc',
  '.gitconfig'        => 'etc/sh/gitconfig',
  '.gitconfig.local'  => 'etc/local/gitconfig.local',
  '.gvimrc'           => 'etc/vim/gvimrc',
  '.ghci'             => 'etc/sh/ghci',
  '.gosh_completions' => 'etc/sh/gosh_completions',
  '.hgignore'         => 'etc/sh/hgignore',
  '.hgrc'             => 'etc/sh/hgrc',
  '.inputrc'          => 'etc/sh/inputrc',
  '.irbrc'            => 'etc/sh/irbrc',
  '.pryrc'            => 'etc/sh/pryrc',
  '.pystartup'        => 'etc/sh/pystartup',
  '.sbtrc'            => 'etc/sh/sbtrc',
  '.tigrc'            => 'etc/sh/tigrc',
  '.tmux.conf'        => 'etc/sh/tmux.conf',
  '.vim'              => 'etc/vim/vim/',
  '.vimrc'            => 'etc/vim/vimrc',
  '.vimrc_first.vim'  => 'etc/vim/vimrc_first.vim',
  '.vimrc.local'      => 'etc/local/vimrc.local',
  '.zshenv'           => 'etc/local/zshenv',
  '.zshrc'            => 'etc/zsh/zshrc',
  '.zshrc.local'      => 'etc/local/zshrc.local',
  '.zsh.d'            => 'etc/zsh/zsh.d/',
  'Rakefile'          => 'etc/sh/Rakefile',
  'requirements.txt'  => 'etc/sh/requirements.txt',
}.freeze

desc 'create symlinks to dotfiles'
task :build_symlinks do
  SYMLINKS.each do |symlink, path|
    symlink = File.expand_path(File.join('~/', symlink))
    path    = File.expand_path(File.join('~/', path))

    unless File.exist?(path)
      puts "skip: '#{path}' does not exist"
      next
    end

    if File.exist?(symlink)
      puts "skip: '#{symlink}' exists"
      next
    end

    puts "link from '#{path}' to '#{symlink}'"
    begin
      File.symlink(path, symlink);
    rescue SystemCallError => error
      puts "\tError: #{error.message}"
    end
  end
end
