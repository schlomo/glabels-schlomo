# glabels-schlomo
[gLabels](http://glabels.sourceforge.net/) Template Definitions maintained by Schlomo

## Building and Installing

To build the DEB package you need `sudo apt-get install glabels-data devscripts git-buildpackage make`. Run `make` to build the DEB package, it will also validate the XML against the DTD from gLabels.

After committing all changes, run `make release` to create a new release.
