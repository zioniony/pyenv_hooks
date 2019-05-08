#before_hooks=("install_common_dev")
after_hooks=("install_common_dev")

modify_ipython_version() {
  if [ "${VERSION_NAME:0:1}" -lt "3" ]; then
    ipython_version="<6.0"
  elif [ "${VERSION_NAME:2:1}" -lt "5" ]; then
    ipython_version="<7.0"
  else
    ipython_version=""
  fi
  sed -e "s/ipython/ipython$ipython_version/" "$@"
}

install_common_dev() {
  echo "start install common development dependencies"

  if [ "$STATUS" == "0" ]; then
    PIPEXEC="${PYENV_ROOT}/versions/${VERSION_NAME}/bin/pip"
	REQUIREMENT="`dirname $BASH_SOURCE`/requirements.txt"
	if [ -x "$PIPEXEC" ]; then
        modify_ipython_version "$REQUIREMENT" | "$PIPEXEC" install --upgrade
	fi
  fi

  echo "done install common development dependencies"
}
