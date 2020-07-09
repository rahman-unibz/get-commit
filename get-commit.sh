#!/bin/sh
satd=$1
echo "comment is: "$satd
gitlog="$(git log -S "${satd}" --oneline)"
gitlogNum="$(git log -S "${satd}" --oneline | wc -l)"

    while read comm
       do
        sha=${comm:0:8}
        echo "commitID: "$sha
        filepath="$(git diff-tree -S "${satd}" -r $sha --name-only --no-commit-id)"
        echo "filepath: "$filepath
        time="$(git show -s --format="%ci" ${sha})" 
        echo "time: " $time
        git diff $sha^ $sha | grep "${satd}"
        done <<< "$gitlog"

 





