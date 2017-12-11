#!/bin/bash

set -euo pipefail

function main
{
  #local profile=$(dconf read /org/mate/terminal/global/default-profile)
  local profile="solarized-dark"

  for key in "foreground-color" "visible-name" "palette" "use-system-font" "use-theme-colors" "font" "bold_color_same_as_fg" "bold-color" "background-color"
  do
    value=$(get_value "$profile" "$key")
    dumpCommand "$profile" "$key" "$value"
  done
}

function get_value
{
  dconf read /org/mate/terminal/profiles/$1/$2
}

function dumpCommand
{
  echo "dconf write /org/mate/terminal/profiles/$1/$2 $3"
}

main $@
