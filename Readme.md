# VerveineJ Dockerfile

This docker file configures VerveineJ to be used with the local system

It automatically uses VerveineJ with the good Java version.

## Command line

To run this docker, first, separate the sources and the dependency into two different folders.
Then execute the following command:

```sh
docker pull ghcr.io/evref-bl/verveinej:latest
docker run -v <full/path/toSource>:/src [-v <full/path/toDependency>:/dependency] ghcr.io/evref-bl/verveinej:latest <verveineJOption> -autocp ../dependency .
```

Note1: The option `-v <full/path/toDependency>:/dependency` binds (or mounts) a directory on the host computer to the `dependency` directory in the docker virtual machine.
For VerveineJ to use it, it must receive the option: `-autocp ../dependency`.

Note2: Similarly `-v <full/path/toSource>:/src` (`-v` for `-volume`) binds a directory on the host computer to the `src` directory in the docker virtual machine.
VerveineJ in the docker image runs inside this `src` directory. Therefore, and because of the `.` at the end of the command, it parses any Java file in `src`.

### Example

Basic example using docker desktop

```sh
docker run --rm -v D:\Users\benoit.verhaeghe\Documents\git\badetitou\Carrefour\testing\src\:/src ghcr.io/evref-bl/verveinej:latest -format json -o testoutput.json .
```

Another example with docker in Window **without** docker desktop but with docker in wsl2 (see [this blog post](https://dev.to/_nicolas_louis_/how-to-run-docker-on-windows-without-docker-desktop-hik))

```sh
docker run --rm -v "/mnt/d/Developpement/git/evol-critics:/src" ghcr.io/evref-bl/verveinej:latest -Xmx16g -- -format json -alllocals -anchor assoc -o output.json .
```

## GitLab example

> Todo

## GitHub example

> Todo
