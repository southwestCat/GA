clear
clc
close all
%个城市坐标位置,load schoolPosition.mat
load('cityPosition.mat');
NIND=100;       %种群大小
MAXGEN=100;
Pc=0.9;         %交叉概率
Pm=0.05;        %变异概率
GGAP=0.9;      %代沟(Generation gap)
D=getDistance(X);  %生成距离矩阵
N=size(D,1);    % 城市数目
%% 初始化种群
Chrom=InitPop(NIND,N);
%% 画出随机解的路线图
DrawPath(Chrom(1,:),X)
%% 输出随机解的路线和总距离
disp('初始种群中的一个随机值:')
OutputPath(Chrom(1,:),cityName);
Rlength=PathLength(D,Chrom(1,:));
disp(['总距离：',num2str(Rlength)]);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
%% 优化
gen=1;
pause(1)
figure;
hold on;box on
xlim([0,MAXGEN])
title('优化过程')
xlabel('代数')
ylabel('最优值')
ObjV=PathLength(D,Chrom);  %计算路线长度
preObjV=min(ObjV);
while gen<MAXGEN
    %% 计算适应度
    ObjV=PathLength(D,Chrom);  %计算路线长度
    line([gen-1,gen],[preObjV,min(ObjV)]);pause(0.0001)
    preObjV=min(ObjV);
    FitnV=Fitness(ObjV);    % 取距离的倒数作为适应度
    %% 选择
    SelCh=Select(Chrom,FitnV,GGAP);
    %% 交叉操作
    SelCh=Recombin(SelCh,Pc);
    %% 变异
    SelCh=Mutate(SelCh,Pm);
    %% 逆转操作
    SelCh=Reverse(SelCh,D);
    %% 重插入子代的新种群
    Chrom=Reins(Chrom,SelCh,ObjV);
    %% 更新迭代次数
    gen=gen+1 ;
end
%% 画出最优解的路线图
ObjV=PathLength(D,Chrom);  %计算路线长度
[minObjV,minInd]=min(ObjV);
DrawPath(Chrom(minInd(1),:),X)
%% 输出最优解的路线和总距离
disp('最优解:')
p=OutputPath(Chrom(minInd(1),:),cityName);
disp(['总距离：',num2str(ObjV(minInd(1)))]);
disp('-------------------------------------------------------------')
