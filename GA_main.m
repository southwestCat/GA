clear
clc
close all
%个城市坐标位置,load schoolPosition.mat
load('schoolPosition.mat');
NIND=100;       %种群大小
MAXGEN=200;
Pc=0.9;         %交叉概率
Pm=0.05;        %变异概率
GGAP=0.9;      %代沟(Generation gap)
D=getDistance(X);  %生成距离矩阵
N=size(D,1);    %(34*34)
%% 初始化种群
Chrom=InitPop(NIND,N);
%% 画出随机解的路线图
DrawPath(Chrom(1,:),X)
pause(0.0001)