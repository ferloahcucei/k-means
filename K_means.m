%Universidad de Guadalajara CUCEI
%Alumno: INCO José Fernando López Aguilar Hernández 
%Materia: Inteligencia Artificial II
%Actividad: Algoritmo de agrupamiento K-MEANS ( K medias ) 

clear all; clc;
format shortG

euclidiana=@(x,y) sqrt(x^2+y^2);
poblacion=250;
dimension=2;
high=3;
low=1;
k=3;
C1=[]; %matriz para cluster1
C2=[]; %matriz para cluster2
C3=[]; %matriz para cluster3

%Creacion de población 
P = Crear_poblacion(poblacion,high,low,dimension);

%Selección de centroides para la clusterización
for i=1:k
    posicion = round(unifrnd(1,poblacion));
    C1(i,:)=[i P(posicion,:)];
    C(i,:)=P(posicion,:);    
end 

%Ploteo de los puntos iniciales de cada cluster
for i=1:k
    x=C(i,1);
    y=C(i,2);
    plot3(x,y,5,'r:+')
    grid on
end

%Ploteo de la poblacion
for i=1:250
    x=P(i,1);
    y=P(i,2);
    title('K-Means')
    plot3(x,y,5,'k:o')
    xlabel('x'); ylabel('y');
    hold on
    grid on
end

%Primera aproximación e inicio de algoritmo hasta 6 iteraciones
for d=1:6
    disp(['iteracion: ',num2str(d)])
    for i=1:poblacion %Distancia euclidiana elemento centroide
        for j=1:k
            centroide(j,:)=C(j,:);        
            x=P(i,1);
            y=P(i,2);
            x_c=centroide(j,1);
            y_c=centroide(j,2);
            plot3(x_c,y_c,5,'r:+')
            hold on
            x=x_c-x;
            y=y_c-y;
            e=feval(euclidiana,x,y);
            P1(i,j)=[e];
            P2(i,j)=[e];       
        end 
    end
    P1=[P,P1];
    for i=1:poblacion 
    	[a,b]=min(P2(i,:));
        P3(i,:)=[b];
    end
    P1=[P,P3];    
    for i=1:poblacion
        x=P1(i,1);
        y=P1(i,2);
        cluster=P1(i,3);
        if cluster==1
            C1(i,:)=P1(i,:);
            plot3(x,y,5,'g:o')
            pause(0.0001)
            hold on 
        end
        if cluster==2
            C2(i,:)=P1(i,:);
            plot3(x,y,5,'b:o')
            pause(0.0001)
            hold on 
        end
        if cluster==3
            C3(i,:)=P1(i,:);
            plot3(x,y,5,'y:o')
            pause(0.0001)
            hold on
        end
    end
    cant1=sum(C1(:,3))/1;
    cant2=sum(C2(:,3))/2;
    cant3=sum(C3(:,3))/3;

    sumxc1=sum(C1(:,1))/cant1;
    sumyc1=sum(C1(:,2))/cant1;

    sumxc2=sum(C2(:,1))/cant2;
    sumyc2=sum(C2(:,2))/cant2;

    sumxc3=sum(C3(:,1))/cant3;
    sumyc3=sum(C3(:,2))/cant3;

    C(1,:)=[sumxc1 sumyc1];
    C(2,:)=[sumxc2 sumyc2];
    C(3,:)=[sumxc3 sumyc3];

    disp('=============================')
    disp('        CENTROIDES           ')
    disp('=============================')
    disp('            x            y   ')
    disp('=============================')
    disp(C)    
end
disp('End')






        


            