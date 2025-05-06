# Data and Code for "Intelligent Load Balancing Strategy for Mitigating Hospital Overcrowding During Pandemic: A Predictive-Prescriptive Approach"

This repository contains the data and code used in the above-titled paper.

## Contents

### Patient Prediction Model

- `lstm-prediction-model.r`: R script implementing the LSTM model for forecasting daily patient volumes.
- `lstm-prediction-data.xlsx`: Historical daily COVID-19 patient admissions from six referral hospitals in Balikpapan City, Indonesia.
- `figure-lstm-prediction-results.xlsx`: Output data from the LSTM model used to generate the figure comparing predicted and actual patient volumes.

### Patient Transfer Model

- `ip-transfer-model.mod`: AMPL model file defining the optimization problem for load balancing across hospitals.
- `ip-transfer-data.dat`: Input data file specifying hospital capacities, patient demand forecasts, resource availability, and other parameters.
- `ip-transfer-runfile.run`: AMPL run script for executing the model.
- `figure-ip-transfer-results.xlsx`: Output data showing recommended patient transfers, used to generate the transfer results figure.
- `figure-ip-sensitivity-analysis.xlsx`: Output data for the sensitivity analysis figure, illustrating how model outcomes change under varying assumptions (e.g., bed capacity, ICU occupancy).

## Citation

If you use any part of this repository in your research, please cite the corresponding publication.

## License

All data and code in this repository are shared under the [Creative Commons Attribution 4.0 International (CC BY 4.0) License](https://creativecommons.org/licenses/by/4.0/), which permits unrestricted use, distribution, and reproduction in any medium, provided the original authors are credited.

## Contact

For questions, clarifications, or collaboration inquiries, please contact:

**Alvin Muhammad 'Ainul Yaqin**  
Systems Modeling and Optimization Research Group, Department of Industrial Engineering, Institut Teknologi Kalimantan, Balikpapan, Indonesia
[alvinyaqin@lecturer.itk.ac.id](mailto:alvinyaqin@lecturer.itk.ac.id)
