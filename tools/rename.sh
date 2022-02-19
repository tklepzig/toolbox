start=1
for file in *.mp3; do
  new=$(printf "%02d.mp3" "$start") #02 pad to length of 2
  echo "Renaming $file to $new"
  #mv -i -- "$file" "$new"
  let start=start+1
done
