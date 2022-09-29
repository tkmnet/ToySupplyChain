#!/bin/bash

master_step_key=$1

step=-2

while [ $step -lt 60 ];do
  # wait to match both and set step
  step=$(waffle-get $master_step_key "==" $(( $step + 2 )))
  produced=$(( ( $step % 3 ) + 1 )) 
  waffle-put "produced" $produced  # update produced
  waffle-put "step" $step  # update step
done

