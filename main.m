close all;
clear all;
clc;

planet = "Юпитер";

lines = ["-", "-", "-"]; 
colors = ["#0072BD", "#D95319", "#EDB120", "#7E2F8E", "#77AC30", "#4DBEEE", "#A2142F"];

[vin, vpl, mu, radius, rp_arr] = planets(planet);

alpha_arr = 1:90;

color_number = 1;

figure_number = 1;

for i = 30:10:50
    color_number = 0;
    for rp = rp_arr
        alpha = i * pi / 180;
        color_number = color_number + 1;
        [deltaV] = Vectors(vin, vpl, mu, rp, alpha, figure_number, colors, color_number, lines, rp_arr);

        if color_number == 1
            title(planet + " угол между скоростями " + num2str(alpha / pi * 180))
        end
        if color_number == 3
            saveas(gcf, num2str(alpha / pi * 180) + " угол.png")
        end
        disp("Приращение скорости = " + num2str(deltaV)) 
        disp("Угол между векторами скорости = " + num2str(alpha / pi * 180)) 
        disp("Прицельный радиус = " + num2str(rp))
        disp("Входная скорость = " + num2str(vin))
        disp("---------------------------------")
    end
    figure_number = figure_number + 1;
    
end
% 
max_v = 0;
refct = 0;
efct_alpha = 0;

for rp = 100 + radius:1200 + radius
    for i = 1:179
        alpha = i * pi / 180;
        [deltaV] = getDeltaV(mu, rp, vin, vpl, alpha);
        if max_v < deltaV
            max_v = deltaV;
            refct = rp;
            efct_alpha = alpha;
        end
    end
end

        disp("Максимальное приращение скорости = " + num2str(max_v))
        disp("Эффективный угол между векторами скорости = " + num2str(efct_alpha / pi * 180))
        disp("Эффективный прицельный радиус = " + num2str(refct)) 
        disp("---------------------------------")     

check_analitic(vin, vpl, mu, radius + 100, 30 * pi / 180, 9, colors, 1, lines, rp_arr)
arr = [100 10 1 0.1 0.01, 0.001];
color_number = 1;
for dt = arr
    CheckDT(vin, vpl, mu, radius + 100, 30 * pi / 180, 9, colors, color_number, lines, rp_arr, dt)
    color_number = color_number + 1;
end

legend(num2str(arr(1)), num2str(arr(2)), num2str(arr(3)), num2str(arr(4)), num2str(arr(5)), num2str(arr(6)))