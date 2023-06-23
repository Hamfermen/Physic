function deltaV = getDeltaV(mu, rp, vin, vpl, alpha)

    pl = [0 0 vpl 0];
    vin = [0 0 vin 0];
    b = [cos(alpha) sin(alpha); -sin(alpha) cos(alpha)]*[vin(3); vin(4)];
    b = [0 0 b(1) b(2)];
    c = pl -b;

    v = sqrt(c(3)^2 + c(4)^2);
    
    vc = sqrt(mu / rp);

    beta = 2 * asin(1 / (1 + (v / vc) ^ 2));

    deltaV = 2 * v * sin(beta / 2);
end

