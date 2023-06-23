function [vin, vpl, mu, radius, rp_arr] = planets(planet)

if (planet == "Меркурий")

    vin = 40.9;
    vpl = 47.36;
    mu = 22032;
    radius = 3390;
    rp_arr =  300 + radius:1000:2300 + radius;

elseif (planet == "Венера")

    vin = 30.9;
    vpl = 35.02;
    mu = 324859;
    radius = 6052;
    rp_arr =  300 + radius:1000:2300 + radius;

elseif (planet == "Юпитер")

    vin = 20.9;
    vpl = 13.07;
    mu = 126686534;
    radius = 71492;
    rp_arr =  300 + radius:1000:2300 + radius;

elseif (planet == "Сатурн")
    
    vin = 25.9;
    vpl = 9.69;
    mu = 37931187;
    radius =  58232;
    rp_arr =  300 + radius:1000:2300 + radius;

else
    
    vin = 11;
    vpl = 26.78;
    mu = 398600;
    radius = 6371;
    rp_arr =  300 + radius:1000:2300 + radius;

end