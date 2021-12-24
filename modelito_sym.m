function obj = modelito_sym(x,p,n_F)

    run("ctes.m");
    n=n_F;
    postes=reshape(x, 3, [])';   %2 focos por cuadrante

    postes_sym=[];
    for poste=postes'   %añadir los simétricos
        tmp=symm(poste',w,l,h,R);
        tmp=reshape(tmp, 3, 4)';
        postes_sym=[postes_sym;tmp];
    end

    postes=postes_sym;  %aquí no ha pasado nada

    %% OBJETIVOS
    t=visibilidad(n,h,r,R,rho,Cd,V,S_1,W_1,rho_acero,Rp02,MS);
    P=potencia(n,Np,P_1,eta_luz);
    I_m=intensidad_m(eta_lum*P_1*n,postes,R,h,w,l,m1,m2);
    eps=intensidad_s(eta_lum*P_1*n,I_m,postes,R,h,w,l,m1,m2);

    I_adim = -(I_m/I_reff-1);
    eps_adim = 100*eps/I_reff;
    t_adim = t/t_reff;
    P_adim = P/P_reff;

    obj_adim = [I_adim,eps_adim,t_adim,P_adim];
    p_norm = p./sum(p);

    obj = sum(obj_adim.*p_norm);

end
