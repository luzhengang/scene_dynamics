clc;
close all;
clear all;
load subcondition_AW.mat;
for j=1:24
data=eval(['conditionrun' int2str(j)]);
% every subject has to be changed if the 1st subject is 1 then
% this subject is 2; if the 1st subject is 2 then this one is 1
for i=1:80 
    if data(i,3)==1
        data(i,3)=3; 
    elseif data(i,3)==2
        data(i,3)=4; 
    end
end
for i=1:80
    if data(i,3)==3
        data(i,3)=2;
    elseif data(i,3)==4
        data(i,3)=1;
    end
end
for i=1:80
    if data(i,4)==1
        data(i,4)=3;
    elseif data(i,4)==2
        data(i,4)=4;
    end
end
for i=1:80
    if data(i,4)==3
        data(i,4)=2;
    elseif data(i,4)==4
        data(i,4)=1;
    end
end
% for i=1:80
%     if data(i,5)==1
%         data(i,5)=3;
%     elseif data(i,5)==2
%         data(i,5)=4;
%     end
% end
% for i=1:80
%     if data(i,5)==3
%         data(i,5)=2;
%     elseif data(i,5)==4
%         data(i,5)=1;
%     end
% end
eval(['cond' num2str(j) '= data;']);
end
%%%%%%%%%%%%
conditionrun1=cond1;
conditionrun2=cond2;
conditionrun3=cond3;
conditionrun4=cond4;
conditionrun5=cond5;
conditionrun6=cond6;
conditionrun7=cond7;
conditionrun8=cond8;
conditionrun9=cond9;
conditionrun10=cond10;
conditionrun11=cond11;
conditionrun12=cond12;
conditionrun13=cond13;
conditionrun14=cond14;
conditionrun15=cond15;
conditionrun16=cond16;
conditionrun17=cond17;
conditionrun18=cond18;
conditionrun19=cond19;
conditionrun20=cond20;
conditionrun21=cond21;
conditionrun22=cond22;
conditionrun23=cond23;
conditionrun24=cond24;
%%%%%%%%%%%%
save subcondition_JR conditionrun1  conditionrun2  conditionrun3 conditionrun4  conditionrun5  conditionrun6  conditionrun7 conditionrun8 conditionrun9  conditionrun10 conditionrun11  conditionrun12  conditionrun13 conditionrun14  conditionrun15  conditionrun16  conditionrun17  conditionrun18 conditionrun19 conditionrun20  conditionrun21  conditionrun22 conditionrun23 conditionrun24
