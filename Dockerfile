FROM archlinux-yay:latest

ARG UID=1000
ARG PASSWORD

MAINTAINER arlechann<dragnov3728@gmail.com>

RUN useradd -u $UID -m -G wheel -s /bin/bash dev
RUN echo -en "$PASSWORD\n$PASSWORD\n" | passwd dev
RUN sed -i -E 's/^# (%wheel ALL=\(ALL\) ALL)/\1/' /etc/sudoers

USER dev
WORKDIR /home/dev
CMD ["/bin/bash"]
