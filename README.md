# Linux assembler development in an alpine docker image

Refreshing/learning assembler development on Linux with the really nice book 'Assembly Language Step-by-Step' from Jeff Duntemann.

## Start an alpine linux in docker:

```shell
  $ docker build . -t linux-asm
  $ docker run -v `pwd`/vol:/vol -it --rm --cap-add=SYS_PTRACE --security-opt seccomp=unconfined linux-asm /bin/ash
```

To run the gdb debugger we need to bypass several docker security options. So this configuration must only be used as a local development environment.
The docker options are:

- -v bind mount the local volume `pwd`/vol to the container directory /vol
- -i Interactive mode (Keep STDIN open even if not attached)
- -t Allocate a pseudo-TTY
- --rm Automatically remove the container when it exits (docker run --help)
- --cap-add=SYS_PTRACE Allow container users to trace syscalls from their own processes. Required for debugging with gdb
- --security-opt seccomp=unconfined The default docker seccomp profile whitelists system calls. For debugging with gdb we need more, so we use all. This is usually a security breach. Please don't do it on a production docker.
- /bin/ash is Ash (Almquist Shell) provided by BusyBox


