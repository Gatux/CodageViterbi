%% Perfomances : g=[3]
close all
clear all

g=[3];
m_ini=[0];

m_cod=codconv(m_ini,g);

p_err_dec=[];
p_err=[];

for p=0:0.05:1
    err=[];
    for i=1:500
        m_can=bsc(m_cod,p);
        m_dec=decodconv(m_can,g,'h');
        err_tmp=0;
        for j=1:length(m_ini)
            if m_ini(1,j)~=m_dec(1,j)
                err_tmp=err_tmp+1;
            end
        end
        err=[err err_tmp/length(m_ini)];
    end
    p_err_dec=[p_err_dec sum(err)/500];
end

for p=0:0.05:1
    err=[];
    for i=1:500
        m_can=bsc(m_ini,p);
        err_tmp=0;
        for j=1:length(m_ini)
            if m_ini(1,j)~=m_can(1,j)
                err_tmp=err_tmp+1;
            end
        end
        err=[err err_tmp/length(m_ini)];
    end
    p_err=[p_err sum(err)/500];
end

test_1=p_err-p_err_dec;

figure
plot([0:0.05:1],p_err_dec,'r')
hold on
plot([0:0.05:1],p_err)
xlabel('erreur canal')
ylabel('erreur réception')
legend('Avec codage','Sans codage')
title('Courbe d`erreur d`une transmission pour g=[3]')
hold off

%% Perfomances : g=[5,7]

g=[5,7];
m_ini=[0 0];

m_cod=codconv(m_ini,g);

p_err_dec=[];
p_err=[];

for p=0:0.05:1
    err=[];
    for i=1:500
        m_can=bsc(m_cod,p);
        m_dec=decodconv(m_can,g,'h');
        err_tmp=0;
        for j=1:length(m_ini)
            if m_ini(1,j)~=m_dec(1,j)
                err_tmp=err_tmp+1;
            end
        end
        err=[err err_tmp/length(m_ini)];
    end
    p_err_dec=[p_err_dec sum(err)/500];
end

for p=0:0.05:1
    err=[];
    for i=1:500
        m_can=bsc(m_ini,p);
        err_tmp=0;
        for j=1:length(m_ini)
            if m_ini(1,j)~=m_can(1,j)
                err_tmp=err_tmp+1;
            end
        end
        err=[err err_tmp/length(m_ini)];
    end
    p_err=[p_err sum(err)/500];
end

test_2=p_err-p_err_dec;

figure
plot([0:0.05:1],p_err_dec,'r')
hold on
plot([0:0.05:1],p_err)
xlabel('erreur canal')
ylabel('erreur réception')
legend('Avec codage','Sans codage')
title('Courbe d`erreur d`une transmission pour g=[5,7]')
hold off

%% Perfomances : g=[15,17]

g=[15,17];
m_ini=[0 0];

m_cod=codconv(m_ini,g);

p_err_dec=[];
p_err=[];

for p=0:0.05:1
    err=[];
    for i=1:500
        m_can=bsc(m_cod,p);
        m_dec=decodconv(m_can,g,'h');
        err_tmp=0;
        for j=1:length(m_ini)
            if m_ini(1,j)~=m_dec(1,j)
                err_tmp=err_tmp+1;
            end
        end
        err=[err err_tmp/length(m_ini)];
    end
    p_err_dec=[p_err_dec sum(err)/500];
end

for p=0:0.05:1
    err=[];
    for i=1:500
        m_can=bsc(m_ini,p);
        err_tmp=0;
        for j=1:length(m_ini)
            if m_ini(1,j)~=m_can(1,j)
                err_tmp=err_tmp+1;
            end
        end
        err=[err err_tmp/length(m_ini)];
    end
    p_err=[p_err sum(err)/500];
end

test_3=p_err-p_err_dec;

figure
plot([0:0.05:1],p_err_dec,'r')
hold on
plot([0:0.05:1],p_err)
xlabel('erreur canal')
ylabel('erreur réception')
legend('Avec codage','Sans codage')
title('Courbe d`erreur d`une transmission pour g=[15,17]')

hold off

figure
plot([0:0.05:1],test_1,'b')
hold on
plot([0:0.05:1],test_2,'r')
plot([0:0.05:1],test_3,'g')
xlabel('erreur canal')
ylabel('performance')
legend('g=[3]','g=[5,7]','g=[15,17]')
title('Courbes de performance')