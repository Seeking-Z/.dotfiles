#!/bin/bash

export http_proxy="http://127.0.0.1:10808"
export https_proxy="http://127.0.0.1:10808"

text=$(wl-paste)

kitty --hold --class translate-popup bash -c "printf '%s' \"$text\" | trans "
