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

clear
a = arduino("COM5","Uno");
duration = 600;
temperatureV = linspace(0,0,duration);
n = 0;
while duration > 0
    n = n + 1;
    recordedV = readVoltage(a,'A2');
    duration = duration - 1;
    V0 = 0.5;
    Tc = 0.01;
    correctedV = recordedV - V0;
    correctedV = correctedV/Tc;
    temperatureV(n) = correctedV;
    pause(1);
end

minimumTemp = min(temperatureV);
maximumTemp = max(temperatureV);
averageTemp = mean(temperatureV);
disp(sprintf('The minimum temperature is %d degrees, the maximum is %d degrees, and the average is %d degrees.',round(minimumTemp),round(maximumTemp),round(averageTemp)));

figure(1);
plot(temperatureV);
xlabel('time (s)');
ylabel('temperature (Celcius)');

todayDate = datetime('today');
dataLog = sprintf(' Data logging initiated - %s\n Location - Nottingham\n\n Minute          0\n Temperature    %.2f C\n\n Minute          1\n Temperature    %.2f C\n\n Minute          2\n Temperature    %.2f C\n\n Minute          3\n Temperature    %.2f C\n\n Minute          4\n Temperature    %.2f C\n\n Minute          5\n Temperature    %.2f C\n\n Minute          6\n Temperature    %.2f C\n\n Minute          7\n Temperature    %.2f C\n\n Minute          8\n Temperature    %.2f C\n\n Minute          9\n Temperature    %.2f C\n\n Minute          10\n Temperature    %.2f C\n\n Max temp      %.2f C\n Min temp      %.2f C\n Average Temp   %.2f C\n\n Data logging terminated',todayDate,temperatureV(1),temperatureV(60),temperatureV(120),temperatureV(180),temperatureV(240),temperatureV(300),temperatureV(360),temperatureV(420),temperatureV(480),temperatureV(540),temperatureV(600),maximumTemp,minimumTemp,averageTemp);
disp(dataLog);

%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]

% Insert answers here


%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]

% Insert answers here


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

% Insert answers here