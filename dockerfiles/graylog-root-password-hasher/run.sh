#!/bin/bash
echo -n "$1" | shasum -a 256 | sed 's/ -//g'
