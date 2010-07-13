#!/usr/bin/env ruby

desc "Set up all configs"
task :setup do
  FileUtils.mkdir_p '~/.vim/colors'
  sh 'cp -r vimcolors/. ~/.vim/colors/'

  FileUtils.cp '.bash_login', '~/'
  FileUtils.cp '.bash_profile', '~/'
  sh 'ln -s .bashrc ~/'
  sh 'ln -s .gitconfig ~/'
  sh 'ln -s .gitignore ~/'
  sh 'ln -s .hashrc ~/'
  sh 'ln -s .vimrc ~/'

  FileUtils.mkdir_p '~/bin'
  sh 'cp -r bin/. ~/bin/'
  sh '~/bin/vimbundles.sh'
end
