usage() {
  echo "${0} usage:" && rg -N --color never ".\)\s#" "${0}"
  exit 0
}

[ $# -eq 0 ] && usage

custom_text="example"
custom_width="80"
custom_font=""
custom_justification=""

while getopts :ht:w:f:d:clr option; do
  case "${option}" in
  t) # Custom text is required to display anything
    custom_text=${OPTARG}
    ;;
  w) # Allow for the width of the figlet to be defined too
    custom_width=${OPTARG}
    ;;
  f) # Allow for a custom font to be defined too. This disables iterating
    custom_font=${OPTARG}
    ;;
  d) # Allow for font directory
    custom_font_dir=${OPTARG}
    ;;
  c | l | r) # Allow for justification
    custom_justification=${option}
    ;;
  h | *) # Display help
    usage
    ;;
  esac
done

# Get all the FIGlet fonts from the directory of FIGlet fonts
font_ext='flf'
font_directory="$(figlet -I 2)"

if [[ -n $custom_font_dir ]]; then
  font_directory="${custom_font_dir}"
fi

if [ -z "${custom_font}" ]; then
  # Get a list of all the FIGlet fonts by name
  IFS=$'\n'
  for font_path in $(fd . "${font_directory}" --extension "${font_ext}" --exec basename | sort); do
    # Iterate on each font based on the text input
    # shellcheck disable=SC2030
    output_font=$(
      figlet "-${custom_justification:=x}" \
        -d "${font_directory}" \
        -w "${custom_width:-}" \
        -f "${font_path}" \
        "${custom_text}" \
        2>/dev/null
    )
    if [ -n "${output_font}" ]; then
      echo "Font name: ${font_path}"
      echo
      echo "${output_font}"
      printf "\n\n\n\n\n"
    fi
  done
  unset IFS
else
  printf "\n"
  # shellcheck disable=SC2031
  figlet "-${custom_justification:=x}" \
    -d "${custom_font_dir}" \
    -w "${custom_width:-}" \
    -f "${custom_font}" \
    "${custom_text}"
fi
