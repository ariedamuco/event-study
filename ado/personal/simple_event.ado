
program define simple_event
    * Parse arguments
    syntax varlist(min=2) [if] [in], leads(integer) lags(integer) fe(varlist) cluster(varlist) normalizelead(integer)

    * Extract arguments
    local outcome = word("`varlist'", 1)
    local treatment_var = word("`varlist'", 2)
    local max_leads = `leads'
    local max_lags = `lags'
    local fixed_effects = "`fe'"
    local cluster_var = "`cluster'"
    local normalize_lead = `normalizelead'

    * Debugging: display parsed arguments
    di "Outcome variable: `outcome'"
    di "Treatment variable: `treatment_var'"
    di "Max leads: `max_leads'"
    di "Max lags: `max_lags'"
    di "Fixed effects: `fixed_effects'"
    di "Cluster variable: `cluster_var'"
    di "Normalize lead: `normalize_lead'"

    * Generate leads
    forvalues x = 1/`max_leads' {
        qui: gen f_`x'_`treatment_var' = f`x'.`treatment_var'
        qui: replace f_`x'_`treatment_var' = 0 if f_`x'_`treatment_var' == .
        label var f_`x'_`treatment_var' "Lead `x'"
    }

    * Generate lags
    forvalues x = 1/`max_lags' {
        qui: gen l_`x'_`treatment_var' = l`x'.`treatment_var'
        qui: replace l_`x'_`treatment_var' = 0 if l_`x'_`treatment_var' == .
        label var l_`x'_`treatment_var' "Lag `x'"
    }

    * Initialize lags_leads variable
    gen lags_leads = 0 if `treatment_var' == 1

    * Update lags_leads based on leads and lags
    forvalues x = 1/`max_leads' {
        qui: replace lags_leads = -`x' if f_`x'_`treatment_var' == 1
    }
    forvalues x = 1/`max_lags' {
        qui: replace lags_leads = `x' if l_`x'_`treatment_var' == 1
    }

    * Adjust the variable lists for regression
    local leads
    forvalues x = 1/`max_leads' {
        local leads `leads' f_`x'_`treatment_var'
    }
    local lags
    forvalues x = 1/`max_lags' {
        local lags `lags' l_`x'_`treatment_var'
    }

    * Normalize at specified lead
    qui: replace f_`normalize_lead'_`treatment_var' = 0

    * Run the regression
    reghdfe `outcome' `leads' `treatment_var' `lags', absorb(`fixed_effects') cluster(`cluster_var')

    * Post-regression processing
    gen coefficients = .
    gen standard_errors = .

    qui: replace coefficients = _b[`treatment_var']
    qui: replace standard_errors = _se[`treatment_var']

    * Update coefficients and standard_errors based on leads and lags
    forvalues x = 1/`max_leads' {
        qui: replace coefficients = _b[f_`x'_`treatment_var'] if lags_leads == -`x'
        qui: replace standard_errors = _se[f_`x'_`treatment_var'] if lags_leads == -`x'
    }
    forvalues x = 1/`max_lags' {
        qui: replace coefficients = _b[l_`x'_`treatment_var'] if lags_leads == `x'
        qui: replace standard_errors = _se[l_`x'_`treatment_var'] if lags_leads == `x'
    }

    * Keep only relevant variables and observations
    keep coefficients standard_errors lags_leads
    keep if abs(lags_leads) <= max(`max_leads', `max_lags')
    label var lags_leads "Leads/Lags"

    * Generate confidence intervals
    gen upper_bound = coefficients + 1.96 * standard_errors
    gen lower_bound = coefficients - 1.96 * standard_errors

    * Plot the results
    twoway (rarea lower_bound upper_bound lags_leads, sort color(gs14) legend(off)) || ///
           (scatter coefficients lags_leads, yline(0) sort connect(l) lpattern(.-) msymbol(diamond) ///
           mcolor("0 0 255*1.6") msize(small) lcolor("0 0 255*1.6"))
end
