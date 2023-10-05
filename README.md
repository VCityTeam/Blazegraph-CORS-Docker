# Blazegraph-CORS-Docker
RDF-Store for storing/serving semantic graph data with a SPARQL REST API with all CORS. 

## Links
- Original work : https://blazegraph.com/
- Sources : https://github.com/phenoscape/blazegraph-docker
- Images published on [Docker hub](https://hub.docker.com/r/vcity/blazegraph-cors).

## Modifications :
**Dockerfile:**
- Added new authors,
- Added blazegraph.properties

**blazegraph.properties:**
- Created this new properties file to enable CORS

**Makefile:**
- Removed the Makefile
