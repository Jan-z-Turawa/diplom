DIR_HOME="/tmp"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

mkdir -p $DIR_HOME/git

ssh-keyscan -H github.com >> ~/.ssh/known_hosts

git clone https://github.com/Jan-z-Turawa/Prepare.git $DIR_HOME/git/Prepare

cd $DIR_HOME/git/Prepare

git remote set-url origin git@github.com:Jan-z-Turawa/Prepare.git
