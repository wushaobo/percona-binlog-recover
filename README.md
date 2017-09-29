# percona-binlog-recover
Help developers with Mac OS X to recover the mysql snapshot created by percona xtrabackup.

# Why
The mysql snapshot created by percona-xtrabackup needs two steps to recover to a new datatbase:
1. decompress from tar.gz to folder.
2. apply binlog.

The second step requires percona-xtrabackup in command, which is not provided on mac.

# Idea
The idea is to start a docker container with percona-xtrabackup inside and share disk volumn with host, apply binlog in container and tear down the container for the host.

# Run

Checkout the `apply_mysql_binlog.sh` as executable and run it.

```
Usage: apply_mysql_binlog.sh /ABSOLUTE/PATH/TO/MYSQL_SNAPSHOT/FOLDER
```