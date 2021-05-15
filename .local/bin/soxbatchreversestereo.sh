for f in *.flac; do
    sox "$f" "fixed/${f%.flac}.flac" swap
done
