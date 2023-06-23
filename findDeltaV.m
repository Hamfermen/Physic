close all;
clear all;
clc;

planet = "Земля";

lines = ["-", "-", "-"]; 
colors = ["#0072BD", "#D95319", "#EDB120", "#7E2F8E", "#77AC30", "#4DBEEE", "#A2142F"];

[vin, vpl, mu, radius, rp_arr] = planets(planet);

need_delatV = 4.13;

refct = 0;
efct_alpha = 0;

for rp = 50 + radius:200 + radius
    for i = 1:180
        alpha = i * pi / 180;
        [deltaV] = getDeltaV(mu, rp, vin, vpl, alpha);
        if need_delatV < deltaV * 1.02 && need_delatV > deltaV * 0.98
            refct = rp;
            efct_alpha = alpha;
        end
    end
end

disp("При заданной скорости КА = " + num2str(vin)) 
disp("Желаемом приращение скорости = " + num2str(need_delatV))
disp("Необходимый угол между векторами скорости = " + num2str(efct_alpha / pi * 180))
disp("Необходимый прицельный радиус = " + num2str(refct)) 
disp("---------------------------------")

Vectors(vin, vpl, mu, refct, efct_alpha, 1, colors, 1, lines, rp_arr)
title("Траектория КА для планеты " + planet)
legend("Позиция панеты в момент гравитационного маневра", "Траектория КА")

saveas(gcf, "Траектория КА для планеты " + planet + ".png")