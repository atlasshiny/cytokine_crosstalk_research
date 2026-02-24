%select the data file using the standard windows file viewer
%[filename, pathname] = uigetfile('*.csv', 'Select dataset');
%full_path = fullfile(pathname, filename);

%load data into matlab 
%data_set = readtable(full_path);

params = CytokineParameter("rC",0.05,"dC",0.01);

model = cytokinemodel(0,1e5, params);

disp(model)