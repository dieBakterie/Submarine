#!/bin/bash

# Define the mapping of colors to their custom_model_data starting points
declare -A colorModelDataMapping=(
    ["black"]=1
    ["blue"]=5
    ["brown"]=9
    ["cyan"]=13
    ["gray"]=17
    ["green"]=21
    ["light_blue"]=25
    ["light_gray"]=29
    ["lime"]=33
    ["magenta"]=37
    ["orange"]=41
    ["pink"]=45
    ["purple"]=49
    ["red"]=53
    ["white"]=57
    ["yellow"]=61
)

# Iterate over each .mcfunction file in the current directory
for file in *_animation.mcfunction; do
    cat $file >> temp.mcfunction
done

echo "All mcfunction files have been successfully dumped."
