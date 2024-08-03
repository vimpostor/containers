FROM docker.io/library/archlinux:base

RUN pacman -Syu --noconfirm soju

RUN printf 'db sqlite3 /var/lib/soju/main.db\nmessage-store fs /var/lib/soju/logs/\nlisten irc+insecure://0.0.0.0:6668\nfile-upload fs /var/lib/soju/uploads/\n' > /etc/soju/config

CMD soju --config /etc/soju/config
