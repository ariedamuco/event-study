clear all
set more off

do "code/config-file.do"

program main
    * *** Add required packages from SSC to this list ***
    local ssc_packages "carryforward reghdfe ftools blindschemes"
    * *** Add required packages from SSC to this list ***

    if !missing("`ssc_packages'") {
        foreach pkg in `ssc_packages' {
        * install using ssc, but avoid re-installing if already present
            capture which `pkg'
            if _rc == 111 {                 
               dis "Installing `pkg'"
               quietly ssc install `pkg', replace
               }
        }
    }


end


main
