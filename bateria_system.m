function b = bateria_system(c, Ns, Np, prid_m_pct, prid_V_pct)

    SOC = linspace(0, 100, 201);
    U0  = c.U_min + (c.U_max - c.U_min) * SOC / 100;
    R   = c.R_mOhm / 1000;
    m   = c.m_g / 1000;
    V   = c.V_cm3 / 1000;

    I_vyb = c.C_vyb(:) * c.Q;
    I_nab = c.C_nab(:) * c.Q;
    k_vyb = min(SOC / 3, 1);
    k_nab = min((100 - SOC) / 3, 1);

    b.SOC   = SOC;
    b.U0    = U0;
    b.P_vyb =  I_vyb .* (U0 - I_vyb * R) .* k_vyb;
    b.P_nab = -I_nab .* (U0 + I_nab * R) .* k_nab;

    b.E  = c.U_nom * c.Q;
    b.P  = I_vyb(1) * (c.U_nom - I_vyb(1) * R);
    b.Em = b.E / m;
    b.EV = b.E / V;
    b.Pm = b.P / m / 1000;
    b.PV = b.P / V / 1000;

    N = Ns * Np;
    s.N     = N;
    s.E     = b.E * N / 1000;
    s.Q     = c.Q * Np;
    s.m     = m * N * (1 + prid_m_pct / 100);
    s.V     = V * N * (1 + prid_V_pct / 100);
    s.U_nom = c.U_nom * Ns;
    s.U_min = c.U_min * Ns;
    s.U_max = c.U_max * Ns;
    s.R     = c.R_mOhm * Ns / Np;
    s.Em    = b.E * N / s.m;
    s.EV    = b.E * N / s.V;
    s.Pm    = b.P * N / s.m / 1000;
    s.PV    = b.P * N / s.V / 1000;
    s.U0    = U0 * Ns;
    s.P_vyb = b.P_vyb * N / 1000;
    s.P_nab = b.P_nab * N / 1000;

    b.sys = s;
end
