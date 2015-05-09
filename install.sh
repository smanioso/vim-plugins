#!/bin/bash

clone_link_plugin(){
	_plugin=`echo ${1} | rev | cut -d '/' -f 1 | rev | sed 's/\.git$//'`
	
	echo -e "\e[33mClone $_plugin\e[0m"
	git clone ${1} ./git_repos/$_plugin

	_dir_plugin=~/.vim/bundle/${_plugin}

	echo -n -e "\e[33mLink ${_plugin}\e[0m.."
	if [ ! -e ${_dir_plugin} ] ; then

		ln -s `pwd`/git_repos/${_plugin} ${_dir_plugin}
		echo -e "\e[32m ${_plugin} is installed \e[0m"
	else

		echo -n -e "\e[31m FAIL: \e[0m"
		echo -e "${_dir_plugin} already exists"
	fi
}

for git_url in `cat plugin_git_urls`
do
	clone_link_plugin ${git_url}
done
