%Function calculates the change in temperature over the last 10 seconds. It
%then prints this and the predicted temperature over 5 minutes if the trend
%continues. This will also change the LED if the temperature change is too
%high (red for +4C and yellow for -4C)
function returner = temp_prediction(a,temperatureV, correctedTemp, n)
    if length(temperatureV) >= 20
        gradient = correctedTemp - temperatureV(n-19);
        gradient = gradient/20;
        returner = gradient;
    else
        gradient = correctedTemp - temperatureV(1);
        gradient = gradient/20;
        returner = gradient;
    end
    pause(1)
    fprintf('Gradient is %.3f\n',gradient);
    fprintf('The current temperature is %.2f degrees C\n',correctedTemp);
    fprintf('The predicted temperature in 5 minutes is %.2f degrees C\n\n',gradient*300 + correctedTemp);
    if correctedTemp <= 24 & correctedTemp >= 18 & gradient < 4 & gradient > -4
        writeDigitalPin(a, "D3", 1);
        writeDigitalPin(a, "D7", 0);
        writeDigitalPin(a, "D10", 0);
    elseif gradient > 4
        writeDigitalPin(a, "D3", 0);
        writeDigitalPin(a, "D7", 0);
        writeDigitalPin(a, "D10", 1);
    elseif gradient < -4
        writeDigitalPin(a, "D3", 0);
        writeDigitalPin(a, "D7", 1);
        writeDigitalPin(a, "D10", 0);
end
