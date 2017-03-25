function [ h,p,x2,freeDegree ] = mchi2test( fs )

h = NaN;
p = NaN;
x2 = NaN;

alpha = 0.05;

fsum2_ = sum(fs,1);
fsum1_ = sum(fs,2);
fsum2 = repmat(fsum2_,[size(fs,1),1]);
fsum1 = repmat(fsum1_,[1,size(fs,2)]);
% disable_indexes = ~((fsum1==0)&(fsum2==0));
disable_indexes_1 = fsum1_~=0;
disable_indexes_2 = fsum2_~=0;
fs = fs(disable_indexes_1, disable_indexes_2);
fsum1 = fsum1(disable_indexes_1, disable_indexes_2);
fsum2 = fsum2(disable_indexes_1, disable_indexes_2);
fsum = sum(sum(fs));
fs_e = fsum1 .* fsum2 ./ fsum;
freeDegree = (size(fs,1)-1)*(size(fs,2)-1);

if freeDegree > 0
    x2d = ( (fs-fs_e).^2 ) ./ fs_e;
    x2 = sum(sum(x2d));

    p = 1-chi2cdf(x2,freeDegree);
    h = (p >= alpha);
end

end

