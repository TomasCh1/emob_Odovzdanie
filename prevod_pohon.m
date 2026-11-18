function pr = prevod_pohon(v_kmh, N, P_W, M_Nm, n_max, i, eta_pct, r)

    eta = eta_pct / 100;
    v   = v_kmh / 3.6;                     % Prepočet km/h -> m/s

    n_kolesa = v / r * 60 / (2 * pi);      % otáčky kolesa [min^-1]
    n_motora = n_kolesa * i;               % otáčky motora [min^-1]

    ch = motor_charakteristika(n_motora, P_W, M_Nm);

    pr.F        = N * ch.M * i * eta / r;  % dostupná sila na kolesách [N]
    pr.n_motora = n_motora;
    pr.M_kolesa = N * M_Nm * i * eta;      % max. moment na kolesách [N·m]
    pr.F_max    = pr.M_kolesa / r;         % max. sila na kolesách [N]
    pr.v_max    = n_max / i * 2 * pi * r / 60 * 3.6;   % rýchlosť pri max. otáčkach [km/h]
end
