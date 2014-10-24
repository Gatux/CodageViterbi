% PETERLIN Maxime - VERMEULEN Gabriel - MARCHAL Thomas
% TS226 - TP de codage canal
clear all; close all;

%% 2. Encodage de codes convolutifs

% 2.1.
% C(D) = m(D) G = [m(D) g1(D), ----- , m(D) gn(D)]
% La mémoire M du codeur est donnée par le retard max des registres à
% déclages, M = max deg(gi)

