start=1
ext="mp3"
for file in *.$ext; do
  new=$(printf "%02d.$ext" "$start") #02 pad to length of 2
  echo "Renaming $file to $new"
  #mv -i -- "$file" "$new"
  let start=start+1
done
