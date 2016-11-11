#!/bin/bash

if [ -z $1 ]; then
	echo "USAGE: branch_diff.sh code|files branch-name";
	exit;
fi

BRANCH="$2";
MERGE_HEAD=`git rev-list --merges origin/$BRANCH  | head -1`;

if [ $1 == "code" ]; then
	git diff --color $MERGE_HEAD origin/$2;
fi

if [ $1 == "files" ]; then
	git diff --stat $MERGE_HEAD origin/$2
fi