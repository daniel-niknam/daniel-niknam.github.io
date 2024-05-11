#!/usr/bin/env ruby

post_file_path = ARGV[0]
post_file_name = File.basename(post_file_path)
post_file_ext = File.extname(post_file_path)
post_file_without_ext = File.basename(post_file_path, post_file_ext)

# puts post_file_path.inspect
# puts post_file_name.inspect
# puts post_file_ext.inspect
# puts post_file_without_ext.inspect


puts
puts "Converting #{post_file_without_ext} to audio"
puts


system(<<-BASH)
#!/usr/bin/env bash

title=$(cat #{post_file_path} | grep "title:" | awk '{gsub("title: ", "", $0); print}')
description=$(cat #{post_file_path} | grep "description:" | awk '{gsub("description: ", "", $0); print}')
content=$(pandoc -f markdown -t plain --wrap=none #{post_file_path})
credit="Thanks for listening. Title of this post is $title, $description, and is licensed under CC BY-SA. Read and listen to more content in my website: niknam.org.\nThis audio is generated using Piper voice generator project. Background music is from Calm Morning by PianoAmor from pixabay.com."

echo "$title.\n$description.\n$content\n$credit" \
  | awk '{gsub("{.*}", "", $0); print}' \
  | awk '{gsub("^[ ]*", "", $0); print}' \
  | piper \
    --model ~/Projects/piper-voices/en_US-hfc_female-medium.onnx \
    --config ~/Projects/piper-voices/en_US-hfc_female-medium.onnx.json \
    --output_file assets/posts/#{post_file_without_ext}.wav
BASH

puts
puts "Adding music to #{post_file_without_ext}"
puts

system(<<-BASH)
ffmpeg -y \
  -i assets/posts/#{post_file_without_ext}.wav \
  -stream_loop -1 -i ~/Projects/music/calm/calm-morning-125568.mp3 \
  -filter_complex "[1:a]adelay=1000|1000:all=1[bg];[0:a][bg]amix=inputs=2:duration=shortest:dropout_transition=2:weights=1 0.3"  \
  -c:a libmp3lame \
  -q:a 4 \
  assets/posts/#{post_file_without_ext}-with-music.mp3
BASH

puts
puts "Optimising #{post_file_without_ext}"
puts

system(<<-BASH)
ffmpeg -y \
  -i assets/posts/#{post_file_without_ext}-with-music.mp3 \
  -vn -ar 44100 -ac 2 -b:a 96k \
  assets/posts/#{post_file_without_ext}.mp3
BASH

puts
puts "Cleaning up"
puts


system(<<-BASH)
rm assets/posts/#{post_file_without_ext}-with-music.mp3 \
  && rm assets/posts/#{post_file_without_ext}.wav
BASH

puts
puts "Done"
puts
