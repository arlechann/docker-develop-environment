FROM archlinux-yay:latest

ARG UID=1000

MAINTAINER arlechann<dragnov3728@gmail.com>

USER root
RUN useradd -u $UID -m -G wheel -s /bin/bash dev
RUN passwd -d dev
RUN sed -i -E 's/^# (%wheel ALL=\(ALL\) ALL)/\1/' /etc/sudoers

USER dev
WORKDIR /home/dev
CMD ["/bin/bash"]
