#!/bin/zsh

exec ctags -f .tags \
-h ".php" -h ".py" -R \
--exclude="\.svn" \
--exclude="\.git" \
--totals=yes \
--tag-relative=yes \
--PHP-kinds=+cf \
--regex-PHP='/abstract class ([^ ]*)/\1/c/' \
--regex-PHP='/interface ([^ ]*)/\1/c/' \
--regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'
