#!/bin/bash

echo -e "\033]50;SetProfile=Prod\a"
ssh $@
echo -e "\033]50;SetProfile=Default\a"
