# Event Study Design Simulation and Comparison with Difference in Differences

This repository contains code to simulate and plot Event Study Design and compare it with Difference in Differences design.

## Repository Structure

- **code/**: Contains the files for simulations, package installations, and configuration.
  - **config-file.do**: Configuration file for setting up the environment.
  - **simulations-es.do**: Stata code to perform the simulations.
  - **install-packages.do**: Stata script to install the necessary packages.
- **ado/**: Contains the locally installed ado files and directories.
  - **personal/**: Directory containing `simple-event.ado` to plot the event study.
  - **plus/**: Directory containing additional ado files.

## Usage

### Simulation and Plotting

1. **Set Up Configuration**: Run the configuration script in the `code` folder.
2. **Install Necessary Packages**: Use the script in the `code` folder to install necessary packages.
3. **Run Simulations**: Use the script in the `code` folder to run simulations.
4. **Plot Event Study**: Use `simple-event.ado` in the `ado/personal` folder to plot the event study design in Stata.


## Contributions

Contributions are welcome! Please create a pull request or submit an issue for any suggestions or improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
