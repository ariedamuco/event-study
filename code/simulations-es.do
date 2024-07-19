clear all
do "code/install-packages.do"
set scheme plotplain

// Set the random seed for reproducibility
set seed 651



// Parameters for the simulation
local n_groups = 9351
local n_periods = 10

// Generate data
clear
set obs `n_groups'
gen group = _n
expand `n_periods'
bysort group: gen period = _n - 1+2021

// Ensure treatment start year is assigned only once per group
bysort group: gen treatment_start = runiformint(2021, 2027) if _n == 1

bysort group: carryforward treatment_start, replace
replace treatment_start=. if treatment_start<=2022




// Generate treatment indicator
gen is_treated = (period == treatment_start)
bysort group: gen post_period = period >= treatment_start

gen noise = rnormal()

gen outcome = rnormal(50, 15)
sum outcome, d
replace outcome = outcome -r(min)
replace outcome = outcome + 5*is_treated + noise 

 
// Differences-in-Differences analysis

reghdfe outcome is_treated, a(group period) cluster(group)
test _b[is_treated]==5

xtset group period 
xtreg outcome is_treated, fe cluster(group)
test _b[is_treated]==5


// Differences-in-Differences analysis only for those treated in 2023, we don't have data for the rest
preserve
drop if period>2023

reghdfe outcome is_treated, a(group period) cluster(group)
test _b[is_treated]==5

xtset group period 
xtreg outcome is_treated, fe cluster(group)
test _b[is_treated]==5

restore


simple_event outcome is_treated, leads(4) lags(6) fe(period group) cluster(group)  normalizelead(1) 
graph export "figures/simulation.png", replace 
