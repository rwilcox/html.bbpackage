#!/bin/sh

perl -MURI::Escape -le 'print uri_unescape(<STDIN>)'
