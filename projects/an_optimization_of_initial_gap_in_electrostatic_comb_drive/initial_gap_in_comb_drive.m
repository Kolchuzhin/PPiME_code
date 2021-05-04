function k_opt=initial_gap_in_comb_drive(w_finger,d2)
%=========================================================================%
% PURPOSE: 
%          an analytical model (1D) for optimal initial gap (k=d1/d2) 
%          in electrostatic comb drive with transverse displacement 
%       in term of the capacitance sensitivity vs width of the cell (area)
%
% FILE: initial_gap_in_comb_drive.m
%
% INPUT:    w_finger == width of the movable finger
%                 d2 == smaller air gap
%
% REFERENCEs: 
% 1. "An optimization of initial gap in electrostatic comb drive",
% 13th International Scientific-Technical Conference on Actual Problems 
% of Electronics Instrument Engineering (APEIE), October 2016 
% DOI: 10.1109/APEIE.2016.7802182
% 2. github.com/Kolchuzhin/PPiME_code/tree/main/projects/
% 
%-------------------------------------------------------------------------%
%       o-------o----o-------o           x
%       |\\\\\\\\\\\\|       |           ^ 
%       o-------o----o       |           |
%       |   d2  o----o-------o           |
%       |   w_f |////////////|           #--->  y
%       |       o----o-------o      
%       |   d1               |           k=d1/d2
%       o-------o----o       |
%       |\\\\\\\\\\\\|       |
%       o------o-----o-------o 
%
% an electrostatic comb cell with transverse displacement (ux)
%-------------------------------------------------------------------------%
% written by Kolchuzhin V.A., LMGT, TU Chemnitz, 2008
% <vladimir.kolchuzhin@ieee.org>
% Status: 2021-05-04 GitHub release
%=========================================================================%
if nargin==0
    
    w_finger=[3]; d2=[2]; k_BDRIE=initial_gap_in_comb_drive(w_finger,d2);
    
    v_w_finger=[1:0.5:5]; v_d2=[2:0.5:10];
    %---------------------------------------------------------------------%
    for i=1:numel(v_w_finger)
        for j=1:numel(v_d2)
            X(i,j)=v_w_finger(i);
            Y(i,j)=v_d2(j);
            Z(i,j)=initial_gap_in_comb_drive(v_w_finger(i),v_d2(j));
        end
    end
    %---------------------------------------------------------------------%
    surf(X,Y,Z,'FaceAlpha',0.5)
    xlabel('width of the finger, um'); ylabel('d_2, um'); 
    zlabel('optimal factor k');
    hold on;
    az=-37.5*4; el=30; view(az, el);
    plot3(w_finger,d2,k_BDRIE,'ro','LineWidth',1,'MarkerFaceColor',[0.8 0.8 0.0]);
    
end
%=========================================================================%
% analytical model:
p=2.*w_finger./d2;
c=(p + sqrt((p+1).^2-1) + 1).^(1/3);
k_opt=c + 1./c;
%=========================================================================%
return