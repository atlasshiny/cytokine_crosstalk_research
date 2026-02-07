%select the data file using the standard windows file viewer
[filename, pathname] = uigetfile('*.csv', 'Select dataset');
full_path = fullfile(pathname, filename);

%load data into matlab 
readtable(full_path)

%define a structure to hold all model parameters
params.rI = float; %immune cell growth rate
params.rC = float; %cancer cell growth rate
params.dI = float; %immune cell death rate
params.dC = float; %cancer cell death rate
params.betaI = float; %cytokine production rate per immune cell
params.betaC = float; %cytokine production rate per cancer cell
params.kIC = float; %strength of immune killing/suppression of cancer cells
params.dY = float; %cytokine decay/clearance rate
params.alphaI = float; %effect of cytokine Y on immune activation or growth
params.D = int; %dimensionless drug level (0 for no drug; % 1 for full-dose culture condition)
%missing parameters : "drug" parameters




