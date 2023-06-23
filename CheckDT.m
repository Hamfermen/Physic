function [deltaV] = CheckDT(vin, vpl, mu, rp, alpha, figure_number, colors, color_number, lines, rp_arr, dt)

f = figure(figure_number);
f.Position = [300 300 600 600];

if color_number == 1
%     nexttile
    grid minor
    hold on;
grid on;
     
end

axis equal
    

pl = [0 0 vpl 0];
vin = [0 0 vin 0];
b = [cos(alpha) sin(alpha); -sin(alpha) cos(alpha)]*[vin(3); vin(4)];
b = [0 0 b(1) b(2)];
c = pl - b;

v = sqrt(c(3)^2 + c(4)^2);

vc = sqrt(mu / rp);

beta = 2 * asin(1 / (1 + (v / vc) ^ 2));

deltaV = 2 * v * sin(beta / 2);

e = 1 / cos(beta);
    
a = rp/sqrt(e^2 - 1);

vx = b(3);
vy = b(4);

x = -rp;
y = -rp/a * x;

xpl = 0;

    x_arr = [x];
    y_arr = [y]; 
    
    xpl_arr = [xpl];

    flag = true;

    k = 1;

for i = 1:7*10^5
    xpl = xpl + vpl * dt;

        dx = vx * dt;
        dy = vy * dt;

        x = x + dx;
        y = y + dy;

        x_arr(end+1) = x;
        y_arr(end+1) = y;

        dvx = -mu * (x - xpl) / ((x-xpl)^2 + y^2)^(3/2) * dt;
        dvy = -mu * y / ((x-xpl)^2 + y^2)^(3/2) * dt;
        vx = vx + dvx;
        vy = vy + dvy;

        if all([y < 5, y > -5, flag])
            flag = false;
            if k < 2
%                 scatter(xpl, 0, "filled", 'MarkerFaceColor', colors(color_number));
            end
            k = k + 1;
        elseif any([y > 5, y < -5])
            flag = true;
        end

end
plot(x_arr, y_arr, 'Color', colors(color_number));


    

for x  = xpl_arr
    %scatter(x, 0)
end

%  if color_number == 3
%         str = [["", ""], ["", ""], ["", ""]];
%         for i = 1:color_number
%             str(i, 1) = "Прицельное расстояние " + num2str(rp_arr(i));
%             str(i, 2) = "Позиция планеты в момент совершения гравитационного маневра";
%            
%         end
%         lg = legend(str(1, 2), str(1, 1), str(2, 2), str(2, 1), str(3, 2), str(3, 1));
%         lg.Layout.Tile = 'north';
%  end



% quiver(0, 0, vx, vy)