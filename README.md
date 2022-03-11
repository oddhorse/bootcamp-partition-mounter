bootcamp-partition-mounter
==========================

simple shell script to mount the windows bootcamp partition as writable in macos

use
---
you need [macFUSE](https://github.com/osxfuse/osxfuse) and [NTFS-3G](https://github.com/osxfuse/osxfuse/wiki/NTFS-3G) to run it and also a bootcamp partition obviously

quirks
------
ok so the way it works is it just checks for a volume mounted with the label `ntfs://<some disk id like "disk0s3">/` reported by the `mount` command. so like i only have one ntfs partition and probably most other people do too right ??? so it definitely cant handle multiple ntfs partitions, at least not in any usable way. if you are one of two people on the planet who would be hindered by this then that is just too bad i guess or you could fork it

also there arent any arguments or anything no custom volume names or verbosity levels or shit like that

license
-------
copyright (c) oddhorse all rights reserved etc gpl v3 read the copying file if you must
