%=========================================================================%
%=========================================================================%
% example #1
%-------------------------------------------------------------------------%
% main1.m
%
% Dependencies / List of Functions:

% gcparams
% gcgeometry
% gcbound
% Gcbound1
% gccond
% gssolve
% gsanisotropic
% gcpost
% c11
% c12
% import_process
% rotshape
% fc_geometry
% fc_bound
% fc_params
% gcoutpic
% f_ba
% fc_main1
% y_ky_b
% UL
% ro_ot_N
% uout_most
% z_ot_formi_cross
% z_ot_formi_sim2
% z_ot_T6
% main1
% main19
% main20
%
% Reference: A. Butymov, June 2006, Thesis for: MSc., NSTU, Novosibirsk
%
% Status: 
% 2021-01-13 by vkolchuzhin
%=========================================================================%
%=========================================================================%
% set parameters 
params1;

% geometry plot
pdegplot(g);

% solution
[u,p,e,t]=adaptmesh(g,b,c,a,f);

% plot
pdemesh(p,e,t);

% surface plot
pdesurf(p,t,u)

% Kf and Uout calculations 
post1
%=========================================================================%
%=========================================================================%
