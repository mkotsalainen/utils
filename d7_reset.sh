#!/bin/zsh

die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || die "you need give me a db name"

mysql -uroot -e "drop database if exists $1; create database $1"
cat ~/projects/d7/dump.sql | mysql -uroot $1
