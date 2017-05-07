# Docker images for TeXlive and Pillar book

**What is this for:** spawning Docker containers with prerequisites
for [TeXLive][], [Pharo][], and [Pillar][] installed.

This repo defines **three docker images** based on Ubuntu Xenial and including
progressive amounts of stuff. Docker can fetch pre-built images
from [Docker Hub: `dpollet/texlive`][dockerhub].

- `dpollet/texlive:base` (defined in `base/Dockerfile`) includes a few tools
  (Make, Latexmk…) and a partial_ish_ TeXlive distribution that is able to build
  the sample LaTeX documents that come with the [SBAbook LaTeX class][sbabook].

- `dpollet/texlive:full` extends the previous image to a full-blown TeXlive
  distribution.

- `dpollet/texlive:pillar` includes additional system dependencies required to
  install and run [Pharo][] and [Pillar][]. Beware: this image does not include
  *the Pharo VM or the Pillar image*, most projects install specific versions
  locally as part of the build process.


## Principle of operation

Your LaTeX / Pillar project resides on your host machine; doesn't matter if you
start it from scratch or clone it from GitHub.

    cd path/to/project/

Spawn a Docker component from the image. All the images have a `/work` volume
where you can map a directory of your host machine; the build can then run your
build command inside the container, but accessing your working files:

    docker run --rm --tty --interactive --volume $PWD:/work dpollet/texlive:pillar COMMAND

Here `COMMAND` could be `latexmk`, `make`, or whatever command you want to run
on your project. If you want to open a shell in the container, make it `bash`.

Beware, since the container is Ubuntu and the host is most probably a different
system (CentOS, macOS or Windows). You *will* run into problems if you mix build
commands between the container and the host. For instance, the `download.sh`
script in many Pillar projects will fetch a VM which will only run on one side.


## Building the images locally

Shown here for the `pillar` variant, but also works with `base` or `full`:

    docker build -t texlive pillar

or via Make, which should use the same names as the images from [DockerHub][]:

    make all
    make image-pillar
    make build -e DIR=pillar

[sbabook]: https://github.com/cdlm/sbabook
[sba]: https://github.com/SquareBracketAssociates

[dockerhub]: https://hub.docker.com/r/dpollet/texlive/
[texlive]: http://tug.org/texlive
[pharo]: http://pharo.org
[pillar]: https://github.com/pillar-markup
