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

clear %clear workspace
a = arduino("COM5","Uno"); %set up Arduino
duration = 600; %how many seconds should the program run for?
temperatureV = linspace(0,0,duration); %Set the size of the vector that stores the temperatures
n = 0; %set the counter to 0
while duration > 0
    n = n + 1; %increment counter
    recordedV = readVoltage(a,'A2'); %reads voltage from sensor
    duration = duration - 1; %counts down how many seconds left
    V0 = 0.5; %from datasheet
    Tc = 0.01; %from datasheet
    correctedV = recordedV - V0; %These lines convert voltage to degrees
    correctedV = correctedV/Tc; % These lines convert voltage to degrees
    temperatureV(n) = correctedV; %append temperature to vector
    pause(1); %wait one second
end

minimumTemp = min(temperatureV); %find the maximum temperature over the time
maximumTemp = max(temperatureV); %find the minimum temperature over the time
averageTemp = mean(temperatureV);%fine the average temperature over the time
%output the three values above
%disp(sprintf('The minimum temperature is %d degrees, the maximum is %d degrees, and the average is %d degrees.',round(minimumTemp),round(maximumTemp),round(averageTemp)));

figure(1); %create a plot of temperature over the time
plot(temperatureV);
xlabel('time (s)');
ylabel('temperature (Celcius)');

%output the temperature data in the format requested
todayDate = datetime('today');
dataLog = sprintf(' Data logging initiated - %s\n Location - Nottingham\n\n Minute         0\n Temperature    %.2f C\n\n Minute         1\n Temperature    %.2f C\n\n Minute         2\n Temperature    %.2f C\n\n Minute         3\n Temperature    %.2f C\n\n Minute         4\n Temperature    %.2f C\n\n Minute         5\n Temperature    %.2f C\n\n Minute         6\n Temperature    %.2f C\n\n Minute         7\n Temperature    %.2f C\n\n Minute         8\n Temperature    %.2f C\n\n Minute         9\n Temperature    %.2f C\n\n Minute         10\n Temperature    %.2f C\n\n Max temp       %.2f C\n Min temp       %.2f C\n Average Temp   %.2f C\n\n Data logging terminated',todayDate,temperatureV(1),temperatureV(60),temperatureV(120),temperatureV(180),temperatureV(240),temperatureV(300),temperatureV(360),temperatureV(420),temperatureV(480),temperatureV(540),temperatureV(600),maximumTemp,minimumTemp,averageTemp);
disp(dataLog);
%store the data in the file cabin_temperature.txt
fileHandler = fopen('cabin_temperature.txt','w');
fprintf(fileHandler,dataLog);
fclose(fileHandler);

%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]

clear %clear workspace
a = arduino("COM5","Uno"); %set up arduino
n = 1; %set counter
while true 
    recordedV = readVoltage(a,'A2'); %Get voltage from sensor
    V0 = 0.5; %from datasheet
    Tc = 0.01;%from datasheet
    correctedV = recordedV - V0;%These lines convert voltage to degrees
    correctedV = correctedV/Tc; %These lines convert voltage to degrees
    temperatureV(n) = correctedV; %append temperature to vector
    n = n + 1; %increment counter
    temperatureNotch = temp_monitor(a, correctedV); %call function to set LEDs on breadboard
    %update plot of temperature against time
    figure(2)
    plot(temperatureV)
    xlabel('time(s)');
    ylabel('temperature (degrees C)');
    ylim([15,27]);
end


%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]

clear %clear workspace
a = arduino("COM5","Uno"); %set up arduino
n = 1; %set counter
while true 
    recordedV = readVoltage(a,'A2'); %Get voltage from sensor
    V0 = 0.5; %from datasheet
    Tc = 0.01;%from datasheet
    correctedV = recordedV - V0;%These lines convert voltage to degrees
    correctedV = correctedV/Tc; %These lines convert voltage to degrees
    temperatureV(n) = correctedV; %append temperature to vector
    n = n + 1; %increment counter
    returner = temp_prediction(a,temperatureV,correctedV,n);
end


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

% Insert answers here