clear
clc
close all
%����������λ��,load schoolPosition.mat
load('schoolPosition.mat');
NIND=100;       %��Ⱥ��С
MAXGEN=200;
Pc=0.9;         %�������
Pm=0.05;        %�������
GGAP=0.9;      %����(Generation gap)
D=getDistance(X);  %���ɾ������
N=size(D,1);    %(34*34)
%% ��ʼ����Ⱥ
Chrom=InitPop(NIND,N);
%% ����������·��ͼ
DrawPath(Chrom(1,:),X)
pause(0.0001)