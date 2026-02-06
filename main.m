%select the data file using the standard windows file viewer
[filename, pathname] = uigetfile('*.csv', 'Select dataset');
full_path = fullfile(pathname, filename);

%load data into matlab 
readtable(full_path)

%define a structure to hold all parameters
params.rI = 0.05; %immune cell growth rate
params.rC = 0.08; %cancer cell growth rate
% add other parameters here when they are known

