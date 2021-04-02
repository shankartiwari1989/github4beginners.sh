
Youtube: https://www.youtube.com/watch?v=J1bxZU1BdmQ

##################### STEP 1: INSTALL AND CONFIGURE GIT #####################

# Git installation command
sudo apt install git

# Check version
git --version

# Git configure
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# View already saved configure list
git config --list

# Create Directory for Local Workspace Repository 
mkdir schoolrepo

# Enter to the repository
cd schoolrepo




##################### STEP 2: LINK LOCAL REPOSITORY TO GITHUB (HTTPS) #####################
# Log in to your github account
# Create a public repository
# Click on "Clone or Download" button, and copy that url
# Back to Terminal and write bellow command (replace your_copied_url text with your actual url)
git clone your_copied_url

# check cloned repository
ls
cd schoolrepo

# CREATE NEW FILE AND COMMIT
touch helloworld.txt
gedit helloworld.txt
touch school1.txt
touch school2.txt
touch school3.txt
git status 
git add helloworld.txt
# NB: its very hard to manually add every file using "git add filename" command
# you can easily add all file in a single command using "git add -all" command, no need to manually add every file
git add -all
git status
git commit -m "1st commit (this is comment)"


# View git log 
git log
git log --oneline 

# Push to github
git push -u master
# write your github username and password and continue

# In this procedure (via Https) you have to put github username password EVERY time when you want to push
# its very insecure way, to avoid this we can make it more secure using SSH KEYS.



##################### PART 3: SSH KEYS #####################

# To see if existing SSH keys are present
ls -al ~/.ssh

# Create new SSH Keys
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# Adding your SSH key to the ssh-agent
# Start the ssh-agent in the background.
$ eval "$(ssh-agent -s)"
> Agent pid 59566

# Add your SSH private key to the ssh-agent
$ ssh-add ~/.ssh/id_rsa

# copy ~/.ssh/id_rsa.pub file contents.
# go to github website -> settings -> SSH and GPG Keys -> New SSH Key
# Type any text as Title and paste copied ssh keys in Key Textbox
# click on Add SSH Keys
gedit ~/.ssh/id_rsa.pub


##################### PART 4: CHANGE REPOSITORY FROM HTTPS TO SSH #####################

# We already configured our project using https, so we need to change our repository from https to SSH
# If you configured SSH from begining, skip this part.
# check current remote config
git remote -v
# change https to ssh 
$ git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
# verify remote config
git remote -v



# create some change to verify SSH is working properly
gedit school1.txt
git add -all
git status
git commit -m "modified school1 file"
git push -u master