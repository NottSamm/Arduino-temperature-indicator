%Designed to be called in a continuous loop, this function handles the
%three LEDs in the arduino that refer to whether the temperature is too
%hot, too cold, or ok. This function has been timed to take 1 second to
%execute.
function temperatureNotch = temp_monitor(a, recordedTemp)
    if recordedTemp < 18 %If too cold, flash yellow LED
            writeDigitalPin(a, 'D3', 0);
            writeDigitalPin(a, 'D7', 1);
            pause(0.5);
            writeDigitalPin(a, "D7", 0);
            pause(0.5);
            temperatureNotch = 1;
    elseif recordedTemp > 24
        for n = 1:2 %If too hot, flash red LED
            writeDigitalPin(a, 'D3', 0);
            writeDigitalPin(a, "D10", 1);
            pause(0.25);
            writeDigitalPin(a, "D10", 0);
            pause(0.25);
            temperatureNotch = 2;
        end
    else %Steady green LED for good temperature
        writeDigitalPin(a, "D3", 1);
        temperatureNotch = 0;
        pause(1);
    end
end
