#!/usr/bin/env bash

#
# This script initializes the bundle environment. It must be sourced in with 
# a workspace name as the first argument.
#

# Workspace name passed in by 'install_bundle'
WORKSPACE="$1"

ERROR_OCCURED="false"
if [ "$WORKSPACE" == "" ]; then
   echo >&2 "ERROR: Workspace not specified. The first argument must be the target workspace name. Command aborted."
   ERROR_OCCURED="true"
fi

if [ "$ERROR_OCCURED" == "false" ]; then
   FOUND="false"
   WORKSPACES=$(list_workspaces)
   for i in $WORKSPACES; do
      if [ "$i" == "$WORKSPACE" ]; then
         FOUND="true"
      fi
   done

   if [ "$FOUND" == "false" ]; then
      echo >&2 "ERROR: Specified workspace not found in the current RWE [$WORKSPACE]. Command aborted."
      ERROR_OCCURED="true"
   fi
fi

if [ "$ERROR_OCCURED" == "false" ]; then
   switch_workspace $WORKSPACE

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

   # Build perf_test app - downloads required binaries
   cd_app perf_test/bin_sh
   ./build_app
   
   echo ""
   echo "Bundle workspace initialization complete [$WORKSPACE]."
   echo ""
fi
