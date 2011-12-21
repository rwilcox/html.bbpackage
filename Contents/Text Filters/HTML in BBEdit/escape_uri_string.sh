#!/bin/sh

perl -MURI::Escape -le 'print uri_escape(<STDIN>)'
