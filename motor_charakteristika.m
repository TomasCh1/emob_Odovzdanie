function ch = motor_charakteristika(n_rpm, P_W, M_Nm)

    omega      = 2 * pi * n_rpm / 60;
    omega_zakl = P_W / M_Nm;

    M = min(M_Nm, P_W ./ omega);
    P = M .* omega;

    ch.omega  = omega;
    ch.M      = M;
    ch.P      = P;
    ch.n_zakl = omega_zakl * 60 / (2 * pi);
end
