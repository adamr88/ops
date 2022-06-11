for i in /etc/profile.d/kali/*; do
    if [ -r "$i" ]; then
        . $i
    fi
done
