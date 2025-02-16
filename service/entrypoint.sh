#!/bin/bash

set -Eeuo pipefail
declare -A MOUNTS

# mount folders
MOUNTS["/ComfyUI/input"]="/volumes/input"
MOUNTS["/ComfyUI/output"]="/volumes/output"
MOUNTS["/ComfyUI/custom_nodes"]="/volumes/custom_nodes"
MOUNTS["/ComfyUI/models"]="/volumes/models"
MOUNTS["/ComfyUI/user"]="/volumes/user"

# make symbolik link and copy target dir under the files.
for to_path in "${!MOUNTS[@]}"; do
  set -Eeuo pipefail
  from_path="${MOUNTS[${to_path}]}"
  if [ ! -f "$from_path" ]; then
    mkdir -vp "$from_path"
  fi
  if [ -d "$to_path" ]; then
    to_path_file="${to_path}/*"
    if [ -n "$(ls $to_path_file > /dev/null)" ]; then
      cp -f -p -r $to_path_file $from_path > /dev/null 
    fi
  fi
  rm -r -f "${to_path}"
  mkdir -vp "$(dirname "${to_path}")"
  ln -sT "${from_path}" "${to_path}"
  echo Mounted $(basename "${from_path}")
done

exec "$@"
