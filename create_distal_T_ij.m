function T_ij = create_distal_T_ij(a,alpha,d,theta)
ca = cosd(alpha);
sa = sind(alpha);
ct = cosd(theta);
st = sind(theta);

T_ij = [ct -ca*st sa*st a*ct ; st ca*ct -sa*ct a*st ; 0 sa ca d; 0 0 0 1];
end