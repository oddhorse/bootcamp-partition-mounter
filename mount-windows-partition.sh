#!/bin/sh

#    mounts the bootcamp partition on a hd
#    copyright (c) 2022  oddhorse
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.


# grab disk id for ntfs drive
mount=$(mount)

disk_path=$(echo $mount | grep -o "ntfs:\/\/disk[s0-9]*\/")

if [ $? ]; then
    echo "heyyyy you have a windows disk i think!"
else
    echo "hey no windows disk"
    exit 1
fi

disk_id=$(echo $disk_path | sed "s/.*ntfs:\/\/*\(disk[s0-9]*\)\/.*/\1/")

echo "windows disk is $disk_id"

# check if $disk_id is already mounted somewhere

if  echo $mount | grep -q "\/dev\/${disk_id}"; then
    echo "hey its already mounted ok"
    exit 2
else
    echo "heyyy its not mounted ok"
fi

# check if /Volumes/win exists

if [ -d "/Volumes/win" ]
then
    echo "/Volumes/win already exists!!! no need to make one..."
else
    echo "/Volumes/win does not exist oh no oh no i am making it right now"
    mkdir /Volumes/win
fi


# final command:
sudo /usr/local/bin/ntfs-3g $disk_id /Volumes/win -o local -o allow_other -o auto_xattr -o auto_cache

echo "done im done! mounted your windows fs at /Volumes/win"

open /Volumes/windows
