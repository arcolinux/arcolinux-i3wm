#!/bin/bash

check_install() {
     if [[ ! $(type $1 2>/dev/null) ]]; then
          echo "Error: missing command '$1'. Exiting."
          exit 1
     fi
}

check_install xdo
check_install xprop

for bar in $(xdo id -N 'Polybar'); do
     if xprop -id $bar | grep "polybar-mainbar"; then
          if xprop -id $bar | grep "Normal"; then
               xdo hide $bar
          elif xprop -id $bar | grep "Withdrawn"; then
               xdo show $bar
          fi
     fi
done
