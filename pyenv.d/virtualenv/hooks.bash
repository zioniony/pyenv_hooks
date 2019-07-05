after_hooks=("prepare_local_pyvenv")


prepare_local_pyvenv() {
  echo "start prepare_local_pyvenv"

  if [ "$STATUS" == "0" ] && [ -n $PYENV_DIR ]; then
    test -f "$PYENV_DIR/.python-version" || echo $VIRTUALENV_NAME > "$PYENV_DIR/.python-version" && echo $VIRTUALENV_PATH > "$PYENV_DIR/.venv"
  fi

  echo "done prepare_local_pyvenv"
}
