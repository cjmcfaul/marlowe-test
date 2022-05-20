set -o errexit

git_status=$(git pull origin main)

if [ "$git_status"==*"Already up-to-date."* ]; then
  echo "Up to date with git repository"
  exit 
elif ["$git_status"==*"Updating"*]; then 
  echo "Updating App and redeploying"
else
  echo "Unable to pull new version from git"
  echo $git_status
  exit
fi
