#!/usr/bin/env bash

#
# Add 3 members to each cluster
#
clusters="myhz1 myhz2 wan1 wan2"
for i in $clusters; do
   cluster_count=$(show_cluster -no-color -cluster $i | grep "Members Running" | awk '{print $3}' | sed 's/^.*\///')
   count=$((3-$cluster_count))
   if [ $count -gt 0 ]; then
      add_member -cluster $i -count $count
   fi
done
