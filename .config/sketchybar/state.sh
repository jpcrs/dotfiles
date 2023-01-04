#!/usr/bin/env bash
hinit() {
    rm -rf /tmp/hashmap.$1
    mkdir -p /tmp/hashmap.$1
}

hput() {
    printf "$3" > /tmp/hashmap.$1/$2
}

hget() {
    cat /tmp/hashmap.$1/$2
}

hkeys() {
    ls -1 /tmp/hashmap.$1
}

hdestroy() {
    rm -rf /tmp/hashmap.$1
}