# Git-Azure-Devops

**Prerequsite**

* Install Git on your machine
* Get the Azure Devops Access Token, and save it for later use.
Got to https://yoururl.visualstudio.com/_usersSettings/tokens
Create a valid token with enough access rights. e.g. Code > Read Write & Manage


**Run**

Run the powershell scripts, paste in the git access token.


**Commands**

git prb : Create pull request to the target branch
e.g. git prb master

`git prm` : Create pull request to master branch
e.g. `git prm`

`git prm --title` : To add a custom title
e.g. `git prm --title "Testing pull request to Azure Devops using command line"`

`git prmc` : Create pull request with auto complete. You can also use the --title the same way.

`git web` : Open Chrome and go to your pending pull request page.


**Integrate with SourceTree**

Go to Tools > Options > Custom Actions

Create Pull Request
* Add your caption: Create Pull Request
* Script to Run : git
* Parameters: prmc

Go to the pending pull request in browser
* Add your caption: Check Pull Request
* Script to Run : git
* Parameters: web

