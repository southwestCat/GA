clear
clc
close all
%����������λ��,load schoolPosition.mat
load('cityPosition.mat');
NIND=100;       %��Ⱥ��С
MAXGEN=100;
Pc=0.9;         %�������
Pm=0.05;        %�������
GGAP=0.9;      %����(Generation gap)
D=getDistance(X);  %���ɾ������
N=size(D,1);    % ������Ŀ
%% ��ʼ����Ⱥ
Chrom=InitPop(NIND,N);
%% ����������·��ͼ
DrawPath(Chrom(1,:),X)
%% ���������·�ߺ��ܾ���
disp('��ʼ��Ⱥ�е�һ�����ֵ:')
OutputPath(Chrom(1,:),cityName);
Rlength=PathLength(D,Chrom(1,:));
disp(['�ܾ��룺',num2str(Rlength)]);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
%% �Ż�
gen=1;
pause(1)
figure;
hold on;box on
xlim([0,MAXGEN])
title('�Ż�����')
xlabel('����')
ylabel('����ֵ')
ObjV=PathLength(D,Chrom);  %����·�߳���
preObjV=min(ObjV);
while gen<MAXGEN
    %% ������Ӧ��
    ObjV=PathLength(D,Chrom);  %����·�߳���
    line([gen-1,gen],[preObjV,min(ObjV)]);pause(0.0001)
    preObjV=min(ObjV);
    FitnV=Fitness(ObjV);    % ȡ����ĵ�����Ϊ��Ӧ��
    %% ѡ��
    SelCh=Select(Chrom,FitnV,GGAP);
    %% �������
    SelCh=Recombin(SelCh,Pc);
    %% ����
    SelCh=Mutate(SelCh,Pm);
    %% ��ת����
    SelCh=Reverse(SelCh,D);
    %% �ز����Ӵ�������Ⱥ
    Chrom=Reins(Chrom,SelCh,ObjV);
    %% ���µ�������
    gen=gen+1 ;
end
%% �������Ž��·��ͼ
ObjV=PathLength(D,Chrom);  %����·�߳���
[minObjV,minInd]=min(ObjV);
DrawPath(Chrom(minInd(1),:),X)
%% ������Ž��·�ߺ��ܾ���
disp('���Ž�:')
p=OutputPath(Chrom(minInd(1),:),cityName);
disp(['�ܾ��룺',num2str(ObjV(minInd(1)))]);
disp('-------------------------------------------------------------')
