%% Perfomances : g=[3]
close all
clear all

g=[3];
m_ini=[0];

m_cod=codconv(m_ini,g);

p_err_dec=[];
p_err=[];

for SNR=0:0.5:10
    sigma = sqrt(10^(-SNR/10));
    err=[];
    for i=1:5000
        m_can=bsc(m_cod,sigma^2);
        m_dec=decodconv(m_can,g,'h');
        err_tmp=0;
        for j=1:length(m_ini)
            if m_ini(1,j)~=m_dec(1,j)
                err_tmp=err_tmp+1;
            end
        end
        err=[err err_tmp/length(m_ini)];
    end
    p_err_dec=[p_err_dec sum(err)/5000];
end

for SNR=0:0.5:10
    sigma = sqrt(10^(-SNR/10));
    err=[];
    for i=1:5000
        m_can=bsc(m_ini,sigma^2);
        err_tmp=pdist2(m_ini,m_can);
        err=[err err_tmp/length(m_ini)];
    end
    p_err=[p_err sum(err)/5000];
end

figure
semilogy([0:0.5:10],p_err_dec,'r')
hold on
semilogy([0:0.5:10],p_err)
hold off
legend('Avec codage', 'Sans codage')
title('Courbe d`erreur d`une transmission pour g=[3]')
xlabel('(E_b/N_0)_{dB}')
ylabel('Taux d''erreur binaire')
grid on
ylim([1E-2 1])

%% Perfomances : g=[5,7]

g=[5,7];
m_ini=[0 0];

m_cod=codconv(m_ini,g);

p_err_dec=[];
p_err=[];

for SNR=0:0.5:10
    sigma = sqrt(10^(-SNR/10));
    err=[];
    for i=1:5000
        m_can=bsc(m_cod,sigma^2);
        m_dec=decodconv(m_can,g,'h');
        err_tmp=0;
        for j=1:length(m_ini)
            if m_ini(1,j)~=m_dec(1,j)
                err_tmp=err_tmp+1;
            end
        end
        err=[err err_tmp/length(m_ini)];
    end
    p_err_dec=[p_err_dec sum(err)/5000];
end

for SNR=0:0.5:10
    sigma = sqrt(10^(-SNR/10));
    err=[];
    for i=1:5000
        m_can=bsc(m_ini,sigma^2);
        err_tmp=pdist2(m_ini,m_can);
        err=[err err_tmp/length(m_ini)];
    end
    p_err=[p_err sum(err)/5000];
end

figure
semilogy([0:0.5:10],p_err_dec,'r')
hold on
semilogy([0:0.5:10],p_err)
hold off
legend('Avec codage', 'Sans codage')
title('Courbe d`erreur d`une transmission pour g=[5,7]')
xlabel('(E_b/N_0)_{dB}')
ylabel('Taux d''erreur binaire')
grid on
ylim([1E-2 1])


%% Perfomances : g=[15,17]

g=[15,17];
m_ini=[0 0];

m_cod=codconv(m_ini,g);

p_err_dec=[];
p_err=[];

for SNR=0:0.5:10
    sigma = sqrt(10^(-SNR/10));
    err=[];
    for i=1:5000
        m_can=bsc(m_cod,sigma^2);
        m_dec=decodconv(m_can,g,'h');
        err_tmp=0;
        for j=1:length(m_ini)
            if m_ini(1,j)~=m_dec(1,j)
                err_tmp=err_tmp+1;
            end
        end
        err=[err err_tmp/length(m_ini)];
    end
    p_err_dec=[p_err_dec sum(err)/5000];
end

for SNR=0:0.5:10
    sigma = sqrt(10^(-SNR/10));
    err=[];
    for i=1:5000
        m_can=bsc(m_ini,sigma^2);
        err_tmp=pdist2(m_ini,m_can);
        err=[err err_tmp/length(m_ini)];
    end
    p_err=[p_err sum(err)/5000];
end

figure
semilogy([0:0.5:10],p_err_dec,'r')
hold on
semilogy([0:0.5:10],p_err)
hold off
legend('Avec codage', 'Sans codage')
title('Courbe d`erreur d`une transmission pour g=[15,17]')
xlabel('(E_b/N_0)_{dB}')
ylabel('Taux d''erreur binaire')
grid on
ylim([1E-2 1])
hold off
