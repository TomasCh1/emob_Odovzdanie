function sily = jazdne_odpory(v_kmh, v_air, m, A, C_D, C_R, stup_pct, a, rho, g)

    v    = v_kmh / 3.6;            % Prepočet km/h -> m/s
    alfa = atan(stup_pct / 100);   % Prepočet stúpania % -> uhol [rad]

    F_D   = 0.5 * rho * C_D * A * (v + v_air).^2;   % odpor vzduchu
    F_R   = C_R * m * g;                            % valivý odpor
    F_C   = m * g * sin(alfa);                      % odpor stúpania
    F_A   = m * a;                                  % odpor zrýchlenia
    F_sum = F_D + F_R + F_C + F_A;                  % súčet odporov

    sily.F_D   = F_D;
    sily.F_R   = F_R;
    sily.F_C   = F_C;
    sily.F_A   = F_A;
    sily.F_sum = F_sum;
end
