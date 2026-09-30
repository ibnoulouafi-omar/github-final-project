#!/usr/bin/env bash

# Calculate simple interest using principal, annual percentage rate, and years.
set -euo pipefail

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the annual rate of interest (%): " rate
read -r -p "Enter the time period in years: " time

for value in "$principal" "$rate" "$time"; do
    if [[ ! "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        printf 'Error: enter non-negative numbers, such as 1000 or 2.5.\n' >&2
        exit 1
    fi
done

awk -v principal="$principal" -v rate="$rate" -v time="$time" 'BEGIN {
    interest = principal * rate * time / 100
    printf "Simple interest: %.2f\n", interest
    printf "Total amount: %.2f\n", principal + interest
}'
