#!/bin/bash

user="$1"
home_directory=$(getent passwd "$user" | cut -d: -f6)
shell=$(getent passwd "$user" | cut -d: -f7)

echo $user
echo $home_directory
echo $shell
