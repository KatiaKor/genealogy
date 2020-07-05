%% добавить при отсутствии партнеров "новых" людей не из патрициев с приниманием имени рода


% %C=Pers_create({'Марс'},{'0'},A,B);
clear all
clc

Sho=0; % 1 - с отрисовкой схемы для каждого поколения, 2 - с неработающей попытой
%% Список фамилий
Fam={
'Аквилиус';
'Валерио';
'Вергилиус';
'Кассио';
'Клавдио';
'Корнелиус';
};
% 'Лукрецио';
% 'Нумицио'; 
% 'Папириус';
% 'Рутилио';
% 'Семпрониус';
% 'Сервилиус';
% 'Туллио';
% 'Фабио';
% 'Юниус';
% };
L_f=length(Fam);

%% Список имен
Nam_m={
'Август';'Авидий';'Авл';'Агриппа';'Аппий';'Аррунт';'Виктор';'Гай';'Гней';'Децим';'Камилл';'Кастор';'Квинт';
'Кезон';'Кесарий';'Консус';'Лавр';'Луций';'Мамерк';'Маний';'Марк';'Нумерий';'Октавий';'Праймус';'Прокул';
'Публий';'Пуллий';'Регулус';'Севир';'Секст';'Секунд';'Септим';'Сервий';'Спурий';'Стратор';'Терций';
'Тиберий';'Тит';'Флавий';'Цезон';'Юлий';'Юстас' };
L_nm=length(Nam_m);
N_m=zeros([L_nm 1]);

Nam_f={
'Августа';'Аврелия';'Амелия';'Антония';'Беатриса';'Валерия';'Вивиан';'Виргиния';'Грация';'Делия';'Домиция';
'Ида';'Каллиста';'Кассия';'Квинкция';'Клавдия';'Клио';'Корнелия';'Лаура';'Леонора';'Лукреция';'Невия';
'Октавия';'Петра';'Пиа';'Регула';'Руфина';'Руфия';'Сара';'Секстия';'Септимия';'Сервилия';'Сергия';'Тициния';
'Туллия';'Ульпия';'Фабиа';'Фабия';'Флавия';'Цецилия';'Эмилия';'Юлия'  };
L_nf=length(Nam_f);
N_f=zeros([L_nf 1]);
%% Создание первоначальных пар-родителей
Y=0;
Year=strcat({''},num2str(Y));
k=0;
for i=1:2*L_f
    if mod(i,2)==1 
        k=k+1;
    end
    Y=randi(20)+20;
    Year=strcat({''},num2str(-Y));
    F=Fam(k);
    
    C(:,:,i)=Pers_create(F,Year);
    if mod(i,2)==0
        C(5,2:4,i)={'х' 'х' 'х'};
        r=randi(L_nf);
        C(3,4,i)=Nam_f(r);%strcat(Nam_f(r),{' '},num2str(N_f(r)));
        N_f(r)=N_f(r)+1;
    else
        C(5,2:4,i)={'х' 'у' 'у'};
        r=randi(L_nm);
        C(3,4,i)=Nam_m(r);%strcat(Nam_m(r),{' '},num2str(N_m(r)));
        N_m(r)=N_m(r)+1;
    end
end

J=reshape(1:2*L_f,[2 L_f])'; % список пар

% % t=randi(L_f,[fix(L_f/3) 1]); %доп.братья тех
% % k=0;
% % for i=L_f*2+1:L_f*2+2*length(t)
% %     if mod(i,2)==1 
% %         k=k+1;
% %     end
% %     Y=randi(20)+20;
% %     Year=strcat({''},num2str(-Y));
% %     F=Fam(t(k));
% %     
% %     C(:,:,i)=Pers_create(F,Year);
% %     if mod(i,2)==0
% %         C(5,2:4,i)={'х' 'х' 'х'};
% %         r=randi(L_nf);
% %         C(3,4,i)=Nam_f(r);
% %     else
% %         C(5,2:4,i)={'х' 'у' 'у'};
% %         r=randi(L_nm);
% %         C(3,4,i)=Nam_m(r);
% %     end
% % end

%% поколение


N=size(C,3);
Z=[ J zeros([L_f 3])]; %список детей от пар.
count=N;
for i=1:2:N
    
    Par1=C(:,:,i);
    Par2=C(:,:,i+1);
    n=randi(2)+1; %число детей
    
    r=max(str2num(cell2mat(C(1,4,i))),str2num(cell2mat(C(1,4,i+1))));
    po=0;
    for j=1:n
        count=count+1;
        Y=randi(100)+r;
        Year=strcat({''},num2str(Y));   
        F=C(4,4,i);

        C(:,:,count)=Pers_create(F,Year,Par1,Par2);

        if strcmp(C(5,4,count),'х')
            ri=randi(L_nf);
            C(3,4,count)=Nam_f(ri);%strcat(Nam_f(ri),{' '},num2str(N_f(ri)));
            N_f(ri)=N_f(ri)+1;
        else
            po=po+1;
            ri=randi(L_nm);
            C(3,4,count)=Nam_m(ri);%strcat(Nam_m(ri),{' '},num2str(N_m(ri)));
            N_m(ri)=N_m(ri)+1;
        end
        
        Z((i+1)/2,j+2)=count; %запись ребенка к паре.
    
    end
    if (po==0) && (strcmp(C(5,4,count),'х')) % последний - мальчик, если не было!
        while strcmp(C(5,4,count),'х')
            C(:,:,count)=Pers_create(F,Year,Par1,Par2);
        end
        N_f(ri)=N_f(ri)-1;
        ri=randi(L_nm);
        C(3,4,count)=Nam_m(ri);%strcat(Nam_m(ri),{' '},num2str(N_m(ri)));
        N_m(ri)=N_m(ri)+1;
    end
        
    
end

M=size(C,3);


A=[];

for h=2:5
%% поиск пары
for i=N+1:M
    F=C(4,4,i);
    pol=C(5,4,i);
    Y=C(1,4,i);
    
    A(size(A,1)+1,:)=[i  find(strcmp(F,Fam))  strcmp('х',pol) str2num(cell2mat(Y))];
end

A=sortrows(A,4);
  
C1=C(:,:,2:3);
co=1;
i=1;
N2=size(Z,1);
while co==1
    
    r=find(A(:,3)~=A(i,3));
    j=find(A(r,2)==A(i,2));
    if r
        if j
            r(j)=[];
        end
    end
    
    if r
        j=find(abs(A(i,4)-A(r,4))>50);
        if j
            r(j)=[];
        end  
    end
    
    if r
    r=r(1);
    P1=A(i,:);
    P2=A(r,:);
    A(max(i,r),:)=[];
    A(min(i,r),:)=[];
    
    r=P1(1);
    j=P2(1);
    
    
    J=[J;r j]; %запись новой пары.
    Z=[Z; r j 0 0 0];
    
    
    Pa1=C(:,:,r);
    Pa2=C(:,:,j);
    
    if P1(3)==1
        C(4,4,r)=C(4,4,j);
        Pa1(4,4)=C(4,4,j);
    else
        C(4,4,j)=C(4,4,r);
        Pa2(4,4)=C(4,4,r);
    end
    
    m=size(C1,3);
    C1(:,:,m+1)=Pa1;
    C1(:,:,m+2)=Pa2;
        
    else
        i=i+1;
    end
    
    if i>=size(A,1)
        co=0;
    end
end
C1(:,:,1:2)=[];
%C1
    
%% поколение
C2=C1(:,:,1:2);
N=size(C1,3);
N1=size(C,3);

count=0;
for i=1:2:N
    
    Par1=C1(:,:,i);
    Par2=C1(:,:,i+1);
    n=randi(2)+1; %число детей
    
    r=max(str2num(cell2mat(Par1(1,4))),str2num(cell2mat(Par2(1,4))));
    if (r<str2num(cell2mat(Par1(1,4)))) || (r<str2num(cell2mat(Par2(1,4))))
        r=str2num(cell2mat(Par1(1,4)))+100;
    end
    po=0;
    for j=1:n
        count=count+1;
        Y=randi([35 100])+r;
        if (Y<str2num(cell2mat(Par1(1,4)))) || (Y<str2num(cell2mat(Par2(1,4))))
            Y=str2num(cell2mat(Par1(1,4)))+135;
        end
        Year=strcat({''},num2str(Y));   
        F=C1(4,4,i);

        C2(:,:,count)=Pers_create(F,Year,Par1,Par2);

        if strcmp(C2(5,4,count),'х')
            ri=randi(L_nf);
            C2(3,4,count)=Nam_f(ri);%strcat(Nam_f(ri),{' '},num2str(N_f(ri)));
            N_f(ri)=N_f(ri)+1;
        else
            po=po+1;
            ri=randi(L_nm);
            C2(3,4,count)=Nam_m(ri);%strcat(Nam_m(ri),{' '},num2str(N_m(ri)));
            N_m(ri)=N_m(ri)+1;
        end
        
        
        Z((i+1)/2+N2,j+2)=count+N1; %запись ребенка к паре.
    
    end
    if (po==0) && (strcmp(C2(5,4,count),'х'))
        while strcmp(C2(5,4,count),'х')
            C2(:,:,count)=Pers_create(F,Year,Par1,Par2);
        end
        N_f(ri)=N_f(ri)-1;
        ri=randi(L_nm);
        C2(3,4,count)=Nam_m(ri);%strcat(Nam_m(ri),{' '},num2str(N_m(ri)));
        N_m(ri)=N_m(ri)+1;
    end
    
end

M=size(C2,3); 
N=size(C,3);
C(:,:,size(C,3)+1:size(C,3)+M)=C2;
M=size(C,3); 

if Sho==1
    sheme_it(C,Z,L_f,h);
elseif Sho==2
    sheme_it_2(C,Z,L_f,h);
end
if h>1
    h;
end
    
end



    
        
    
    


