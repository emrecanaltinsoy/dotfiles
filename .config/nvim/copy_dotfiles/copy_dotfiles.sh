#!/usr/bin/env bash
. config.sh

main() {
  declare -A _clean_list
  for i in "${!confedit_list[@]}"; do
    [[ -f ${confedit_list["${i}"]} ]] && _clean_list["${i}"]=${confedit_list["${i}"]}
  done
 
  for i in "${!_clean_list[@]}"; do
    mkdir -p $symlink_dir #/$i
    
    file_name=(${_clean_list[$i]//// })
    
    if [[ -L "$symlink_dir/${i}_${file_name[-1]}" ]]; then
      echo "$i symlink exists!"
    else
      ln -s ${_clean_list[$i]} $symlink_dir/${i}_${file_name[-1]}
      echo "$i symlink created!"
    fi
  done
  echo "DONE!!" && exit 0
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
