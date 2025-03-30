#!/bin/sh

# 创建组织
function create_org {
  local org_name="$1"

  curl -sSL -u "$TOKEN" -X 'POST' \
    "${INSTANCE_URL}/api/v1/orgs" \
    -H 'Content-Type: application/json' \
    -d "{
      \"username\": \"${org_name}\",
      \"visibility\": \"public\"
    }"
}

# 迁移仓库
function migrate_repo {
  local repo_url="$1"
  local repo_owner="$2"
  local repo_name="$3"

  set -x
  curl -sSL -u "$TOKEN" -X 'POST' \
    "${INSTANCE_URL}/api/v1/repos/migrate" \
    -H 'Content-Type: application/json' \
    -d "{
      \"clone_addr\": \"${repo_url}\",
      \"service\": \"github\",
      \"mirror\": true,
      \"repo_owner\": \"${repo_owner}\",
      \"repo_name\": \"${repo_name}\"
    }"
}

function delete_repo {
  local repo_owner="$1"
  local repo_name="$2"

  curl -sSL -u "$TOKEN" -X 'DELETE' \
    "${INSTANCE_URL}/api/v1/repos/${repo_owner}/${repo_name}"
}

# 获取全局 runner registration-token
function shared_runner_token {
  curl -sSL -u "$TOKEN" -X 'GET' \
    "${INSTANCE_URL}/api/v1/admin/runners/registration-token" | jq -r .token
}

INSTANCE_URL=${1-:http://127.0.0.1:3000}
USERNAME=${2}
PASSWORD=${3}
TOKEN="${USERNAME}:${PASSWORD}"

# https://github.com/actions/checkout.git
# https://github.com/akkuman/gitea-release-action.git
# https://github.com/actions/upload-artifact.git
# https://github.com/actions/cache.git

REPOS=()
REPOS+=( "https://github.com/actions/checkout.git" )
REPOS+=( "https://github.com/akkuman/gitea-release-action.git" )
REPOS+=( "https://github.com/actions/upload-artifact.git" )
REPOS+=( "https://github.com/actions/cache.git" )

echo "create repo"
create_org "actions"

for repo in ${REPOS[@]}
do
  repo_name=$(basename -s .git "$repo")
  echo "migrate repo: $repo"
  migrate_repo $repo "actions" "${repo_name}"
done
