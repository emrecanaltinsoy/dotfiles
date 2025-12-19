# Verify GH Configuration and export gpg key and ssh key to GHE
# And export Auth Token with GH CLI to use it for Yocto builds
export GH_HOST="github.com"
export GH_IS_CONNECTED=false
# Define a number of error to test
connection_error_max_retry=2
connection_error_retry=0

function test_gh_auth(){
  # Check if the connection was check today
  need_to_check=true
  # Ensure the directory exists
  mkdir -p ${HOME}/.cache/gh_connection
  if [ -f ${HOME}/.cache/gh_connection/gh_last_connection.status ]; then
    # Get the timestamp for today at 00:00:00
    checks_timestamp=$(date -d "today 00:00:00" +%s)
    . ${HOME}/.cache/gh_connection/gh_last_connection.status
    if [[ ${checks_timestamp} -eq ${previous_check} ]] && ${previous_connection_status}; then
      need_to_check=false
    fi
  fi
  if ${need_to_check}; then
    connection_status=false
    if gh auth status -h ${GH_HOST} > /dev/null 2>&1; then
      connection_status=true
    fi
    # Save status
    echo "previous_check=$(date -d "today 00:00:00" +%s)" > ${HOME}/.cache/gh_connection/gh_last_connection.status
    echo "previous_connection_status=${connection_status}" >> ${HOME}/.cache/gh_connection/gh_last_connection.status
  fi
  # Check if logged into GitHub with gh CLI
  if ${connection_status}; then
    export GH_AUTH_TOKEN=$(gh auth token -h ${GH_HOST})
    export GH_ENTERPRISE_TOKEN=${GH_AUTH_TOKEN}
    export GALAXY_GIT_TOKEN=${GH_AUTH_TOKEN}
    export GH_IS_CONNECTED=true
    if [ ! -f ${HOME}/.cache/gh_connection/gh_export_keys.configured ]; then
      test_ssh_key_on_gh
      test_gpg_key_on_gh
      touch ${HOME}/.cache/gh_connection/gh_export_keys.configured
    fi
  else
    if [[ ${connection_error_retry} -lt ${connection_error_max_retry} ]]; then
      connection_error_retry=$((connection_error_retry + 1))
      login_to_gh
    fi
  fi
}

function login_to_gh(){
  gh auth login --hostname ${GH_HOST} -s "admin:public_key" -s "admin:ssh_signing_key" -s "write:gpg_key" -p ssh --skip-ssh-key -w
  test_gh_auth
}

function test_ssh_key_on_gh(){
  # Check if SSH key is added to GitHub
  if gh ssh-key list | grep -q "$(awk '{print $1,$2}' ${HOME}/.ssh/id_ed25519.pub)"; then
    return
  else
    export_ssh_key_to_gh
  fi
}

function export_ssh_key_to_gh(){
  # Export default ssh-key to GitHub
  if [ -f ~/.ssh/id_ed25519.pub ]; then
    gh ssh-key add ${HOME}/.ssh/id_ed25519.pub --title "wsl ${HOSTNAME} ssh key"
    test_ssh_key_on_gh
  else
    echo "SSH public key ~/.ssh/id_ed25519.pub not found. Please restart deployment"
  fi
}

function test_gpg_key_on_gh(){
  # Check if GPG key is added to GitHub
  if gh gpg-key list | grep -q "$(gpg --with-colons --import-options show-only --import ${HOME}/.gnupg/default_gh_gpg.pub 2>/dev/null | grep '^pub' | awk -F: '{print $5}')"; then
    return
  else
    export_gpg_key_to_gh
  fi
}

function export_gpg_key_to_gh(){
  # Export GPG key to GitHub
  if [ -f ${HOME}/.gnupg/default_gh_gpg.pub ]; then
    gh gpg-key add ${HOME}/.gnupg/default_gh_gpg.pub
    test_gpg_key_on_gh
  else
    echo "GPG public key ~/.gnupg/default_gh_gpg.pub not found. Please restart deployment"
  fi
}

# Main script
test_gh_auth
