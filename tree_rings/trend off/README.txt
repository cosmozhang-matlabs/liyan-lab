数据模型：
树轮：m*n 矩阵
年份：1*n 矩阵
其中，m为个体数，n为年数

=====================================

function [ gscore, gscore1, gscore2 ] = glk( data1, data2, epsilon )
计算两个向量的 Glk
参数：
    data1、data2：1*m矩阵，输入向量
    epsilon：极小值，当差分值小于epsilon时，认为该差分值约等于0。默认值为eps
返回值：
    gscore：两个向量的 Glk
    gscore1、gscore2：两组数据分别的 G-score

=====================================

function [ gscore_mean, gscores ] = glk_ref( data, data_ref )
计算一组`数轮`数据相对于某个参考向量的 Glk
参数：
    data：数轮数据，格式必须符合“数据模型”中提到的`数轮`
    data_ref：参考向量，可选如下值（默认为'most_mean'）：
              1*m 矩阵，参考向量为该矩阵
              'mean'，参考向量为`data`的均值
              'most_mean'，参考向量为`data`中最接近均值的个体（汉明距离最小）
返回值：
    gscore_mean：gscores的平均值
    gscores：1*m 矩阵，每个个体相对于参考向量的 Glk

=====================================

function [ gscore_mean, gscores ] = glk_overall( data1, data2 )
计算两组`数轮`数据的两两 Glk
或计算一组`数轮`数据内个体两两 Glk
参数：
    data1：m*k 矩阵，第一组数轮数据（m为个体数）
    data2：n*k 矩阵，第二组数轮数据（n为个体数）
           当`data2`未给出时，计算的是`data1`各个个体间的两两 Glk
返回值：
    gscore_mean：gscores的平均值
    gscores：m*n 矩阵，每个元素表明`data1`中相应个体和`data2`中相应个体的 Glk

=====================================

function [ gscore_mean, gscores ] = glk_float( data1, data2, window_size, method )
计算一组`数轮`数据内每个个体 相对于 某个参考向量 的滑动 Glk
或计算一组`数轮`数据内两两个体间滑动 Glk
参数：
    data1：m*k 矩阵，第一组数轮数据（m为个体数）
    data2：n*k 矩阵，第二组数轮数据（n为个体数）
    window_size：窗口大小
    method：可选如下值（默认为'most_mean'）：
              1*m 矩阵，以
              'mean'，以`data2`的均值为参考向量
              'most_mean'，以`data2`中最接近均值的个体（汉明距离最小）为参考向量
              'overall'，计算`data1`内两两个体间滑动 Glk
返回值（当method=`overall`时）：
    gscore_mean：1 * (k - window_size + 1) 矩阵，每个值代表了glk_overall的返回值gscore_mean
    gscores：m * (k - window_size + 1) 矩阵，每个列代表了glk_overall的返回值gscores
返回值（当method为其他值时）：
    gscore_mean：1 * (k - window_size + 1) 矩阵，每个值代表了glk_ref的返回值gscore_mean
    gscores：m * n * (k - window_size + 1)，每个矩阵代表了glk_ref的返回值gscores

=====================================

function [ goh,gou,grh,gru,grht,grut,gohu ] = glk_healty_unhealthy_7( data, idx_healthy, idx_unhealthy )
参见函数内注释












