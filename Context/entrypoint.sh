#!/bin/bash

addgroup --system --gid $BLAZEGRAPH_GID blazegraph
adduser --system --shell /bin/false --no-create-home --uid $BLAZEGRAPH_UID blazegraph
adduser blazegraph blazegraph

# Make sure permissions are good
chown -R blazegraph:blazegraph $BLAZEGRAPH_RW_PATH
chown -R blazegraph:blazegraph /data

sed "s/@@TIMEOUT@@/$BLAZEGRAPH_TIMEOUT/" $BLAZEGRAPH_RW_PATH/readonly_cors.tmp.xml | sed "s/@@READONLY@@/$BLAZEGRAPH_READONLY/" >/data/readonly_cors.xml

# If quads environment variable is set, then we need to use the blazegraph-quads.properties file
# Otherwise, we use the blazegraph.properties file
if [ "$BLAZEGRAPH_QUADS" = "true" ]; then
    echo "Starting Blazegraph in quad mode."
    mv /data/blazegraph-quads.properties /data/blazegraph.properties
else
    echo "Starting Blazegraph in triple mode."
fi

su-exec blazegraph:blazegraph \
    java -Xmx$BLAZEGRAPH_MEMORY \
    -Dfile.encoding=UTF-8 \
    -Djetty.port=8080 \
    -Djetty.overrideWebXml=readonly_cors.xml \
    -Dbigdata.propertyFile=blazegraph.properties \
    -Dorg.wikidata.query.rdf.tool.rdf.RdfRepository.timeout=3600000 \
    -Dorg.wikidata.query.rdf.tool.wikibase.WikibaseRepository.timeout=3600000 \
    -Djetty.start.timeout=3600000 \
    -cp $BLAZEGRAPH_RW_PATH/blazegraph.jar:$BLAZEGRAPH_RW_PATH/jetty-servlets-9.2.3.v20140905.jar \
    com.bigdata.rdf.sail.webapp.StandaloneNanoSparqlServer
