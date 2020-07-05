function [] = sheme_it(C,Z,L_f,h)
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

%положение по иксу для всех родичей
x1=zeros([1 c]);
fi=repmat([0 10], [1 L_f]);
fj=0:50:50*L_f;
fj=fj(1:L_f);
fj=reshape([fj;fj],[1 2*L_f]);
x1(1:2*L_f)=fi+fj;
x1(2*L_f+1:end)=50*L_f;

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

% Давайте сначала положим всех мальчиков в нужные рода?
M=find(Sex==1);
M(M<=2*L_f)=[];
for i=1:length(M)
    [dx dy]=find(Z(:,3:5)==M(i));
    x1(M(i))=x1(Z(dx,1));
end

% Теперь девочек в рода мужей( или отцов, если они не замужем)
F=find(Sex==0);
F(F<=2*L_f)=[];
for i=1:length(F)
    %на замужество
    [dx dy]=find(Z(:,2)==F(i));
    if dx
        x1(F(i))=x1(Z(dx,1))+10;
        
    else
        [dx dy]=find(Z(:,3:5)==F(i));
        x1(F(i))=x1(Z(dx,2));
    end
end
    

%% попробовать поиграться с разложением в роду?..


N=size(Z,1);
z1=x1;
figure;
hold on;
for i=1:N
    z=Z(i,:);
    z(z==0)=[];
    
    
    
    
    x=[z1(z(1)) z1(z(2))];
    
    y=[Y(z(1)) Y(z(2))];
    plot(x,y,'k')
    
    
    if i<=L_f
        pol=Sex(z(1));
        if pol==0 %первая - девочка
            plot(x(1), y(1),'or') 
            plot(x(2), y(2),'*b')
        else
            plot(x(2), y(2),'or')
            plot(x(1), y(1),'*b')
        end
    end
        
    
    x0=sum(x)/2; y0=sum(y)/2;
    x=[x0];y=[y0];
    z=z(3:end);
    n=length(z);
    for j=1:n
        pol=Sex(z(j));
        x=[x x0 z1(Z(i,j+2))];
        y=[y y0 Y(z(j))];
        if pol==0
            plot(z1(Z(i,j+2)), Y(z(j)),'or')
        else
            plot(z1(Z(i,j+2)), Y(z(j)),'*b')
            
        end
        
    end
    
    if L_f<=6
    if x0==5
        plot(x,y,'c')
    elseif x0==55
        plot(x,y,'m')
    elseif x0==105
        plot(x,y,'y')
    elseif x0==155
        plot(x,y,'r')
    elseif x0==205
        plot(x,y,'g')
    else
        plot(x,y,'b')
    end
    else
        plot(x,y,'r')
    end
        
    
    
end

for i=1:c
    if Sex(i)==1
        text(x1(i)-5,Y(i),strcat(num2str(G.N(i)),{' '},G.name(i)),'HorizontalAlignment' ,'right','FontSize',6,'Color','b');
    else
        text(x1(i)+5,Y(i),strcat(num2str(G.N(i)),{' '},G.name(i)),'HorizontalAlignment' ,'left','FontSize',6,'Color','r');
    end
        
end
title([num2str(h) ' поколений']);
plot([min(x1)-30 max(x1)+30],[0 0],'+w')
end

