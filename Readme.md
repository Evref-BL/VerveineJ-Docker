# VerveineJ Dockerfile

This docker file configure VerveineJ to be used with local system

It automatically use VerveineJ with the good Java version.

## Command line

To run this docker, first separate the sources and the dependency in two differents folder.
Then execute the following command:

```sh
docker pull badetitou/verveinej:v3.0.0
docker run -v <full/path/toSource>:/src -v [<full/path/toDependency>:/dependency] badetitou/verveinej:v2.0.4 <verveineJOption> .
```

### Example

Basic example using docker desktop

```sh
docker run -v D:\Users\benoit.verhaeghe\Documents\git\badetitou\Carrefour\testing\src\:/src badetitou/verveinej:v3.0.0 -format json -o testoutput.json .
```

Another example with docker in Window **without** docker desktop but with docker in wsl2 (see [this blog post](https://dev.to/_nicolas_louis_/how-to-run-docker-on-windows-without-docker-desktop-hik))

```sh
docker run --rm -v "/mnt/d/Developpement/git/evol-critics:/src" badetitou/verveinej:v2.0.4 -Xmx16g -- -format json -alllocals -anchor assoc -o output.json .
```
