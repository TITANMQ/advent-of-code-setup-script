#!/bin/bash

# Advent of code setup script currently only supports c# projects

#This script requires wget to be installed on the system

# init 1 => creates two new c# projects for day 1 and one for each part of the question.
# init 2 2023 => creates a new c# project for day 2 for aoc 2023
#
# To get the input.txt wget is used to download the input from the advent of code website  

# for creating a new project, use donet new console -n Day1_1  

source .env

if [ -z "$session_cookie" ]; then
    echo "Please set the session cookie in the env.env file."
    exit 1
fi 

# *testing purposes only* 
location_path="/c/Users/Elijah.Rose/RiderProjects/AdventOfCode2024"

# The day and year of the advent of code challenge
day=1
year=2023 


print_usage() {
    echo "Usage: ./aoc_setup.sh [options]"
    echo "Options:"
    echo "   init: Creates a new projects for the day."
    echo "   clear: Removes the projects for the day."
    echo "   ?: Shows the usage information."
}


get_day(){
    if [ -z "$1" ]; then
        day=1
    else 
        #todo check if the day is within the range of the advent of code challenge and not in the future
        if [[ "$1" =~ ^[0-9]+$ ]]; then
            day=$1
        else
            echo "Invalid day format. Please enter a valid day between 1 - 25."
            exit 1
        fi
    fi

    echo "Day: $day"
}

#todo: add a check for the year could use regex to check if the year is valid and within the range of the advent of code challenge
get_year(){
    if [ -z "$1" ]; then
        year=2023
    else
        if [[ "$1" =~ ^[0-9]{4}$ ]]; then
            year=$1
        else
            echo "Invalid year format. Please enter a valid year."
            exit 1
        fi
    fi

    echo "Year: $year"
}

create_projects() {

    dir_name="Day${day}"

    part1_project_name="Day${day}_1"
    part2_project_name="Day${day}_2"

    #Check if the folder already exists
    if test -d "$dir_name" || test -d "$dir_name/$part1_project_name" || test -d "$dir_name/$part2_project_name"; then    
        echo "Projects already exist for day $day" 
        exit 1
    fi

    #Create a new project for part 1 and part 2 of the day
    echo "Creating projects for day $day..."
    echo "" 

    mkdir "$dir_name" 
    cd "$dir_name"

    echo "Creating project for part 1..."
    dotnet new console -n "$part1_project_name"

    echo "Creating project for part 2..."
    dotnet new console -n "$part2_project_name"

    # Grab the input for the day
    get_test_input
}  


get_test_input() {
    # Get the input for the day
    if test -d "Day${day}_1" && test -d "Day${day}_1"; then
        echo "Getting input for day $day..."
        wget --header="Cookie: session=${session_cookie};" -O Day${day}_1/input.txt https://adventofcode.com/$year/day/$day/input 
        wget --header="Cookie: session=${session_cookie};" -O Day${day}_2/input.txt https://adventofcode.com/$year/day/$day/input 
    else
        echo "Projects for day $day do not exist" 
        #Todo: Add a message to create the projects
        echo "Please create the projects using ..."
        exit 1
    fi
}


#FOR TESTING PURPOSES ONLY
clear_projects(){

    dir_name="Day${day}"

    part1_project_name="Day${day}_1"
    part2_project_name="Day${day}_2"

    if test -d "$dir_name"; then

        echo "Removing projects for day $day..."
        rm -rf "$dir_name"
        echo  
    fi
} 


print_tree() {
    echo 
    echo "
   *    *  ()   *   *
*        * /\         *
      *   /i\\    *  *
    *     o/\\  *      *
 *       ///\i\    *
     *   /*/o\\  *    *
   *    /i//\*\      *
        /o/*\\i\   *
  *    //i//o\\\\     *
    * /*////\\\\i\*
 *    //o//i\\*\\\   *
   * /i///*/\\\\\o\   *
  *    *   ||     *    "
         
  echo
  echo
}


# Entry point for the script (Here)

# *testing purposes only* 
cd $location_path 

print_tree

# Get argurments from the command line
if [ "$1" == "init" ]; then 
    get_day $2
    create_projects
elif [ "$1" == "clear" ]; then
    get_day $2
    clear_projects
elif [ "$1" == "?" ]; then
    print_usage
else
    echo "Invalid command. For help please use the help command ?."
    exit 1
fi
