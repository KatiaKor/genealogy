function Pers = Pers_create(Fam,Year,Par1,Par2)
%присвоение ребенку фамилии Fam и создание на основе родителей/создание
%случайного в такой-то год.

%Создание человека:
%Описание человека. Гены и их реализация

TName={'Имя';
'Фамилия';
'Пол';
'Размер глаз';
'Разрез';
'Верхнее веко';
'Ресницы';
'Цвет глаз';
'Зрение';
'Размер носа';
'Форма носа';
'Тип волос';
'Цвет волос';
'Веснушки';
'Рост';
'Телосложение';
'Голос';
'Заболевания'};
N=length(TName);
Pers=cell(N+1,4);
Pers(1,:)={'Родители' ' ' ' ' ' '};
Pers(1,4)=Year;
Pers(2,:)={'Признак' 'ГенА' 'ГенБ' 'Фенотип'};

Pers(3:N+2,1)=TName;
Pers(3,2:4)={' ' ' ' ' '};
Pers(4,2:4)={' ' ' ' ' '};
k=4;
Pers(k,4)=Fam;

%% определение генов:
if nargin==4
     Pers(1,2)=strcat(Par1(3,4),{' '},Par1(4,4));
     Pers(1,3)=strcat(Par2(3,4),{' '},Par2(4,4));
    %Pers(1,2)=Par1(3,4);
    %Pers(1,3)=Par2(3,4);
    r=randi(2,[N+2,2])+1;
    for i=4:N+2
        Pers(i,2)=Par1(i,r(i,1));
        Pers(i,3)=Par2(i,r(i,2));
    end
else
    
    for i=2:3
        k=4;
        k=k+1;%'Пол'
        r=randi(2);
        if r==2
            Pers(k,i)={'х'};
        else
            Pers(k,i)={'у'};
        end
        
        k=k+1;%'Размер глаз'
        r=randi(2);
        if r==2
            Pers(k,i)={'большой'};
        else
            Pers(k,i)={'маленький'};
        end
        
        k=k+1;%'Разрез'
        r=randi(3);
        if r==2
            Pers(k,i)={'косой'};
        else
            Pers(k,i)={'прямой'};
        end
        
        k=k+1;%'Верхнее веко'
        r=randi(5);
        if r==2
            Pers(k,i)={'нависающее'};
        else
            Pers(k,i)={'нормальное'};
        end
        
        k=k+1;%'Ресницы'
        r=randi(3);
        if r==2
            Pers(k,i)={'короткие'};
        else
            Pers(k,i)={'длинные'};
        end
        
        k=k+1;%'Цвет глаз'
        r=randi(100);
        if r<52
            Pers(k,i)={'карие'};
        elseif r<(52+8)
            Pers(k,i)={'зеленые'};
        elseif r<(52+8+13)
            Pers(k,i)={'серые'};
        else
            Pers(k,i)={'голубые'};
        end
        
        k=k+1;%'Зрение'
        r=randi(5);
        if r==2
            Pers(k,i)={'близорукость'};
        else
            Pers(k,i)={'нормальное'};
        end
        
        k=k+1;%'Размер носа'
        r=randi(5);
        if r==1
            Pers(k,i)={'крупный'};
        elseif r==2
            Pers(k,i)={'маленький'};
        else
            Pers(k,i)={'нормальный'};
        end
        
        k=k+1;%'Форма носа'
        r=randi(50);
        if r<10
            Pers(k,i)={'острый'}; 
        elseif r<20
            Pers(k,i)={'узкий'};
        elseif r<30
            Pers(k,i)={'с горбинкой'};
        elseif r<40
            Pers(k,i)={'прямой'};
        else
            Pers(k,i)={'широкий'};
        end
        
        k=k+1;%'Тип волос'
        r=randi(6);
        if r==1
            Pers(k,i)={'кудрявые'};
        elseif r<=3
            Pers(k,i)={'прямые'};
        else
            Pers(k,i)={'волнистые'};
        end
        
        k=k+1;%'Цвет волос'
        r=randi(100);
        if r<90
            Pers(k,i)={'темные'};
        elseif r<96
            Pers(k,i)={'светлые'};
        else
            Pers(k,i)={'рыжие'};
        end
        
        k=k+1;%'Веснушки'
        r=randi(100);
        if strcmp(Pers(k-1,i),'темные') && r<17
            Pers(k,i)={'есть'};
        elseif strcmp(Pers(k-1,i),'темные')==0 && r<57
            Pers(k,i)={'есть'};
        else
            Pers(k,i)={'нет'};
        end
        
        k=k+1;%'Рост'
        r=randi(5);
        if r==2
            Pers(k,i)={'низкий'};
        elseif r==1
            Pers(k,i)={'высокий'};
        else
            Pers(k,i)={'средний'};
        end
        
        k=k+1;%'Телосложение'
        r=randi(5);
        if r==2
            Pers(k,i)={'полнота'};
        elseif r==1
            Pers(k,i)={'худоба'};
        else
            Pers(k,i)={'нормальное'};
        end
        
        k=k+1;%'Голос'
        r=randi(3);
        if r==2
           if strcmp(Pers(4,i),'х')
               Pers(k,i)={'низкий'};
           else
               Pers(k,i)={'высокий'};
           end
        else
            if strcmp(Pers(4,i),'у')
               Pers(k,i)={'низкий'};
           else
               Pers(k,i)={'высокий'};
            end
        end
        
        k=k+1;%'Заболевания'   
        r=randi(10);
        if r==1
            Pers(k,i)={'есть'};
        else
            Pers(k,i)={'нет'};
        end
    end
    
end
    
%% определение доминирующего признака (фенотипа):   
i=4;
k=4;
    
k=k+1;%'Пол'  'у''х'
if strcmp(Pers(k,2),'у') || strcmp(Pers(k,3),'у')
    Pers(k,i)={'у'};
else
    Pers(k,i)={'х'};
end

k=k+1;%'Размер глаз'  'большой''маленький'
if strcmp(Pers(k,2),'большой') || strcmp(Pers(k,3),'большой')
    Pers(k,i)={'большой'};
else
    Pers(k,i)={'маленький'};
end

k=k+1;%'Разрез'  'прямой''косой'
if strcmp(Pers(k,2),'прямой') || strcmp(Pers(k,3),'прямой')
    Pers(k,i)={'прямой'};
else
    Pers(k,i)={'косой'};
end

k=k+1;%'Верхнее веко'  'нависающее''нормальное'
if strcmp(Pers(k,2),'нависающее') || strcmp(Pers(k,3),'нависающее')
    Pers(k,i)={'нависающее'};
else
    Pers(k,i)={'нормальное'};
end

k=k+1;%'Ресницы'  'длинные''короткие'
if strcmp(Pers(k,2),'длинные') || strcmp(Pers(k,3),'длинные')
    Pers(k,i)={'длинные'};
else
    Pers(k,i)={'короткие'};
end

k=k+1;%'Цвет глаз'  'карие''зеленые' 'серые''голубые'
if (strcmp(Pers(k,2),'карие') || strcmp(Pers(k,2),'зеленые')) && (strcmp(Pers(k,3),'карие') || strcmp(Pers(k,3),'зеленые')) 
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
elseif (strcmp(Pers(k,2),'карие') || strcmp(Pers(k,3),'карие'))
    Pers(k,i)={'карие'};
elseif (strcmp(Pers(k,2),'зеленые') || strcmp(Pers(k,3),'зеленые'))
    Pers(k,i)={'зеленые'};
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
end

k=k+1;%'Зрение'  'близорукость''нормальное'
if strcmp(Pers(k,2),'близорукость') || strcmp(Pers(k,3),'близорукость')
    Pers(k,i)={'близорукость'};
else
    Pers(k,i)={'нормальное'};
end

k=k+1;%'Размер носа'  'крупный''маленький''нормальный'
if strcmp(Pers(k,2),'крупный') || strcmp(Pers(k,3),'крупный')
    Pers(k,i)={'крупный'};
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
end

k=k+1;%'Форма носа'  'острый''узкий''с горбинкой' 'прямой''широкий'
if (  strcmp(Pers(k,2),'острый') || strcmp(Pers(k,2),'узкий') || strcmp(Pers(k,2),'с горбинкой')) && (strcmp(Pers(k,3),'острый') || strcmp(Pers(k,3),'узкий') || strcmp(Pers(k,3),'с горбинкой')) 
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
elseif (strcmp(Pers(k,2),'острый') || strcmp(Pers(k,3),'острый'))
    Pers(k,i)={'острый'};
elseif (strcmp(Pers(k,2),'узкий') || strcmp(Pers(k,3),'узкий'))
    Pers(k,i)={'узкий'};
elseif (strcmp(Pers(k,2),'с горбинкой') || strcmp(Pers(k,3),'с горбинкой'))
    Pers(k,i)={'с горбинкой'};
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
end

k=k+1;%'Тип волос'  'кудрявые''волнистые''прямые'
if (strcmp(Pers(k,2),'кудрявые') || strcmp(Pers(k,2),'волнистые')) && (strcmp(Pers(k,3),'кудрявые') || strcmp(Pers(k,3),'волнистые')) 
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
elseif (strcmp(Pers(k,2),'кудрявые') || strcmp(Pers(k,3),'кудрявые'))
    Pers(k,i)={'кудрявые'};
elseif (strcmp(Pers(k,2),'волнистые') || strcmp(Pers(k,3),'волнистые'))
    Pers(k,i)={'волнистые'};
else
    Pers(k,i)={'прямые'};
end

k=k+1;%'Цвет волос'  'темные''светлые' 'рыжие'
if (strcmp(Pers(k,2),'темные') || strcmp(Pers(k,2),'темные')) && (strcmp(Pers(k,3),'светлые') || strcmp(Pers(k,3),'светлые')) 
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
elseif (strcmp(Pers(k,2),'светлые') || strcmp(Pers(k,3),'светлые'))
    Pers(k,i)={'светлые'};
elseif (strcmp(Pers(k,2),'темные') || strcmp(Pers(k,3),'темные'))
    Pers(k,i)={'темные'};
else
    Pers(k,i)={'рыжие'};
end

k=k+1;%'Веснушки'  'есть''нет'
if strcmp(Pers(k,2),'есть') || strcmp(Pers(k,3),'есть')
    Pers(k,i)={'есть'};
else
    Pers(k,i)={'нет'};
end

k=k+1;%'Рост'  'низкий''высокий''средний'
if (strcmp(Pers(k,2),'низкий') && strcmp(Pers(k,3),'низкий')) || (strcmp(Pers(k,2),'высокий') && strcmp(Pers(k,3),'высокий')) 
    Pers(k,i)=Pers(k,2);
elseif (strcmp(Pers(k,2),'низкий') || strcmp(Pers(k,2),'высокий')) && (strcmp(Pers(k,3),'низкий') || strcmp(Pers(k,3),'высокий'))
    Pers(k,i)={'средний'};
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
end
    
k=k+1;%'Телосложение'  'полнота''худоба''нормальное'
if (strcmp(Pers(k,2),'полнота') && strcmp(Pers(k,3),'полнота')) || (strcmp(Pers(k,2),'худоба') && strcmp(Pers(k,3),'худоба')) 
    Pers(k,i)=Pers(k,2);
elseif (strcmp(Pers(k,2),'полнота') || strcmp(Pers(k,2),'худоба')) && (strcmp(Pers(k,3),'полнота') || strcmp(Pers(k,3),'худоба'))
    Pers(k,i)={'нормальное'};
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
end

k=k+1;%'Голос'  'низкий''высокий'
if (   strcmp(Pers(4,i),'у') && (strcmp(Pers(2,i),'низкий') || strcmp(Pers(3,i),'низкий'))    ) || ( strcmp(Pers(4,i),'х') && (strcmp(Pers(2,i),'низкий') && strcmp(Pers(3,i),'низкий'))  )
    Pers(k,i)={'низкий'};
else
    Pers(k,i)={'высокий'};
end   

k=k+1;%'Заболевания'  'есть''нет'    
if strcmp(Pers(k,2),'есть') && strcmp(Pers(k,3),'есть')
    Pers(k,i)={'есть'};
    r=randi(20);
    if r==1
        Pers(k,i)={'нет'};
    end
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
    r=randi(10);
    if r==1
        Pers(k,i)={'есть'};
    end
    if r==2
        Pers(k,i)={'нет'};
    end  
end

if nargin==4 && strcmp(Par1(5,4),Par2(5,4))
    Pers=0;
end


end



