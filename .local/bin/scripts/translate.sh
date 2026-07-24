#!/bin/bash

export http_proxy="http://127.0.0.1:10808"

export https_proxy="http://127.0.0.1:10808"

text=$(wl-paste)

result=$(printf "%s" "$text" | trans -brief -speak :zh)

notify-send "Translation" "$result"
