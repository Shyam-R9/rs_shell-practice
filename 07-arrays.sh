#!/bin/bash

MOVIES=("animal" "arjun reddy" "kabir singh")

echo "first_movie: ${MOVIES[0]}"
echo "second_movie: $(MOVIES[1])"
echo "all movies: ${MOVIES[@]}"

