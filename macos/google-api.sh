#!/bin/bash
# Author: Kun Huang <academicgareth@gmail.com>

# Timeout for your rec
timeout=5
# This is Google Chormium
key=AIzaSyBOti4mM-6x9WDnZIjIeyEU21OpBXqWBgw
# en-us zh-cn ...
lang=en-us
# json only
output=json
# proxy ;(
proxy=127.0.0.1:8087
# temp wav file
tmp=test.wat

gtimeout $timeout rec --encoding signed-integer --bits 16 --channels 1 --rate 16000 $tmp
#lang=zh-cn
curl -X POST \
    --data-binary @$tmp\
    --header 'Content-Type: audio/l16; rate=16000;' \
    -x $proxy \
    -L https://www.google.com/speech-api/v2/recognize\?output\=$output\&lang\=$lang\&key\=$key
