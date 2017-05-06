# Docker images for TeXlive and reproduceable book builds

Made primarily for the [SBAbook class][sbabook] and the books
from [Square Bracket Associates][sba] that use it.

[sbabook]: https://github.com/cdlm/sbabook
[sba]: https://github.com/SquareBracketAssociates

This thing allows for to build a container with all
prerequisites for *TexLive* and *Pharo* installed.

Idea is to clone the book repo on the host and get into an container
to build the book.

There is a `/work` volume that can be mapped onto the host with the
docker run's -v command.

Then just use `./download.sh` in there to install Pharo and pillar in
the container. Do not do that in the host or you'll end up with wrong
versions (like my host is CentOS and the container is Ubuntu, even
worse with host is macOS or Windows).

Then `make book`should give a PDF book in `build/`
There is a `make wipeout` command that obliterates the `build` folder
for good so you can start clean. No harm done on your files.

There is a script in `base/` to build the docker image.
