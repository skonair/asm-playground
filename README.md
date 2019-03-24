= Linux assembler development in an alpine docker image

== Start an alpine linux in docker:

  $ docker build . -t linux-asm
  $ docker run -v /path/to/volume001:/vol -it --rm linux-asm /bin/ash

The docker options are:

- /bin/ash is Ash (Almquist Shell) provided by BusyBox
- --rm Automatically remove the container when it exits (docker run --help)
- -i Interactive mode (Keep STDIN open even if not attached)
- -t Allocate a pseudo-TTY


