#!/bin/bash
curl -s $SITEMAP | grep "<loc>" | awk -F"<loc>" '{print $2} ' | awk -F"</loc>" '{print $1}' > list.txt

if [ "$CONVERTTOHTTP" = "true" ]; then
   echo "Convrting to https"
   sed -i 's|https://|http://|g' /list.txt
fi


siege -c1 -f list.txt
exit 0