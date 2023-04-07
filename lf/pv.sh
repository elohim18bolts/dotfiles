#!/bin/sh
#
MIME=$(mimetype --all --brief "$1")
case "$MIME" in
	*image/*) file -b "$1";; 
	*application/pdf*) pdftotext "$1" -;;
	*application/zip*) unzip -l "$1";;
	*text/plain*) highlight -O ansi "$1";;
esac

