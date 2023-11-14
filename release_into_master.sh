#release_into_master.sh version 

target_branch_name="origin/release/${$1}"
branch_name="sync/release_${$1}_into_master"

git branch -D ${branch_name}

git checkout master
git checkout --no-track -b ${branch_name}
git merge ${target_branch_name}
git push origin ${branch_name} --verbose

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer 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" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  -d '
  {
  	"title":"Amazing new feature",
    "body":"Please pull these awesome changes in!",
    "head":"${branch_name}",
    "base":"master"
  }
  ' https://api.github.com/repos/AumJobs/git-practice/pulls

  
