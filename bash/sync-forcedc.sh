#!/bin/bash

# provided by Marcin Szreder, 13.06.2022
# updated by David Frantz, 18.11.2022, 25.06.2023



function copy_tile(){
  dir=$(basename $1)
  source='/data/force-dc/C1/ard/'"$dir"'/'
  destination='/data/publish/FORCE-C1-L2/FORCE/C1/L2/ard/'"$dir"
  echo $source $destination;
  rsync -r --omit-dir-times --info=progress2 --size-only $source $destination
}
export -f copy_tile


ls -d /data/force-dc/C1/ard/X* | parallel copy_tile {}


for d in report log provenance; do
  source="/data/force-dc/C1/$d"
  destination="/data/publish/FORCE-C1-L2/FORCE/C1/L2/"
  rsync -r --omit-dir-times --info=progress2 --size-only  $source $destination
done

exit 0
