%Initialization and Random Point Generation
clear
point_sum=57600;
x = -600+1200*rand(1,point_sum);
y = -600+1200*rand(1,point_sum);

%Grid-based processing
side_num=sqrt(point_sum);
X=reshape(x,[side_num,side_num]);
Y=reshape(y,[side_num,side_num]);
% [X,Y] = meshgrid(x,y); 

%Two formulas used for simulating terrain surfaces
Z1 = 7*(cos(0.006*X)+cos(0.008*X))+12*(cos(0.01*Y)+cos(0.015*Y))+15*(cos(8*(10.^(-6))*X.^2+(10.^(-5))*Y.^2)+cos(1.2*(10.^(-5))*X.^2+2.5*(10.^(-5))*Y.^2-0.8))+3*((sin(0.025*X)).*(cos(0.018*Y))+(sin(0.018*X)).*(cos(0.01*Y)))+45*sin((10.^(-5))*Y.^2+0.005*X+0.003*Y-0.3)-(1.5*(10.^(-4))*X.^2)-(4*(10.^(-10))*X.^4)-(5*(10.^(-4))*Y.^2)+(8*(10.^(-10))*Y.^4)+(5*(10.^(-16))*(Y.^4).*(X.^2))+600;
Z2 = 7*(cos(0.006*X)+cos(0.008*X))+12*(cos(0.01*Y)+cos(0.015*Y))+15*(cos(8*(10.^(-6))*X.^2+(10.^(-5))*Y.^2)+cos(1.2*(10.^(-5))*X.^2+2.5*(10.^(-5))*Y.^2-0.8))+3*((sin(0.025*X)).*(cos(0.018*Y))+(sin(0.018*X)).*(cos(0.01*Y)))+45*sin((10.^(-5))*Y.^2+0.005*X+0.003*Y-0.3)-(1.5*(10.^(-4))*X.^2)-(4*(10.^(-10))*X.^4)-(5*(10.^(-4))*Y.^2)+(8*(10.^(-10))*Y.^4)+(5*(10.^(-16))*(Y.^4).*(X.^2))+5*sin((10.^(-5))*(Y.^2)+0.005*X+0.003*Y-0.3)+5*cos(8*(10.^(-6))*(X.^2)+(10.^(-5))*(Y.^2))+600;

%Ground ture surface
%Z1 =5*sin((10.^(-5))*(Y.^2)+0.005*X+0.003*Y-0.3)+5*cos(8*(10.^(-6))*(X.^2)+(10.^(-5))*(Y.^2));

%Three-dimensional mesh visualization
%Fig = mesh(X,Y,Z1);

%Three-dimensional scatter plot visualization
pix_count=side_num;
X_1wei=x;
Y_1wei=y;
Z1_1wei=reshape(Z1,[1,pix_count*pix_count]);
Z2_1wei=reshape(Z2,[1,pix_count*pix_count]);
figure
scatter3(X_1wei,Y_1wei,Z1_1wei,'.')
figure
 scatter3(X_1wei,Y_1wei,Z2_1wei,'.')

%Data Export
 x_y_z1=[];
 for i=1:1:length(X_1wei)
     hang=[];
     hang=[hang X_1wei(i)];hang=[hang Y_1wei(i)];hang=[hang Z1_1wei(i)];
     x_y_z1=[x_y_z1;hang];
 end
 xlswrite('T1_rand1.xlsx',x_y_z1);
 x_y_z2=[];
 for i=1:1:length(X_1wei)
     hang=[];
     hang=[hang X_1wei(i)];hang=[hang Y_1wei(i)];hang=[hang Z2_1wei(i)];
     x_y_z2=[x_y_z2;hang];
 end
 xlswrite('T2_rand1.xlsx',x_y_z2);
