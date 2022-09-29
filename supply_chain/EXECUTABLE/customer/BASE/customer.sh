#!/bin/bash

master_step_key=$1
dist_holding_key=$2

step=-1
consumed=0
last_taken=0

while [ $step -lt $(( 60 - 1 )) ];do
  # wait to match both and set step
  step=$(waffle-get $master_step_key "==" $(( $step + 2 )))
  last_taken=0
  if [ $(waffle-get $dist_holding_key) -gt 0 ];then
    last_taken=1
    consumed=$(( $consumed + $last_taken ))
  fi
  waffle-put "last_taken" $last_taken  # update last_taken
  waffle-put "consumed" $consumed  # update consumed
  waffle-put "step" $step  # update step
done

