function I = refind_par(C,Z,L_f,G,Y,Y1,Sex,i,I)
% ������� � ������� ����� ����� �������� �� ������� �����
z=Z(i,:);
z(z==0)=[];

I=[I z(1:2)];

S=Sex(z(3:end));

j=z(find(S==0)+2);
I=[I j];

j=z(find(S==1)+2);
for k=1:length(j)
    [xp yp]=find(Z(:,1:2)==j(k));
    if length(xp)>0
        I=refind_par(C,Z,L_f,G,Y,Y1,Sex,xp,I);
    else
        I=[I j(k)];
    end
end


end

