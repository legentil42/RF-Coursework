clear all
close all
clc
% 
% syms d1 L1 L2 L3

d1 = 1;
L1 = 1;
L2 = 1;
L3 = 1;

%a utiliser pour obtenir l'expression litérale du FK

% angles des liaisons pivots en RAD
Q1 =0 *3.1415/180;
Q2 =0 *3.1415/180;
Q3 =0 *3.1415/180;
Q4 =0 *3.1415/180;
Q5 =0 *3.1415/180;

% Q1 = q1*180/pi;
% Q2 = q2*180/pi;
% Q3 = q3*180/pi;
% Q4 = q4*180/pi;
% Q5 = q5*180/pi;


%calculate the matrixes
% T_01 = create_distal_T_ij(0 , 0    , 0  ,0);
% T_12 = create_distal_T_ij(0 , 90 ,   d1 ,Q1);
% T_23 = create_distal_T_ij(L1, 0    , 0  ,Q2);
% T_34 = create_distal_T_ij(L2, 0    , 0  ,Q3);
% T_45 = create_distal_T_ij(0 , -90,   0  ,Q4);
% T_56 = create_distal_T_ij(L3 , 0    , 0 ,Q5);

% T_13 = T_12 *T_23;
% T_14 = T_12 *T_23  *T_34;
% T_15 = T_12 *T_23  *T_34 *T_45;
% T_16 = T_12 *T_23  *T_34 *T_45 *T_56;

% %a utiliser pour obtenir l'expression litérale du FK
%sympref('AbbreviateOutput', false)

% %les positions de chaque liaison
% x1=0;
% y1=0;
% z1=0;

% x2=T_12(1,4);
% y2=T_12(2,4);
% z2=T_12(3,4);

% x3=T_13(1,4);
% y3=T_13(2,4);
% z3=T_13(3,4);

% x4=T_14(1,4);
% y4=T_14(2,4);
% z4=T_14(3,4);

% x5=T_15(1,4);
% y5=T_15(2,4);
% z5=T_15(3,4);

% x6=T_16(1,4);
% y6=T_16(2,4);
% z6=T_16(3,4);

% %vecteurs avec toutes les positions des joints
% xx=[x1;x2;x3;x4;x5;x6];
% yy=[y1;y2;y3;y4;y5;y6];
% zz=[z1;z2;z3;z4;z5;z6];


% figure (1)
% set(1,'position')

% plot3(xx,yy,zz,'ko-','Linewidth',2)  % plot the  position of the robot
% axis equal
% hold on
% title('Tip Trajectory') ; xlabel('x (m)') ; ylabel('y (m)') ;
% hold off



% %en 2D mais c'est nul
% figure (2) 
% set(2,'position')
% 
% plot(xx,yy,'ko-','Linewidth',2)
% axis equal
% hold on
% 
% xlabel('x (m)') ; ylabel('y (m)') ;
% axis([-2 2 -2 2])
% hold off

%                                                   Workspace


% angles des liaisons pivots en RAD
step = 360/50;
nb_points = round(360/step);
disp(nb_points);
disp(nb_points^2)
xwork = zeros(nb_points^2) ; % reserving space for the variables, because
ywork = zeros(nb_points^2) ; % otherwise they would be created later within a loop.
zwork = zeros(nb_points^2);
i=1;
q5 = 0;
q4 = -90;
q3 = 0;
max = 0;
for q1 = 0:step:360
    for q2 = 0:step:360

                L_q = [q1 q2 q3 q4 q5];
                pos = forward_kinematics(L_q);
                if (pos(1)^2+pos(2)^2+pos(3)^2)^0.5 >0
                    max = (pos(1)^2+pos(2)^2+pos(3)^2)^0.5;
                    xwork(i) = pos(1);
                    ywork(i) = pos(2);
                    zwork(i) = pos(3);
                    i = i+1;
        end
    end
end    


figure (3)
set(3,'position')
plot3(0,0,0,'o')
plot3([-3,-3,3,3,-3],[-3,3,3,-3,-3],[0,0,0,0,0],'.-')
hold on
plot3(xwork,ywork,zwork,'rx')  % plot the  workspace of the robot
axis equal

title('Workspace') ; xlabel('x (m)') ; ylabel('y (m)') ;
hold off


% a = 0: 20: 360
% a = a/20

