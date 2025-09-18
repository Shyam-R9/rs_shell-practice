#!/bin/bash

NUM1=$1
NUM2=$2

if [ $NUM1 -lt $NUM2 ]
then
    echo "$NUM2 is greater than $NUM1"
else
    echo "$NUM1 is greater than $NUM2"
fi
