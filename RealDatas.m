fileName1=["EMISAR data and Matlab function/EMISAR data and Matlab function/m0812R8k.hh","EMISAR data and Matlab function/EMISAR data and Matlab function/m0812R8k.hv","EMISAR data and Matlab function/EMISAR data and Matlab function/m0812R8k.vv";"EMISAR data and Matlab function/EMISAR data and Matlab function/m0842R8k.hh","EMISAR data and Matlab function/EMISAR data and Matlab function/m0842R8k.hv","EMISAR data and Matlab function/EMISAR data and Matlab function/m0842R8k.vv"];
nra = 4096;
az_start = 0;
az_num = 8192;
azimuthLooks = 7;
rangeLooks = 3;
multi=30;
T11m=zeros(3,3,multi,multi);
T22m=zeros(3,3,multi,multi);
O12m=zeros(3,3,multi,multi);
T11=zeros(3,3);
T22=zeros(3,3);
O12=zeros(3,3);
k1=zeros(3,multi,multi);
k2=zeros(3,multi,multi);
S=zeros(multi, multi,3,2);

y = 200;
x = 7350;
for i=1:2
    for j=1:3
           data=read_emisar_data(fileName1(i,j), nra, az_start, az_num);
           S(:,:,j,i)=data(y:1:y+multi-1,x:1:x+multi-1);
    end
    
end
imagesc(abs(data),[0 0.5])
k1(1,:,:)=S(1:multi,1:multi,1,1)+S(1:multi,1:multi,3,1);
k1(2,:,:)=S(1:multi,1:multi,1,1)-S(1:multi,1:multi,3,1);
k1(3,:,:)=S(1:multi,1:multi,2,1);
k2(1,:,:)=S(1:multi,1:multi,1,2)+S(1:multi,1:multi,3,2);
k2(2,:,:)=S(1:multi,1:multi,1,2)-S(1:multi,1:multi,3,2);
k2(3,:,:)=S(1:multi,1:multi,2,2);

for j=1:multi
    for i=1:multi
        T11m(:,:,i,j)=k1(:,i,j)*k1(:,i,j)';
        T22m(:,:,i,j)=k2(:,i,j)*k2(:,i,j)';
        O12m(:,:,i,j)=k1(:,i,j)*k2(:,i,j)';
        T11=T11+T11m(:,:,i,j);
        T22=T22+T22m(:,:,i,j);
        O12=O12+O12m(:,:,i,j);
    end
end
T11=T11./(multi*multi);
T22=T22./(multi*multi);
O12=O12./(multi*multi);