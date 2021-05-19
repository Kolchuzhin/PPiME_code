%=========================================================================%
%=========================================================================%
function c12_=c12(x,y)
%-------------------------------------------------------------------------%
% c12.m
%
% Dependencies:  gccond
%
% Reference: A. Butymov, June 2006, Thesis for: MSc., NSTU, Novosibirsk
%
% Status: 
% 2021-01-13 by vkolchuzhin
%-------------------------------------------------------------------------%
% the function return c12 element/component of the tensor c_
%   c_ == electrical conductivity tensor
%   gcT6 == mechanical stress in MPa
%=========================================================================%
%=========================================================================%
global gcT6
c_=gccond(gcT6);
c12_=c_(1,2);
%=========================================================================%
%=========================================================================%