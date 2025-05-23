#!/bin/bash

# URL of the M3U JSON file to download
EPG_XML_URL="https://www.tdtchannels.com/epg/TV.xml.gz"
LOCAL_EPG_XML_FILE="tv-epg.xml"

# Download function for EPG XML
download_epg_xml() {
    echo "Downloading EPG XML file from ${EPG_XML_URL}..."
    curl --compressed -s -o "${LOCAL_EPG_XML_FILE}" "${EPG_XML_URL}"
    if [[ $(file -b --mime-type "${LOCAL_EPG_XML_FILE}" ) == "application/gzip" ]]; then
      mv "${LOCAL_EPG_XML_FILE}" "${LOCAL_EPG_XML_FILE}.gz"
      gzip -d "${LOCAL_EPG_XML_FILE}"
    fi
}

# Download the EPG XML file
download_epg_xml
exit 0
