% n=[1:100]
% h=30

% plot(n, f_t(n,h,r,R,rho,Cd,V,S_1,W_1,rho_acero,Rp02,coef_min,coef_may_perm,coef_may_var))

function t = visibilidad(n,h,r,R,rho,Cd,V,S_1,W_1,rho_acero,Rp02,coef_min,coef_may_perm,coef_may_var)

    D = 0.5*rho*(n*S_1)* V^2 * Cd*coef_may_var;
    M_y = W_1*n*R*coef_may_perm + D*(R+h);
    sigmax_max = Rp02/coef_min;

% 
%     syms t;
%     W_p = pi*((r+t)^2 - r^2)*(h + pi/2*r) * rho_acero*coef_may_perm;
%     eqn=[abs(-4/pi * M_y / ((t+r)^4 - r^4) *r + (W_p + W_1*n)/((r+t)^2 - r^2))==sigmax_max];
% 
%     sol=double(solve(eqn,t));
%     t=0;
% 
%     for el=sol'
%         if imag(el)==0
%             if real(el)>t
%                 t=el;
%             end
%         end
%     end
% 
%     sol
    
    a=-4*M_y/pi*r;
    b=(h+pi/2*r)*rho_acero*pi*coef_may_perm;
    c=W_1*n;

    l1=(b+sigmax_max);
    l2=c;
    l3=(a+c*r^2+r^4*(-sigmax_max-b));

    t=sqrt(0.5*(-l2+sqrt(l2.^2-4*l1.*l3))./l1)-r;
    
end
