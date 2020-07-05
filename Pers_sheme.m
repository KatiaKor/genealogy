c=size(C,3);
G=table('size',[c 4],'VariableTypes',{'double','logical','string','double'},'VariableNames',{'N','sex', 'name', 'Year'});
for i=1:c
    G.N(i)=[i];
    G.sex(i)=strcmp('у',C(5,4,i)); %1 - мальчик, 0 - девочка)
    G.name(i)=strcat(C(3,4,i),{' '},C(4,4,i));
    G.Year(i)=str2double(cell2mat(C(1,4,i)));
    %G(i,:)=table([i], C(3,4,i), C(1,2,i), C(1,3,i), str2double(cell2mat(C(1,4,i))));
end

G1=sortrows(G,4,'descend');
G1=sortrows(G,1);
% i=170;
% Ga=[];
% 
% Ga=refind_par(i,G1,Ga);

N=size(Z,1);
z1=1:c; %список точек с постепенной заменой на координаты по х
%z1(1:2*L_f)=z1(1:2*L_f)*10;
fi=repmat([0 10], [1 L_f]);
fj=0:30:30*L_f;
fj=fj(1:L_f);
fj=reshape([fj;fj],[1 2*L_f]);
z1(1:2*L_f)=fi+fj;
z1(2*L_f+1:end)=30*L_f;

for i=1:N %сначала м, потом ж в парах
    pol=G1.sex(Z(i,1));
    if pol==0
        d=Z(i,1);
        Z(i,1)=Z(i,2);
        Z(i,2)=d;
    end
end

for i=2*L_f+1:c
    [di dj]=find(Z==i);
    di1=di;dj1=dj;
    di(dj<=2)=[];%где родичи
    dj(dj<=2)=[];% какой ребенок в семье
    dj=dj-2;
    di1(dj1>2)=[];% где он пара
    dj1(dj1>2)=[];
    n=length(find(Z(di,:)>0))-2; %число детей
    
    pol=G.sex(Z(di,dj));

    if pol==1 %для мальчика
        xi1=z1(di*2); % х мамы
        xi2=z1(di*2-1); % х папы
        x=(xi1+xi2)/2+abs(xi1-xi2)*2/3/n*dj-abs(xi1-xi2)*2/3;
        z1(i)=x;
    else %для девочки
        if di1 %если замужем
            if dj1==2
                x=Z(di1,1); %номер мужа
            else
                x=Z(di1,2);
            end
            
            z1(z1>z1(x))=z1(z1>z1(x))+10;
            z1(i)=z1(x)+10;

        else %если не замужем
            xi1=z1(di*2); % х мамы
            xi2=z1(di*2+1); % х папы

            x=(xi1+xi2)/2+20/n*dj-20;
            z1(i)=x;    
            
        end
    end
    z1(z1>z1(i))=z1(z1>z1(i))+0.5;
     
        

end




% 
% if di
%     z1(di(1),dj(1))=z1(i,j+2);
% end




figure;
hold on;
for i=1:N
    z=Z(i,:);
    z(z==0)=[];
    
    
    
    
    x=[z1(z(1)) z1(z(2))];
    
    y=[G1.Year(z(1)) G1.Year(z(2))];
    plot(x,y,'k')
    
    
    if i<=L_f
        pol=G1.sex(z(1));
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
        pol=G1.sex(z(j));
        
        if pol==0
            plot(z1(Z(i,j+2)), G1.Year(z(j)),'or')
        else
            plot(z1(Z(i,j+2)), G1.Year(z(j)),'*b')
            x=[x x0 z1(Z(i,j+2))];
            y=[y y0 G1.Year(z(j))];
        end
        
    end
    plot(x,y,'r')
    
    
end
    
    
    





