#!/bin/bash

channels=(
  'https://www.youtube.com/@sofiaisella/videos'
  'https://www.youtube.com/@parispaloma/videos'
  'https://www.youtube.com/@LilithMax/videos'
  'https://www.youtube.com/@ellared/videos'
  'https://www.youtube.com/@jananikjha/videos'
  'https://www.youtube.com/@GracieAbrams/videos'
  'https://www.youtube.com/@OliviaRodrigo/videos'
  'https://www.youtube.com/@TaylorSwift/videos'
)

for channel in "${channels[@]}"; do
  echo "Starte: $channel"

  yt-dlp \
    --ignore-errors \
    --download-archive "downloaded.txt" \
    --match-filter 'title ~= "(?i)(Official Music Video|Official Video|Music Video)"' \
    -f 'bv*+ba/b' \
    --merge-output-format mp4 \
    --embed-thumbnail \
    --embed-metadata \
    --no-write-thumbnail \
    -o '%(uploader)s/%(title)s/%(title)s.%(ext)s' \
    "$channel"
done
