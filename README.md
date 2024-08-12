# Blazegraph-CORS-Docker
A Blazegraph (RDF-Store) for storing/serving semantic graph data with a SPARQL REST API with CORS enabled. 

## Links
- Original work : https://blazegraph.com/
- Sources : https://github.com/phenoscape/blazegraph-docker
- Images published on [Docker hub](https://hub.docker.com/r/vcity/blazegraph-cors).

## Options

Set $BLAZEGRAPH_QUADS environment variable to "true" to activate the Quads mode (! check the [Blazegraph Quads mode limitations](https://github.com/blazegraph/database/wiki/Blazegraph_FAQ) !)

## Modifications from source:
**Dockerfile:**
- Added new authors
- Added blazegraph.properties
- Added su-exec
- Added blazegraph-quads.properties

**blazegraph.properties:**
- A properties file with default parameters to initialize Blazegraph

**blazegraph-quads.properties:**
- A properties file with default parameters to initialize Blazegraph in quads mode

**entrypoint.sh**
- use su-exec to launch Blazegraph

**Makefile:**
- Removed the Makefile
