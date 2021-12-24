%% CTES DEL PROBLEMA
%mecánicas
r = 0.1;                %m
R = 2.5;                %m
rho=1.225;              %kg/m^3
Cd=1.28;                %COEFICIENTE DE DRAG
V=52;                   %m/s
S_1 = 0.0675;           %m^2
W_1 = 3*9.81;           %N
rho_acero = 7850;       %kg/m^3
Rp02 = 235*10^6;        %Pa
coef_min = 1.1;         %COEFICIENTE DE MINORACIÓN DE LA RESISTENCIA DEL MATERIAL
coef_may_perm = 1.35;   %COEFICIENTE DE MAYORACIÓN DE LAS ACCIONES PERMANENTES
coef_may_var = 1.5;     %COEFICIENTE DE MAYORACIÓN DE LAS ACCIONES VARIABLES
%energéticas
P_1 = 150;              %W
eta_lum = 110;          %lm/W
eta_luz = 0.9;          %EFICIENCIA ENERGÉTICA
%dimensiones del campo
w = 70;                 %m
l = 100;                %m
%distribución intensidad lumínica
m1 = 3;
m2 = 30;

%% VALORES DE REFERENCIA
P_reff=100000;          %W
t_reff=0.005;           %m
I_reff=14*10^6;         %lm

%% PARÁMETROS
h=30;                   %m
Np=6;                   %Nº DE POSTES

%% VARIABLES
n=150;                  %Nº DE LUCES POR POSTE

%% OPTIMIZADOR
%Restricciones
res_chi = [0,2*pi];     %chi de 0 a 2*pi
res_chi_sym = [0,pi/2]; %chi de 0 a pi/2
res_th = [0,2*pi];      %theta de 0 a 2*pi
res_g = [0,pi/2];       %gammaa de 0 a pi/2
res = [res_chi;res_th;res_g];
res = repmat(res,[Np 1]);

res_sym = [res_chi_sym;res_th;res_g];
res_sym = repmat(res_sym,[2 1]);    %2postes por cuadrante
