clear all;
close all;
clc;
filename = [];
while isempty(filename)
    filename = input('Enter name of data file: ', 's');
    if filename == ' '
        filename = [];
    end
end
for CycNum=1:6 % repeat 6 time for each trial
s = RandStream('mt19937ar','Seed', sum(100*clock));
RandStream.setGlobalStream(s);
%SOA_list=0.025:0.025:1; %%%%% in second
SOA_list = 2:2:60; %%%%% in refresh frame
% 1 trialNum 2 SOA 3  content  4 layout 5 Rep 6 examplar 
    totalNum = length(SOA_list)*16; % 2x2x2*2 = 16 experimental trials
    orig_design = zeros(totalNum,6);
    orig_design(:,1) = [1:totalNum]';
    orig_design(:,3) = repmat([1 2 1 2 2 1 2 1 1 2 1 2 2 1 2 1],1,1*length(SOA_list));
    orig_design(:,4) = repmat([1 1 2 2 1 1 2 2 1 1 2 2 1 1 2 2],1,1*length(SOA_list));
    orig_design(:,5) = repmat([1 1 1 1 2 2 2 2 1 1 1 1 2 2 2 2],1,1*length(SOA_list));
    orig_design(:,6) = repmat([1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2],1,1*length(SOA_list));  
    %%%%SOA
    for i=1:totalNum
        %orig_design(i,2) = (floor((i-1)./8)+1)*0.025;
        orig_design(i,2) = (floor((i-1)./8)+1)*2;
    end;
    
    design_cell{CycNum,1}=orig_design;
end
    %%%%permutation
    orig_matrix=cell2mat(design_cell);
    matrix_order=randperm(totalNum*6); % all trails randomized
    rand_matrix = orig_matrix; 
    for i=1:6
        rand_matrix(:,i)=orig_matrix(matrix_order,i);
    end;
    % divided into runs
    for RunNum=1:36
        eval(['run_matrix' int2str(RunNum) '=rand_matrix(RunNum*80-79:RunNum*80,1:6);']);
    end
    % randomize runs 
     randrun=randperm(36);
    for i=1:36
        l=randrun(i);
        eval(['conditions = run_matrix' num2str(l) ';']);
        eval(['conditionrun' num2str(i) '= conditions;']);
    end
    save(sprintf('./mainexp_cond/subcondition_%s.mat', filename), 'conditionrun*');