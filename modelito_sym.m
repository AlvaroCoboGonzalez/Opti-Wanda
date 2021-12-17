function obj = modelito_sym(x,p)

    run("ctes.m");
    postes=reshape(x, 3, 2)';   %2 focos por cuadrante

    postes_sym=[];
    for poste=postes'   %añadir los simétricos
        tmp=symm(poste',w,l,h,R);
        tmp=reshape(tmp, 3, 4)';
        postes_sym=[postes_sym;tmp];
    end

    postes=postes_sym;  %aquí no ha pasado nada

    %% OBJETIVOS
    t=visibilidad(n,h,r,R,rho,Cd,V,S_1,W_1,rho_acero,Rp02);
    P=potencia(n,Np,P_1,eta_luz);
    I_m=intensidad_m(eta_lum*P_1*n,postes,R,h,w,l,m1,m2);
    eps=intensidad_s(eta_lum*P_1*n,I_m,postes,R,h,w,l,m1,m2);

    t_adim = t/t_reff;
    P_adim = P/P_reff;
    I_adim = -(I_m/I_reff-1);
    eps_adim = 100*eps/I_reff;

    obj = p*I_adim + (1-p)*eps_adim;

end
