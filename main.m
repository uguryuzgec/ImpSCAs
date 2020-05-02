%_________________________________________________________________________%
%  
% Improved Sine Cosine Optimization Algorithms for Feature Selection
%           By: Gizem Atac Kale and Ugur Yuzgec   
%           email: gzm.atac@gmail.com, ugur.yuzgec@bilecik.edu.tr
%                      
%_________________________________________________________________________%

clear all
close all
clc

global A trn vald a;
SearchAgents_no=5; % Number of search agents
Max_iteration=100; % Maximum numbef of iterations

A=load('zoo.dat');
r=randperm(size(A,1));
trn=r(1:floor(length(r)/2));
vald=r(floor(length(r)/2)+1:end);
runs=5;

%% SCA 
% fprintf('SCA--------------------------------------------------------------\n');
% for i=1:runs
%     
% fprintf('Runs:%d SCA funciton\n',i);
% tic
% [Best_score1(i),Best_pos1(i,:),SCA_cg_curve1(i,:)]=SCAFS(SearchAgents_no,(Max_iteration),0,1,size(A,2)-1,'AccSz');
%  time1(i) = toc;
%  acc1(i) = Acc(Best_pos1(i,:));
% fprintf('Acc  %f\tFitness:  %f\tSolution:  %s  \tDimention: %d\tTime:  %f\n', acc1(i), Best_score1(i), num2str(Best_pos1(i,:)>0.5,'%1d'), sum(Best_pos1(i,:)>0.5),time1(i));
% end
% SCA_best_fit=min(Best_score1);
% SCA_worst_fit=max(Best_score1);
% SCA_mean_fit=mean(Best_score1);
% SCA_mean_Acc = mean(acc1);
% SCA_best_Acc = max(acc1);
% SCA_worst_Acc = min(acc1);

%% ISCA1
%  fprintf('ISCA1--------------------------------------------------------------\n');
%  for i=1:runs
%        
%  fprintf('Runs:%d ISCA1 funciton\n',i);
%  tic
%  [Best_score2(i),Best_pos2(i,:),SCA_cg_curve2(i,:)]=ISCA_func1(SearchAgents_no,(Max_iteration),0,1,size(A,2)-1,'AccSz');
%  time2(i) = toc;
%  acc2(i) = Acc(Best_pos2(i,:));
% Best_pos2(i,:)=Best_pos2(i,:)>0.5;
%  fprintf('Acc  %f\tFitness:  %f\tSolution:  %s  \tDimention: %d\tTime:  %f\n', acc2(i), Best_score2(i), num2str(Best_pos2(i,:),'%1d'), sum(Best_pos2(i,:)),time2(i));
%  end
%  ISCA_best_fit=min(Best_score2);
% ISCA_worst_fit=max(Best_score2);
% ISCA_mean_fit=mean(Best_score2);
% ISCA_mean_Acc = mean(acc2);
% ISCA_best_Acc = max(acc2);
% ISCA_worst_Acc = min(acc2);

%% ISCA2
% fprintf('ISCA2--------------------------------------------------------------\n');
% for i=1:runs
% fprintf('Runs:%d ISCA2 function\n',i);
% tic
% [Best_score3(i),Best_pos3(i,:),SCA_cg_curve3(i,:)]=ISCA_func2(SearchAgents_no,(Max_iteration),0,1,size(A,2)-1,'AccSz');
% time3(i) = toc;
% acc3(i) = Acc(Best_pos3(i,:));
% Best_pos3(i,:)=Best_pos3(i,:)>0.5;
% fprintf('Acc  %f\tFitness:  %f\tSolution:  %s  \tDimention: %d\tTime: %f\n', acc3(i), Best_score3(i), num2str(Best_pos3(i,:),'%1d'), sum(Best_pos3(i,:)),time3(i));
% end
% ISCA2_best_fit=min(Best_score3);
% ISCA2_worst_fit=max(Best_score3);
% ISCA2_mean_fit=mean(Best_score3);
% ISCA2_mean_Acc = mean(acc3);
% ISCA2_best_Acc = max(acc3);
% ISCA2_worst_Acc = min(acc3);
%% ISCA3
  fprintf('ISCA3--------------------------------------------------------------\n');
for i=1:runs
fprintf('Runs:%d ISCA3 funciton\n',i);
tic
[Best_score4(i),Best_pos4(i,:),SCA_cg_curve4(i,:)]=ISCA_func3(SearchAgents_no,(Max_iteration),0,1,size(A,2)-1,'AccSz');
time4(i) = toc;
acc4(i) = Acc(Best_pos4(i,:));
Best_pos4(i,:)=Best_pos4(i,:)>0.5;
fprintf('Acc  %f\tFitness:  %f\tSolution:  %s  \tDimention: %d\tTime:  %f\n',acc4(i),Best_score4(i),num2str(Best_pos4(i,:),'%1d'),sum(Best_pos4(i,:)),time4(i));
end
ISCA3_best_fit=min(Best_score4);
ISCA3_worst_fit=max(Best_score4);
ISCA3_mean_fit=mean(Best_score4);
ISCA3_mean_Acc = mean(acc4);
ISCA3_best_Acc = max(acc4);
ISCA3_worst_Acc = min(acc4);
%% ISCA4
%   fprintf('ISCA4--------------------------------------------------------------\n');
% for i=1:runs
% fprintf('Runs:%d ISCA4 funciton\n',i);
% tic
% [Best_score5(i),Best_pos5(i,:),SCA_cg_curve5(i,:)]=ISCA_func4(SearchAgents_no,(Max_iteration),0,1,size(A,2)-1,'AccSz');
% time5(i) = toc;
% acc5(i) = Acc(Best_pos5(i,:));
% Best_pos5(i,:)=Best_pos5(i,:)>0.5;
% fprintf('Acc  %f\tFitness:  %f\tSolution:  %s  \tDimention: %d\tTime:  %f\n',acc5(i),Best_score5(i),num2str(Best_pos5(i,:),'%1d'),sum(Best_pos5(i,:)),time5(i));
% end 
% ISCA4_best_fit=min(Best_score5);
% ISCA4_worst_fit=max(Best_score5);
% ISCA4_mean_fit=mean(Best_score5);
% ISCA4_mean_Acc = mean(acc5);
% ISCA4_best_Acc = max(acc5);
% ISCA4_worst_Acc = min(acc5);