% Code to be run under the condition of COMSOL multiphysics with MATLAB
% written by Chensheng Luo
% Definition of problem
% In normal case, this code doesn't need to be run manually.

MODEL='DIAMOND';

%% Definition - TO CHECK BY RUNNER!
% This part should be defined by the runner according to each model

% Root of your folder: copy the address of your folder.
% example: root='E:\pseudo-periodic\models\example'; 
root='E:\MonFichier\Etude\ST7\Projet-safran\pseudo-periodic\models\diamond'; 

%% Definition - TO CONFIGURER BY DEVELOPPER!
%To check in COMSOL following boundaries the selections of boundaries 
outflowset1=[3,22,40,44,49];
outflowset2=[17,31,35,54];
outflowsetS=[14];
inflowset1=[13,25,41,47,51];
inflowset2=[19,34,38,53];

cube=40; %(en mm), to be synchronized with param.txt
a=2;b=4;N=a*b;%number of sections,factorised in two numbers for output issues.