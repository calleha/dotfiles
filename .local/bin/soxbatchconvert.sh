for f in *.wav; do
    sox "$f" "converted/${f%.flac}.flac"
done
