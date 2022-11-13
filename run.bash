#!/usr/bin/env bash

script_path=$(dirname $(realpath "$0"))
repositories_path="$script_path/.."

repositories=(
    "drink.water"
    "look.away"
    "stand.up"
)

function download() {
    repo_name=$1
    
    (cd "$repositories_path"; wget -qO- "https://raw.githubusercontent.com/cobrinhas/$repo_name/master/DOWNLOAD" | bash)
}

function install() {
    repo_name=$1

    (cd "$repositories_path/$repo_name"; exec INSTALL)
}

for repo_name in ${repositories[@]}; do
  download $repo_name
  install $repo_name
done