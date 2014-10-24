% PETERLIN Maxime - VERMEULEN Gabriel - MARCHAL Thomas
% TS226 - TP de codage canal
clear all; close all;

%% 2. Encodage de codes convolutifs

% 2.1.
% C(D) = m(D) G = [m(D) g1(D), ----- , m(D) gn(D)]
% La mémoire M du codeur est donnée par le retard max des registres à
% déclages, M = max deg(gi)

% 2.2.
m = [ 1 1 0 1 0 1 ];
g = [ 7 5 ];

% Affiche la séquence binaire codée correspondante
c = codconv(m,g)

%% 3. Décodage des codes convolutifs  algorithme de Viterbi

paramconv2([1, 5, 7])