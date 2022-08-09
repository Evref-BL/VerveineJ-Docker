# VerveineJ Dockerfile

This docker file configure VerveineJ to be used with local system

It automatically use VerveineJ with the good Java version.

## Command line

To run this docker, first separate the sources and the dependency in two differents folder.
Then execute the following command:

```sh
docker run -v <full/path/toSource>:/src -v [<full/path/toDependency>:/dependency] verveinej:v2.0.4 <verveineJOption> .
```

### Example

docker run -v D:\Users\benoit.verhaeghe\Documents\git\badetitou\Carrefour\testing\src\:/src verveinej:v2.0.4 -format json -o testoutput.json .
