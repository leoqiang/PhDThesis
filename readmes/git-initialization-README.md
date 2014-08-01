git repository initialization readme
=========

1. creat git account at github

2. install git windows client

3. set up git follow the guideline here

	https://help.github.com/articles/set-up-git
	
4. set up ssh keys to connect to github

	https://help.github.com/articles/generating-ssh-keys

	add .bashrc to c:\Documents and Settings\qfu.MAGILLA\ to auto start ssh-agent
	
5. follow the guideline here to 

	- initialize git repository in your local project directory
	- push it onto your github online repository

	http://stackoverflow.com/questions/4658606/import-existing-source-code-to-github/8012698




issues
============


*. 'git push origin master'  complains that "Permission denied (publickey)."

	check  "Control Panel" -> "System" -> "Advanced" -> "Environment Variables" variable SSH_AUTH_SOCK is set properly.
	Correct parameters can be obtained by run command 'ssh-agent'

	NOTE: although standard test 'ssh -vT git@github.com' will still fails, but 'git push' will work!  (Like a magic ...)



	

general update command
============

	* check files modified
	
		git status
		
	* add files need to be committed
	
		git add path\file_name
		
	* commit changes
	
		git commit -m ""
		
	* add changes to the github
	
		git push origin master
		
	