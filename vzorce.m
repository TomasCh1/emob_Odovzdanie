function vysledky = vzorce(U, I, R_mOhm, eta_pct, t_min)
     
    R_Ohm   = R_mOhm / 1000;   % Prepočet mOhm -> Ohm
    eta_num = eta_pct / 100;
    t_h     = t_min / 60;

    P_zdroja = (U * I) / 1000;
    P_straty = (R_Ohm .* (I.^2)) / 1000;
    P_motor  = P_zdroja - P_straty;
    P_mech   = P_motor * eta_num;
    E_zdroja = P_zdroja * t_h;

    vysledky.P_zdroja = P_zdroja;
    vysledky.P_straty = P_straty;
    vysledky.P_motor  = P_motor;
    vysledky.P_mech   = P_mech;
    vysledky.E_zdroja = E_zdroja;
end