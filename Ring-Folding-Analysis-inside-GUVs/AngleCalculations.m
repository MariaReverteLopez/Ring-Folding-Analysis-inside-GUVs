%%%% Script to measure the angle between to vectors 
% The idea is to take the position of the bundle end that TrackMate has
% dectected and create a vector from that coordiante point and the center
% point of the vesicle

%% first we create a matrix to retrieve the number of spots per frame and the total number of spots over the timeseries 
%TrackMateBook in this case is a 76x2 matrix with the X and Y coordinates
%obtained from TrackMate
sz=size(TrackMateBook);

% we take the total number of spots which in this case is 2
rows=sz(1);

% we calculate the amount of angles we will obtain 
finalnumangles=rows/2;
% finalnumangles=41;

n=1;
vecta=zeros(2,1);
vectb=zeros(2,1);
% p = [0;0;1];

% we take the center point of the GUV as origin to build both vectors 
middle=[174;158];
cosinetheta = 0;


angles=zeros(finalnumangles,1);
r=1;



for i = 1:finalnumangles
%% we next build the vectors by extracting the X and Y coordenates of both spots from TrackMate
% we have to consider that we will have a new pair of spots after n + 2 

    vecta(1,1)=TrackMateBook(n,1);
    vecta(2,1)=TrackMateBook(n,2);

    vectb(1,1)=TrackMateBook(n+1,1);
    vectb(2,1)=TrackMateBook(n+1,2);

    vect0A=vecta-middle;
    vect0B=vectb-middle;

%% we calculate the cosine of the vectors and the angle in degrees

cosinetheta=(dot(vect0A,vect0B) / (norm(vect0A)*norm(vect0B)));
Thetadegrees=acosd(cosinetheta);

    angles(r,1)=Thetadegrees;
    r = r+1;
    n = n+2;

end



