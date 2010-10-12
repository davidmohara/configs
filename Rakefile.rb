#!/usr/bin/env ruby

desc "Set up all configs"
task :setup do
  FileUtils.mkdir_p '~/.vim/colors'
  sh 'cp -r vimcolors/. ~/.vim/colors/'

  FileUtils.cp '.bash_login', '~/'
  FileUtils.cp '.bash_profile', '~/'
  link_file '.bashrc', '~/'
  link_file '.gitconfig', '~/'
  link_file '.gitignore', '~/'
  link_file '.hashrc', '~/'
  link_file '.vimrc', '~/'
  link_file '.viemurc', '~/'
  link_file '.common.vim', '~/'

  FileUtils.mkdir_p '~/.vim/autoload'
  sh 'cp -r autoload/. ~/.vim/autoload/'

  FileUtils.mkdir_p '~/bin'
  sh 'cp -r bin/. ~/bin/'
  sh '~/bin/vimbundles.sh'
end

def link_file(filename, target_dir)
  sh "ln -s #{pwd}/#{filename} #{target_dir}" unless File.exist? File.expand_path target_dir + filename
end
