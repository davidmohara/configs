#!/usr/bin/env ruby

PWD = Dir.pwd

desc "Set up all configs"
task :setup do
  FileUtils.mkdir_p '~/.vim/colors'
  sh 'cp -r vimcolors/. ~/.vim/colors/'

  FileUtils.cp '.bash_login', '~/'
  FileUtils.cp '.bash_profile', '~/'
  sh "ln -s #{PWD}.bashrc ~/"
  sh "ln -s #{PWD}.gitconfig ~/"
  sh "ln -s #{PWD}.gitignore ~/"
  sh "ln -s #{PWD}.hashrc ~/"
  sh "ln -s #{PWD}.vimrc ~/"

  FileUtils.mkdir_p '~/bin'
  sh 'cp -r bin/. ~/bin/'
  sh '~/bin/vimbundles.sh'
end
