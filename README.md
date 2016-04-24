# Build DynomiteDB meta package for Ubuntu

The `build-dynomitedb` container generates a simple meta package for Ubuntu. In other words, this container creates a simple `.deb` package that installs all other DynomiteDB packages, such as Dynomite, Redis and the Backends.

Compiling Dynomite has one discrete steps:

1. Build the `build-dynomitedb` Docker image (automated via DockerHub)

# Create the DynomiteDB package

Run the `build-dynomitedb` container to create the DynomiteDB meta package.

## Options

`build-dynomite` supports optional flags:

- `-v tag-version`: Specify a version.

Build DynomiteDB as shown below.

```bash
docker run -it --rm -v $PWD:/src dynomitedb/build-dynomitedb -v 0.5.8
```

# Manually build the `build-dynomitedb` image

The `build-dynomitedb` Docker image is automatically built via DockerHub at https://hub.docker.com/r/dynomitedb/build-dynomitedb.

The instructions below allow you to manually build the `build-dynomitedb` image, if required.

Clone the `docker-build-dynomitedb` repo from Github.

```bash
mkdir -p ~/repos/ && cd $_

git clone https://github.com/DynomiteDB/docker-build-dynomitedb.git
```

`cd` into the `build-dynomitedb` directory.

```bash
cd ~/docker-build-dynomitedb
```

Create the `build-dynomitedb` image.

```bash
docker build -t dynomitedb/build-dynomitedb .
```
