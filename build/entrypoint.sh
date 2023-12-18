#!/bin/bash

cd /home/

# source ros
source /opt/ros/humble/setup.bash

# Run the main container command
exec "$@"