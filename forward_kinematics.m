function end_pos = forward_kinematics(L_q)
% angles des liaisons pivots en RAD
Q1 = L_q(1);
Q2 =L_q(2);
Q3 =L_q(3);
Q4 =L_q(4);
Q5 =L_q(5);

d1 = 1;
L1 = 1;
L2 = 1;
L3 = 1;

%calculate the matrixes
T_01 = create_distal_T_ij(0 , 0    , 0  ,0);
T_12 = create_distal_T_ij(0 , 90 ,   d1 ,Q1);
T_23 = create_distal_T_ij(L1, 0    , 0  ,Q2);
T_34 = create_distal_T_ij(L2, 0    , 0  ,Q3);
T_45 = create_distal_T_ij(0 , -90,   0  ,Q4);
T_56 = create_distal_T_ij(0 , 0    , L3 ,Q5);


T_16 = T_12 * T_23  *T_34 *T_45 *T_56;
end_pos = [T_16(1,4) T_16(2,4) T_16(3,4)];
end