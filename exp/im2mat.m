% im2mat.m
clear all;
file_dir = 'mainsti';
img_file = dir(file_dir);
cd mainsti

for i = 4:11
   tmp_x = img_file(i).name(3:9);
   tmp_y = img_file(i).name(1);
   eval([tmp_x '_' tmp_y '=imread(img_file(i).name);']);
end

for i = 12:19
   tmp_x = img_file(i).name(1:6);
   eval([tmp_x '=imread(img_file(i).name);']);
end
pnoise1 = imread('pnoise1.jpg');
cd ..

save mainsti nat* urb* pnoise1