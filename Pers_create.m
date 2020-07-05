function Pers = Pers_create(Fam,Year,Par1,Par2)
%���������� ������� ������� Fam � �������� �� ������ ���������/��������
%���������� � �����-�� ���.

%�������� ��������:
%�������� ��������. ���� � �� ����������

TName={'���';
'�������';
'���';
'������ ����';
'������';
'������� ����';
'�������';
'���� ����';
'������';
'������ ����';
'����� ����';
'��� �����';
'���� �����';
'��������';
'����';
'������������';
'�����';
'�����������'};
N=length(TName);
Pers=cell(N+1,4);
Pers(1,:)={'��������' ' ' ' ' ' '};
Pers(1,4)=Year;
Pers(2,:)={'�������' '����' '����' '�������'};

Pers(3:N+2,1)=TName;
Pers(3,2:4)={' ' ' ' ' '};
Pers(4,2:4)={' ' ' ' ' '};
k=4;
Pers(k,4)=Fam;

%% ����������� �����:
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
        k=k+1;%'���'
        r=randi(2);
        if r==2
            Pers(k,i)={'�'};
        else
            Pers(k,i)={'�'};
        end
        
        k=k+1;%'������ ����'
        r=randi(2);
        if r==2
            Pers(k,i)={'�������'};
        else
            Pers(k,i)={'���������'};
        end
        
        k=k+1;%'������'
        r=randi(3);
        if r==2
            Pers(k,i)={'�����'};
        else
            Pers(k,i)={'������'};
        end
        
        k=k+1;%'������� ����'
        r=randi(5);
        if r==2
            Pers(k,i)={'����������'};
        else
            Pers(k,i)={'����������'};
        end
        
        k=k+1;%'�������'
        r=randi(3);
        if r==2
            Pers(k,i)={'��������'};
        else
            Pers(k,i)={'�������'};
        end
        
        k=k+1;%'���� ����'
        r=randi(100);
        if r<52
            Pers(k,i)={'�����'};
        elseif r<(52+8)
            Pers(k,i)={'�������'};
        elseif r<(52+8+13)
            Pers(k,i)={'�����'};
        else
            Pers(k,i)={'�������'};
        end
        
        k=k+1;%'������'
        r=randi(5);
        if r==2
            Pers(k,i)={'������������'};
        else
            Pers(k,i)={'����������'};
        end
        
        k=k+1;%'������ ����'
        r=randi(5);
        if r==1
            Pers(k,i)={'�������'};
        elseif r==2
            Pers(k,i)={'���������'};
        else
            Pers(k,i)={'����������'};
        end
        
        k=k+1;%'����� ����'
        r=randi(50);
        if r<10
            Pers(k,i)={'������'}; 
        elseif r<20
            Pers(k,i)={'�����'};
        elseif r<30
            Pers(k,i)={'� ���������'};
        elseif r<40
            Pers(k,i)={'������'};
        else
            Pers(k,i)={'�������'};
        end
        
        k=k+1;%'��� �����'
        r=randi(6);
        if r==1
            Pers(k,i)={'��������'};
        elseif r<=3
            Pers(k,i)={'������'};
        else
            Pers(k,i)={'���������'};
        end
        
        k=k+1;%'���� �����'
        r=randi(100);
        if r<90
            Pers(k,i)={'������'};
        elseif r<96
            Pers(k,i)={'�������'};
        else
            Pers(k,i)={'�����'};
        end
        
        k=k+1;%'��������'
        r=randi(100);
        if strcmp(Pers(k-1,i),'������') && r<17
            Pers(k,i)={'����'};
        elseif strcmp(Pers(k-1,i),'������')==0 && r<57
            Pers(k,i)={'����'};
        else
            Pers(k,i)={'���'};
        end
        
        k=k+1;%'����'
        r=randi(5);
        if r==2
            Pers(k,i)={'������'};
        elseif r==1
            Pers(k,i)={'�������'};
        else
            Pers(k,i)={'�������'};
        end
        
        k=k+1;%'������������'
        r=randi(5);
        if r==2
            Pers(k,i)={'�������'};
        elseif r==1
            Pers(k,i)={'������'};
        else
            Pers(k,i)={'����������'};
        end
        
        k=k+1;%'�����'
        r=randi(3);
        if r==2
           if strcmp(Pers(4,i),'�')
               Pers(k,i)={'������'};
           else
               Pers(k,i)={'�������'};
           end
        else
            if strcmp(Pers(4,i),'�')
               Pers(k,i)={'������'};
           else
               Pers(k,i)={'�������'};
            end
        end
        
        k=k+1;%'�����������'   
        r=randi(10);
        if r==1
            Pers(k,i)={'����'};
        else
            Pers(k,i)={'���'};
        end
    end
    
end
    
%% ����������� ������������� �������� (��������):   
i=4;
k=4;
    
k=k+1;%'���'  '�''�'
if strcmp(Pers(k,2),'�') || strcmp(Pers(k,3),'�')
    Pers(k,i)={'�'};
else
    Pers(k,i)={'�'};
end

k=k+1;%'������ ����'  '�������''���������'
if strcmp(Pers(k,2),'�������') || strcmp(Pers(k,3),'�������')
    Pers(k,i)={'�������'};
else
    Pers(k,i)={'���������'};
end

k=k+1;%'������'  '������''�����'
if strcmp(Pers(k,2),'������') || strcmp(Pers(k,3),'������')
    Pers(k,i)={'������'};
else
    Pers(k,i)={'�����'};
end

k=k+1;%'������� ����'  '����������''����������'
if strcmp(Pers(k,2),'����������') || strcmp(Pers(k,3),'����������')
    Pers(k,i)={'����������'};
else
    Pers(k,i)={'����������'};
end

k=k+1;%'�������'  '�������''��������'
if strcmp(Pers(k,2),'�������') || strcmp(Pers(k,3),'�������')
    Pers(k,i)={'�������'};
else
    Pers(k,i)={'��������'};
end

k=k+1;%'���� ����'  '�����''�������' '�����''�������'
if (strcmp(Pers(k,2),'�����') || strcmp(Pers(k,2),'�������')) && (strcmp(Pers(k,3),'�����') || strcmp(Pers(k,3),'�������')) 
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
elseif (strcmp(Pers(k,2),'�����') || strcmp(Pers(k,3),'�����'))
    Pers(k,i)={'�����'};
elseif (strcmp(Pers(k,2),'�������') || strcmp(Pers(k,3),'�������'))
    Pers(k,i)={'�������'};
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
end

k=k+1;%'������'  '������������''����������'
if strcmp(Pers(k,2),'������������') || strcmp(Pers(k,3),'������������')
    Pers(k,i)={'������������'};
else
    Pers(k,i)={'����������'};
end

k=k+1;%'������ ����'  '�������''���������''����������'
if strcmp(Pers(k,2),'�������') || strcmp(Pers(k,3),'�������')
    Pers(k,i)={'�������'};
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
end

k=k+1;%'����� ����'  '������''�����''� ���������' '������''�������'
if (  strcmp(Pers(k,2),'������') || strcmp(Pers(k,2),'�����') || strcmp(Pers(k,2),'� ���������')) && (strcmp(Pers(k,3),'������') || strcmp(Pers(k,3),'�����') || strcmp(Pers(k,3),'� ���������')) 
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
elseif (strcmp(Pers(k,2),'������') || strcmp(Pers(k,3),'������'))
    Pers(k,i)={'������'};
elseif (strcmp(Pers(k,2),'�����') || strcmp(Pers(k,3),'�����'))
    Pers(k,i)={'�����'};
elseif (strcmp(Pers(k,2),'� ���������') || strcmp(Pers(k,3),'� ���������'))
    Pers(k,i)={'� ���������'};
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
end

k=k+1;%'��� �����'  '��������''���������''������'
if (strcmp(Pers(k,2),'��������') || strcmp(Pers(k,2),'���������')) && (strcmp(Pers(k,3),'��������') || strcmp(Pers(k,3),'���������')) 
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
elseif (strcmp(Pers(k,2),'��������') || strcmp(Pers(k,3),'��������'))
    Pers(k,i)={'��������'};
elseif (strcmp(Pers(k,2),'���������') || strcmp(Pers(k,3),'���������'))
    Pers(k,i)={'���������'};
else
    Pers(k,i)={'������'};
end

k=k+1;%'���� �����'  '������''�������' '�����'
if (strcmp(Pers(k,2),'������') || strcmp(Pers(k,2),'������')) && (strcmp(Pers(k,3),'�������') || strcmp(Pers(k,3),'�������')) 
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
elseif (strcmp(Pers(k,2),'�������') || strcmp(Pers(k,3),'�������'))
    Pers(k,i)={'�������'};
elseif (strcmp(Pers(k,2),'������') || strcmp(Pers(k,3),'������'))
    Pers(k,i)={'������'};
else
    Pers(k,i)={'�����'};
end

k=k+1;%'��������'  '����''���'
if strcmp(Pers(k,2),'����') || strcmp(Pers(k,3),'����')
    Pers(k,i)={'����'};
else
    Pers(k,i)={'���'};
end

k=k+1;%'����'  '������''�������''�������'
if (strcmp(Pers(k,2),'������') && strcmp(Pers(k,3),'������')) || (strcmp(Pers(k,2),'�������') && strcmp(Pers(k,3),'�������')) 
    Pers(k,i)=Pers(k,2);
elseif (strcmp(Pers(k,2),'������') || strcmp(Pers(k,2),'�������')) && (strcmp(Pers(k,3),'������') || strcmp(Pers(k,3),'�������'))
    Pers(k,i)={'�������'};
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
end
    
k=k+1;%'������������'  '�������''������''����������'
if (strcmp(Pers(k,2),'�������') && strcmp(Pers(k,3),'�������')) || (strcmp(Pers(k,2),'������') && strcmp(Pers(k,3),'������')) 
    Pers(k,i)=Pers(k,2);
elseif (strcmp(Pers(k,2),'�������') || strcmp(Pers(k,2),'������')) && (strcmp(Pers(k,3),'�������') || strcmp(Pers(k,3),'������'))
    Pers(k,i)={'����������'};
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
end

k=k+1;%'�����'  '������''�������'
if (   strcmp(Pers(4,i),'�') && (strcmp(Pers(2,i),'������') || strcmp(Pers(3,i),'������'))    ) || ( strcmp(Pers(4,i),'�') && (strcmp(Pers(2,i),'������') && strcmp(Pers(3,i),'������'))  )
    Pers(k,i)={'������'};
else
    Pers(k,i)={'�������'};
end   

k=k+1;%'�����������'  '����''���'    
if strcmp(Pers(k,2),'����') && strcmp(Pers(k,3),'����')
    Pers(k,i)={'����'};
    r=randi(20);
    if r==1
        Pers(k,i)={'���'};
    end
else
    r=randi(2)+1;
    Pers(k,i)=Pers(k,r);
    r=randi(10);
    if r==1
        Pers(k,i)={'����'};
    end
    if r==2
        Pers(k,i)={'���'};
    end  
end

if nargin==4 && strcmp(Par1(5,4),Par2(5,4))
    Pers=0;
end


end



