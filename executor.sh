#!/bin/bash
curl -s $SITEMAP | grep "<loc>" | awk -F"<loc>" '{print $2} ' | awk -F"</loc>" '{print $1}' > list.txt
siege -c1 -f list.txt