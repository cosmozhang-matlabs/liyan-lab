%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% author: Jimmy Zhang
% email: jimmy.gnahz@gmail.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function glk_value = glk2(x,yy)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function calculates glk value for two vectors x and y
%
% INPUT VALUES:
% x - the vector of x 
% yy - the vector of yy values
%
% OUTPUT VALUES:
% glk_value - the result of the glk computation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% base data calculation
y=yy(:,2:end);  % remove the first column of year
[n1,n2]=size(y);
bb1=zeros(1,n2);
x_shift = [0;x];
y_shift = [bb1;y];
x_appended = [x;0];
y_appended = [y;bb1];
x_diff = x_appended - x_shift;
y_diff = y_appended - y_shift;
x_diff(n1+1,:)=[];
y_diff(n1+1,:)=[];
x_diff(1,:)=[];
y_diff(1,:)=[];
x_diff1=x_diff'; % this and the following two rows are to repeat it to matrix
x_diff2=repmat(x_diff1,n2,1);
x_diff=x_diff2';
product = x_diff.*y_diff;

%% set up sliding window
a=input('length of sliding window=? e.g., 8;  ')
% glk1=zeros(n1-1-a+1,n2); % define the structure of glk output
glk2=zeros(n1-1,n2); % define the structure of glk output same with product
tt=isnan(product);
glk2(tt)=nan;
for j=1:n2;
  for i=1:(n1-a); 
      acc=0;
      if isnan(product(i,j))==0;
      for b=i:i+a-1;
         if product(b,j)>=0.01
            acc = acc + 1;
         elseif product(b,j)>=-0.01
            acc = acc + 0.5;
         end 
      end
      end
      glk2(i,j)=acc/a
  end
end   
glk2(tt)=NaN;
glk2_mean=nanmean(glk2(1:n1-a,:),2);
glk_value = [yy(1:n1-a,1),glk2(1:n1-a,:),glk2_mean];
% site=input('output file name=????with quotation mark)');
% xlswrite(site,glk_value); %export data to Excel??line number less than 65536,column number less than 256;
%% Plot GLK mean values over the sliding window
plot (yy(1:n1-a,1),glk2_mean)

end