% Saambavan Thambiayah
% egyst7@Nottingham.ac.uk


%% PRELIMINARY TASK - ARDUINO AND GIT INSTALLATION [10 MARKS]

clear %clear workspace
a = arduino("COM5","Uno"); %create reference to arduino
for n=1:10 %repeat 10 times
    writeDigitalPin(a,'D4',1); %turn on LED connected to channel 4
    pause(0.5); %wait for half of a second
    writeDigitalPin(a,'D4',0); %turn LED connected to channel 4 off
    pause(0.5) %wait for a half second
end

%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]

% Insert answers here

%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]

% Insert answers here


%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]

% Insert answers here


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

% Insert answers here