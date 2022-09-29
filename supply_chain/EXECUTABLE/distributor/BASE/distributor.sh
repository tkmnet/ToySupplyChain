#!/bin/bash

prod_step_key=$1
prod_produced_key=$2
cust_step_key=$3
cust_taken_key=$4

holding=0

for step in $(seq 0 60);do
  waffle-put "step" $step  # update step
  if [ $(( $step % 2 )) -eq 0 ];then
    waffle-get $prod_step_key "==" $step  # wait to match both
    holding=$(( $holding + $(waffle-get $prod_produced_key) ))
  else
    waffle-get $cust_step_key "==" $step  # wait to match both
    holding=$(( $holding - $(waffle-get $cust_taken_key) ))
  fi
  waffle-put "holding" $holding  # update holding
done

