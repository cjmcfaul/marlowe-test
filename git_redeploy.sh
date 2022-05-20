set -o errexit

git_status=$(git status)

echo $git_status
