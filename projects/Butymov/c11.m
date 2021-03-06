%=========================================================================%
%=========================================================================%
function c11_=c11(x,y)
%-------------------------------------------------------------------------%
% c11.m
%
% Dependencies:  gccond
%
% Reference: A. Butymov, June 2006, Thesis for: MSc., NSTU, Novosibirsk
%
% Status: 
% 2021-01-13 by vkolchuzhin
%-------------------------------------------------------------------------%
% the function return c11 element/component of the tensor c_
%   c_ == electrical conductivity tensor
%   gcT6 == mechanical stress in MPa

%=========================================================================%
%=========================================================================%
global gcT6
c_=gccond(gcT6);
c11_=c_(1,1);
%=========================================================================%
%=========================================================================%
