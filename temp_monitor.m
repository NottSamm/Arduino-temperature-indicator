%Saambavan Thambiayah (egyst7@Nottingham.ac.uk

function temperatureNotch = temp_monitor(a, recordedTemp)
    if recordedTemp < 18
            writeDigitalPin(a, 'D3', 0);
            writeDigitalPin(a, 'D7', 1);
            pause(0.5);
            writeDigitalPin(a, "D7", 0);
            pause(0.5);
            temperatureNotch = 1;
    elseif recordedTemp > 24
        for n = 1:2
            writeDigitalPin(a, 'D3', 0);
            writeDigitalPin(a, "D10", 1);
            pause(0.25);
            writeDigitalPin(a, "D10", 0);
            pause(0.25);
            temperatureNotch = 2;
        end
    else
        writeDigitalPin(a, "D3", 1);
        temperatureNotch = 0;
    end
end
