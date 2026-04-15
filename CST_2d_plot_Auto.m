clear; clc; close all;

%% ========== 1. 读取数据 ==========
filename = 'test2.txt';
A = importdata(filename);

% 列顺序固定为CST标准导出格式：
% x, y, z, ExRe, ExIm, EyRe, EyIm, EzRe, EzIm
x_raw = A.data(:,1);
y_raw = A.data(:,2);
z_raw = A.data(:,3);

Ex_real = A.data(:,4);
Ex_imag = A.data(:,5);
Ey_real = A.data(:,6);
Ey_imag = A.data(:,7);
Ez_real = A.data(:,8);
Ez_imag = A.data(:,9);

%% ========== 2. 自动读取坐标范围（不需要手动写lx, ly） ==========
x_vec = unique(x_raw);
y_vec = unique(y_raw);
nx = length(x_vec);
ny = length(y_vec);

fprintf('自动检测网格: nx=%d, ny=%d\n', nx, ny);
fprintf('x范围: %.1f ~ %.1f um\n', min(x_vec), max(x_vec));
fprintf('y范围: %.1f ~ %.1f um\n', min(y_vec), max(y_vec));

%% ========== 3. 合成复数电场 ==========
Ex = Ex_real + 1i * Ex_imag;
Ey = Ey_real + 1i * Ey_imag;
Ez = Ez_real + 1i * Ez_imag;

% 相位校正（与原代码一致）
Ez = Ez .* exp(1i * pi/2);

%% ========== 4. Reshape 为二维矩阵 ==========
% CST导出顺序: x变化快，y变化慢（即按行扫描）
Ex = reshape(Ex, nx, ny).';
Ey = reshape(Ey, nx, ny).';
Ez = reshape(Ez, nx, ny).';

%% ========== 5. 生成网格坐标 ==========
[X, Y] = meshgrid(x_vec, y_vec);

%% ========== 6. 画图 ==========
% --- Ez 强度图 ---
figure;
g = pcolor(X, Y, abs(Ez).^2);
set(g, 'LineStyle', 'none');
colorbar;
colormap(hot);
title('|Ez|^2 强度分布');
xlabel('x (um)');
ylabel('y (um)');
axis equal tight;

% --- Ez 实部图 ---
figure;
g = pcolor(X, Y, real(Ez));
set(g, 'LineStyle', 'none');
colorbar;
colormap(jet);
title('Re(Ez) 实部分布');
xlabel('x (um)');
ylabel('y (um)');
axis equal tight;

% --- Ex 强度图 ---
figure;
g = pcolor(X, Y, abs(Ex).^2);
set(g, 'LineStyle', 'none');
colorbar;
colormap(hot);
title('|Ex|^2 强度分布');
xlabel('x (um)');
ylabel('y (um)');
axis equal tight;