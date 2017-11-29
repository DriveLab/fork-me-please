// Title: test.do
// Author: name
// Description: 
// Input: 
// Output:
// Version: 13.1


log close _all
clear all
set maxvar 5000
set matsize 1000
set more off
pause on


cd "/Path/to/project/dir/"


///////////
// Setup //
///////////

// Directory paths
global root_dir "`c(pwd)'"						// Root directory
global data_input_dir "$root_dir/data/input"	// Raw data
global data_output_dir "$root_dir/data/output"	// Final data
global output_dir "$root_dir/output"			// Figures and tables
global log_dir "$root_dir/log"			 		// Log files

// Options
set scheme burd


///////////////////
// Data cleaning //
///////////////////

// Import raw data
import excel using "$data_input_dir/name_of_dataset.xlsx", firstrow
sum _all


// Recode "-999" as missing values
mvdecode var_*, mv(-999=.)
sum _all


// Generate dummies for town_id (uses -dummieslab- from SSC.)
dummieslab town_id


// Add your favourite (or any other) command below
kdensity   town_id
tab x_var, missing // Lizzie


// Save data
save "$data_output_dir/name_of_dataset", replace


//////////
/* Notes /
//////////

Add notes here. 
