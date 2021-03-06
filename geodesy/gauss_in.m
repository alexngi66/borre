function [s,azi1,azi2] = gauss_in(phi1,lambda1,phi2,lambda2,i)
%GAUSS_IN The geodetic inverse problem solved by means of
%	       Gauss' mid-latitude formulas.
%         Given the coordinates (phi1, lambda1), and (phi2, lambda2)
%         of two points in the format [degrees minutes seconds].
%         The choices i of Reference Ellipsoid are the following:
%              1. International Ellipsoid 1924
%              2. International Ellipsoid 1967
%              3. World Geodetic System 1972
%              4. Geodetic Reference System 1980
%              5. World Geodetic System 1984
%         Unknowns are the distance s (in meters) and the mutual
%         azimuths (in degrees).

%Kai Borre 10-13-98
%Copyright (c) by Kai Borre
%$Revision: 1.0 $  $Date: 1998/10/23  $

b1 = phi1(1)+phi1(2)/60+phi1(3)/3600;
b1 = b1*pi/180;
l1 = lambda1(1)+lambda1(2)/60+lambda1(3)/3600;
l1 = l1*pi/180;
b2 = phi2(1)+phi2(2)/60+phi2(3)/3600;
b2 = b2*pi/180;
l2 = lambda2(1)+lambda2(2)/60+lambda2(3)/3600;
l2 = l2*pi/180;
a = [6378388 6378160 6378135 6378137 6378137];
f = [1/297 1/298.247 1/298.26 1/298.257222101 1/298.257223563];
ex2 = (2-f(i))*f(i)/((1-f(i))^2);
b = (b1+b2)/2;
t2 = (sin(b)/cos(b))^2;
eta2 = ex2*(cos(b))^2;
V2 = 1+ex2*(cos(b))^2;
V4 = V2*V2;
N1 = a(i)*sqrt((1+ex2)/V2);
db = b2-b1;
b2 = (db)^2;
br = db/V2;
dl = l2-l1;
ss = N1*dl*cos(b)*(1-(dl*sin(b))^2/24 ...
           			      +(1+eta2-9*eta2*t2)*b2/(24*V4));
sc = N1*br*cos(dl/2)*(1+(1-2*eta2)*(dl*cos(b))^2/24 ...
			           	   +eta2*(1-t2)*(br)^2/(24*V4));
deltaA = dl*sin(b)*(1+(1+eta2)*(dl*cos(b))^2/12 ...
				            +(3+8*eta2)*b2/(24*V4));
s = sqrt(ss^2+sc^2);
az = atan2(ss,sc);
az1 = (az-deltaA/2)*180/pi;
az2 = (az+deltaA/2)*180/pi+180;
if az1 < 0, az1 = az1+180, end
if az2 > 360, az2 = az2-360, end

azi1 = zeros(1,3);
azi1(1) = fix(az1);
azi1(2) = fix(rem(az1,azi1(1))*60);
azi1(3) = (az1-azi1(1)-azi1(2)/60)*3600;
azi2 = zeros(1,3);
azi2(1) = fix(az2);
azi2(2) = fix(rem(az2,azi2(1))*60);
azi2(3) = (az2-azi2(1)-azi2(2)/60)*3600;
fprintf('\n  distance = %12.3f',s)
fprintf('\n  azimuth1 = %3.0f %2.0f %8.5f',azi1(1),azi1(2),azi1(3))
fprintf('\n  azimuth2 = %3.0f %2.0f %8.5f\n',azi2(1),azi2(2),azi2(3))
%%%%%%%%%%%%%%%%%% end gauss_in.m  %%%%%%%%%%%%%%%%%%%
