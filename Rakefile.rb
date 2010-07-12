#!/usr/bin/env ruby

desc "Set up all configs"
task :setup do
  FileUtils.mkdir_p '~/.vim/colors'
  sh 'cp -r vimcolors/. ~/.vim/colors/'

  FileUtils.cp '.bash_login', '~/'
  sh 'ln -s .bashrc ~/.bashrc'
  sh 'ln -s .gitconfig ~/.gitconfig'
  sh 'ln -s .gitignore ~/.gitignore'

  sh 'ln -s .hashrc ~/.hashrc'
  sh '~/bin/vimbundles.sh'
end
