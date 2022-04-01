# MATLAB code for pseudo-periodicty case
Écrit par Chensheng LUO.
In this resporitory we have the code used for pseudo-periodicty case.   
All code should be run under the condition of COMSOL with MATLAB.   
The .mph is deleted in git.   
This folder is just a template, to be adpated with each model.   

## Guide pour réaliser le calcul de pseudo périodicité pour le projet safran

Guide pour lancer un calcul :
1.	Ouvrir comsol multifiphysics with MATLAB
2.	Ouvrir Definition.m, changer le nom root au dossier dans lequel existe ce fichier.
3.	Lancer le code MAIN.m et attendre ! Tu peux voir le temps restant pour le calcul au bout d’une iteration!
4.	Mettre le résultat, c’est-à-dire le fichier data.mat, le dossier result et le dossier scratch dans teams !

## Document de calcul
1.	Fichier MATLAB
- Definition.m la définition de problème
- MAIN.m, celui qu’on lance pour faire tourner 
- PostTraitement.m, celui qui réalise le post traitement de donnée.
- PlotDataLR.m, une fonction de regression linéaire.

2.	Modèle COMSOL
- pseudoperiode_begin.mph
- pseuperiode_suite.mph
3.	Dossier result, ce fichier contient tous les résultats
4.	Dossier scratch, ce fichier contient toutes les données de calcul intermédiaire, qu’on conserve pour des soucis de debug
5.	param.txt et README.md


## Guide pour configurer le modèle qu’on utilise
1.	Ouvrir pseuperiode_begin.mph   
a)	Dans Parameters, vérifie bien que c’est ces paramètres-là, sinon fait importer les paramètres à partir de fichier param.txt dans ce dossier   
b)	Dans import 2, choisir la géométrie que tu veux importer comme dans l’image ci-dessous, puis cliquer sur build select pour importer la géométrie   
c)	Dans Liquid phase 1, inflow liquid1, Outflow liquid 1, Liquid phase 2, inflow liquid 2, Outflow liquid 2, Solid phase, inflow solid, outflow solid, choisir les domaines/surfaces correspondantes    
d)	Dans Turbulent Flow et Heat Transfert, configurer les periodics conditions, en choisissant les faces correspondante, supprimer ou ajouter des nouveaux en cas de besoin.   
e)	Finir par créer la mesh   
2.	Ouvrir pseuperiode_suite.mph   
Refait la même configuration pour le debut,    
3.	Ouvrir MAIN.m   
Configurer les parties General Definition   
Root : mettre l’addresse de ce dossier,   
Outflowset : vérifier comsol, c’est ce que j’ai demandé à mémoriser, avec correspondance ci-dessous   
Les autres on ne change pas.   
  

