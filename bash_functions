#!/bin/bash

bsh () {
  pyenv exec python -c "import blurhash; print(blurhash.encode('$1', 4, 3))"
}

datomic () {
  local datomic_version=""
  case "${1}" in
    pro)  datomic_version="pro"  ;;
    free) datomic_version="free" ;;
    *) echo >&2 "${1}: invalid datomic version, use 'free' or 'pro'"; return -1
  esac

  local default_datomic_protocol=""
  if [[ "${datomic_version}" == "pro" ]]; then
    default_datomic_protocol="dev"
  else
    default_datomic_protocol="free"
  fi

  local custom_datomic_dir=""
  if [[ "${datomic_version}" == "pro" ]]; then
    custom_datomic_dir="${DATOMIC_PRO_DIR}"
  else
    custom_datomic_dir="${DATOMIC_FREE_DIR}"
  fi

  local default_datomic_dir=(~/.local/datomic-${datomic_version}-*)
  local default_dev_uri="datomic:${default_datomic_protocol}://localhost:4334/"

  local datomic_dir="${custom_datomic_dir:-${default_datomic_dir}}"
  local datomic_config_dir="${XDG_CONFIG_HOME:-"${HOME}/.config"}/datomic-${datomic_version}"
  local datomic_data_dir="${datomic_dir}/data"

  local transactor_properties="${datomic_config_dir}/transactor.properties"
  local console_aliases="${DATOMIC_CONSOLE_ALIASES:-"dev ${default_dev_uri}"}"
  local console_args="-p 8080 ${console_aliases}"

  local command="${2:-help}"
  local args="${@:3}"

  if [[ ! -d "${datomic_dir}" ]]; then
    echo "Datomic not found. Access https://www.datomic.com/get-datomic.html and download the latest pro version." \
      >&2
    return -1
  else
    case "${command}" in
      info)
        echo "datomic_dir        ${datomic_dir}"
        echo "datomic_config_dir ${datomic_config_dir}"
        echo "console_args       ${console_args}"
        ;;
      config)
        mkdir -p "${datomic_config_dir}"
        if [[ ! -f "${transactor_properties}" ]]; then
          echo "creating ${transactor_properties}"
          cp -f "${datomic_dir}/config/samples/${default_datomic_protocol}-transactor-template.properties" \
                "${transactor_properties}"
        else
          echo "${transactor_properties} already exists."
        fi
        ;;
      dir)
        echo "${datomic_dir}"
        ;;
      uri)
        echo "${default_dev_uri}"
        ;;
      transactor)
        if [[ ! -f "${transactor_properties}" ]]; then
          echo "${transactor_properties}: not found, run 'datomic config'" >&2
          return -1
        else
          "${datomic_dir}"/bin/transactor "${args:-${transactor_properties}}"
        fi
        ;;
      console)
        "${datomic_dir}"/bin/console ${args:-${console_args}}
        ;;
      restore-db)
        echo "INFO: :dev and :free storages require a running transactor."
        echo "INFO: use \$JAVA_OPTS to set -Xms and -Xmx recommend by datomic."
        echo "WARN: The following directory will be REMOVED!"
        echo "    ${datomic_data_dir}"
        read -p " Are you sure? [y/N] " -r
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
          echo "INFO: Aborted."
          return 1
        else
          echo "INFO: Removing data dir..."
          rm -rf "${datomic_data_dir}"
          echo "INFO: :dev and :free storages requires a running transactor."
          read -p " Start ${datomic_version} transactor now? [Y/n] " -r
          if [[ ${REPLY:-y} =~ ^[Yy]$ ]]; then
            echo "INFO: Starting transactor in background..."
            datomic ${datomic_version} transactor &
            sleep 7
          fi
          echo "INFO: Restoring..."
          "${datomic_dir}"/bin/datomic ${JAVA_OPTS} restore-db ${args}
        fi
        ;;
      *) echo "Usage: datomic pro|free <command> [<args>]"
         echo ""
         echo "COMMANDS"
         echo "  help        print this message"
         echo "  config      copy config template to \$XDG_CONFIG_HOME/datomic"
         echo "  dir         print datomic directory and exit"
         echo "  uri         print dev transactor uri without database name and exit"
         echo "  transactor  start datomic transacator"
         echo "  console     start datomic console"
         echo "  restore-db  runs 'datomic restore-db'"
         echo
    esac
  fi
}

scd () {
  cd ${PWD/$1/$2}
}

npm_exec () {
  ./node_modules/.bin/$@
}

mvn- () {
  local working_dir="${MVN_WORKING_DIR:-${PWD}}"
  local dockerfile="${MVN_DOCKERFILE:-mvn.dockerfile}"
  local run_opts="${MVN_RUN_OPTS:-}"
  local image=""

  if [[ ! -f "${working_dir}/${dockerfile}" ]]; then
    echo "${working_dir}/${dockerfile}: Dockerfile not found, using maven:alpine"
    image="maven:alpine"
  else
    echo "${working_dir}/${dockerfile}: building..."
    image="$(docker build "${working_dir}" -f ${dockerfile} -q | cut -d':' -f2)"
  fi

  docker run --rm -it \
             -v "${working_dir}":/usr/src/mymaven \
             -v "$HOME/.m2":/root/.m2 \
             ${MVN_RUN_OPTS} \
             "$image" \
             mvn "$@"
}

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
