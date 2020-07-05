function [] = sheme_it_2(C,Z,L_f,h)
c=size(C,3);
G=table('size',[c 3],'VariableTypes',{'double','string','double'},'VariableNames',{'N', 'name', 'Year'});
for i=1:c
    G.N(i)=[i];
    G.sex(i)=strcmp('у',C(5,4,i)); %1 - мальчик, 0 - девочка)
    G.name(i)=strcat(C(3,4,i),{' '},C(4,4,i));
    G.Year(i)=str2double(cell2mat(C(1,4,i)));
    
    Y(i)=str2double(cell2mat(C(1,4,i)));
    Sex(i)=double(strcmp('у',C(5,4,i)));
end


%сортировка пар в Z, сначала м, потом ж в парах
N=size(Z,1);
for i=1:N
    pol=Sex(Z(i,1));
    if pol==0
        d=Z(i,1);
        Z(i,1)=Z(i,2);
        Z(i,2)=d;
    end
end

Y1=ones(size(Y));
for i=1:size(Z,1) % определяем поколение если пара из разных поколений - максимальное из них
    z=Z(i,:);
    z(z==0)=[];
    N=max(Y1(z(1)),Y1(z(2)));
    Y1(z(1))=N;
    Y1(z(2))=N;
    if length(z)>2
        Y1(z(3:end))=N+1;
    end
end

x=zeros([1 c]);
Y1=max(Y1)-Y1+1;

h=1;

for h=1:L_f
I=[];
I = refind_par(C,Z,L_f,G,Y,Y1,Sex,h,I);

k=Y1(I);
m=max(accumarray(Y1',1));

Ik=unique(I,'stable');

Kk=Y1(Ik);

figure(h);
hold off
plot(0,0,'ow');
hold on
X=zeros(size(Ik));
for i=min(Kk):max(Kk)
    L=length(find(Kk==i));
    x=m/L:m/L:m;
    plot(x,ones(size(x))*i,'o');
    
    for j=1:length(x)
        plot([x(j) x(j)],[i-0.25 i+0.25],'k')
    end
    
    X(find(Kk==i))=x;
    
    plot(m+2,0,'ow');
end
title(C(4,4,I(1)));


for i=1:length(Ik)
    j=Ik(i);
    
    if Sex(j)==0
        %определить наличие супруга
    else
        %определить супругу и соединить.
        if length( find(Z(:,1:2)==j) )>0
            [xp yp]=find(Z(:,1:2)==j);
            ki=find(Ik==Z(xp,2));
            plot([X(i) X(i) X(ki) X(ki)], [Kk(i)-0.25 Kk(i)-0.5 Kk(i)-0.5 Kk(i)-0.25],'k');
        end
    end
    
    if length( find(Z(:,3:5)==j) )>0
        [xp yp]=find(Z(:,3:5)==j);
        ki=find(Ik==Z(xp,1));
        kj=find(Ik==Z(xp,2));
        plot([X(i) X(i) X(ki)],[Kk(i)+0.25 Kk(ki)-0.5 Kk(ki)-0.5],'k')
    end
    
    
    
    text(X(i)+0.25,Kk(i),num2str(Ik(i)),'HorizontalAlignment' ,'left','FontSize',6,'Color','k');
    
    
    
%     if length( find(Z(:,3:5)==j) )>0
%         [xp yp]=find(Z(:,3:5)==j);
%         ki=find(Ik==Z(xp,1));
%         plot([X(i) X(ki)], [Kk(i) Kk(ki)],'b');
%         ki=find(Ik==Z(xp,2));
%         plot([X(i) X(ki)], [Kk(i) Kk(ki)],'r');
%     end
end
            
hold off               

            
         
end



end


