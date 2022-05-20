set -o errexit

git_status="$(git pull origin main)"

echo $git_status

already="Already up-to-date."
updating="Updating"

if [$git_status == *"$updating"*]; then 
  echo "Updating App and redeploying"
elif [ "$git_status" == "$already" ]; then
  echo "Up-to-date with git repository"
  exit 
else
  echo "Unable to pull new version from git"
  echo $git_status
  exit
fi

docker_build=$(docker-compose -f production.yml build)

echo "$docker_build"
