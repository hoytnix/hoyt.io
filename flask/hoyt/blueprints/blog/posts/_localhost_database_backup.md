Localhost Database Disaster Recovery
====================================

## (Or, that time I lost my local database.)

I accidentally deleted my website's entire database while debugging and Docker container and removing all dangling volumes. Oops. Luckily, there were only two rows, which were easily reproducible. However, this prompted me to begin researching how to manage disaster recovery for my localhost server. The idea had never occurred to me before, "Why should I perform proper disaster recovery like a datacenter when I already backup all my files and settings?" Well, unfortunately during debugging it happened to me, and now hopefully it won't happen to anyone else who reads this.

The most seemingly simple way to backup your local Postgres database is with a chronjob which starts the Docker service, and dumps the desired table to a volume.

[TODO: Look into logging with Docker, and using a 3rd-party webservice to view logs.]
