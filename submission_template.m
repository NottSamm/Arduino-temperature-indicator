% Saambavan Thambiayah
% egyst7@Nottingham.ac.uk


%% PRELIMINARY TASK - ARDUINO AND GIT INSTALLATION [10 MARKS]

clear
a = arduino("COM5","Uno");
for n=1:10
    writeDigitalPin(a,'D4',1);
    pause(0.5);
    writeDigitalPin(a,'D4',0);
    pause(0.5)
end

%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]

% Insert answers here

%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]

% Insert answers here


%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]

% Insert answers here


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

% Insert answers here