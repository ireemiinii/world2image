% Firstly read image
Image_106 = imread('106.jp2');

%Rotation angles and convert to radian
omega=-0.53451*pi/200;
phi=-0.19025*pi/200;
kappa=-0.13489*pi/200;

% Camera coord system focal length
f = 120; %mm

% Focal length
fpix=10000;

% Projection Centres In Camera
cx=497312.996; %m
cy=5419477.065; %m
cz=1158.888; %m

%File coord system row and column
px = 6912; % row
py = 3840; % col

% Rotation Matrix
R(1,1) = cos(phi)*cos(kappa) + sin(phi)*sin(omega)*sin(kappa);
R(1,2) = cos(omega)*sin(kappa);
R(1,3) = -sin(phi)*cos(kappa)+cos(phi)*sin(omega)*sin(kappa);
R(1,4)= 0;
R(2,1) = -cos(phi) * sin(kappa)+ sin(phi)*sin(omega)*cos(kappa);
R(2,2) = cos(omega)*cos(kappa);
R(2,3) = sin(phi)*sin(kappa)+cos(phi)*sin(omega)*cos(kappa);
R(2,4) = 0;
R(3,1) = sin(phi)*cos(omega);
R(3,2) = -sin(omega);
R(3,3) = cos(omega)*cos(phi);
R(3,4) = 0;
R(4,:)=[0,0,0,1];

%Perspective Projection Matrix 
P(1,:)=[-f,0,0,0];
P(2,:)=[0,-f,0,0];
P(3,:)=[0,0,1,0];

% Translation Matrix
T(1,:)=[1,0,0,-cx];
T(2,:)=[0,1,0,-cy];
T(3,:)=[0,0,1,-cz];
T(4,:)=[0,0,0,1];

% Read the excel file
R_t = readtable('buildings_coord.csv');

% Open the array in matlab
tabl=R_t(:,[1,2,3]);
A = table2array(tabl);
U=A(:,[1]);
V=A(:,[2]);
W=A(:,[3]);

% Create the world coordinates 4x1256
for i = 1:1256  
    Pw(:,i)=[U(i);V(i);W(i);1];      
end

%Pf = film coordinates
Pf=P*R*T*Pw;

%calculating film coordinates
Px = [(Pf(1,:)./Pf(3,:));(Pf(2,:)./Pf(3,:))];

% calculate pixel coord (u,v)
imgu = py + Px(1,:)/(f/fpix);
imgv = px - Px(2,:)/(f/fpix);

%Show the image 
figure;imshow(Image_106,[]);

axis on
hold on

plot(imgu(1,:),imgv(1,:),'m.', 'MarkerSize',11, 'LineWidth',3);
plot(imgu(1,:),imgv(1,:),'y--', 'MarkerSize',11, 'LineWidth',1);
