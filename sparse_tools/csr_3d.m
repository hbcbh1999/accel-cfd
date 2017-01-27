close all
clear all
clc

% Set the size of the geometric grid
N = 4;

% DetermiNe Number of Nodes
i_Nodes = (N-2)^3;
l_Nodes = (N-2)*12;
c_Nodes = 8;
s_Nodes = (N-2)^2*6;

% Calculate Total A matrix Variables
i_vars = i_Nodes*7;
l_vars = l_Nodes*5;
s_vars = s_Nodes*6;
c_vars = c_Nodes*4;

t_vars = i_vars+l_vars+s_vars+c_vars;

N_perc = t_vars/(N^3)^2;

line1_text = 'Total Number of A matrix (3D) vars for %3.0f is : %3.0f.\n';
line2_text = 'Sparsity perceNtage is: %0.10f\n';

fprintf(line1_text,N,t_vars)
fprintf(line2_text,N_perc)

% Make CSR Arrays
v = zeros(1,t_vars);
c = zeros(1,t_vars);
r = zeros(1,N^3+1);

z = -1*rand;

v = v+z;

i=1;
j=1;
k=1;

a_c = 4;
a_l = 5;
a_s = 6;
a_i = 7;

% *?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?
% *?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?
% *?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?
% *?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?
% *?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?
% *?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?

% k = 1
stp = 1;
v(stp) = 1;

for i = 1:1:N-1
    
    stp = stp + a_l;
    v(stp) = 1;
    
end

stp = stp + a_c;
v(stp) = 1;

for i = 1:1:N-1
    
    stp = stp + a_s;
    v(stp) = 1;
    
end

stp = stp + a_c;
v(stp) = 1;

for i = 1:1:N-1
    
    stp = stp + a_l;
    v(stp) = 1;
    
end

stp = stp + a_c - 1;
v(stp) = 1;

for i = 1:1:N-1
    
    stp = stp + a_s;
    v(stp) = 1;
    
end

stp = stp + a_l;
v(stp) = 1;

for i = 1:1:N-1
    
    stp = stp + a_i;
    v(stp) = 1;
    
end

stp = stp + a_l;
v(stp) = 1;

for i = 1:1:N-1
    
    stp = stp + a_s;
    v(stp) = 1;
    
end

stp = stp + a_c - 1;
v(stp) = 1;


for i = 1:1:N-1
    
    stp = stp + a_l;
    v(stp) = 1;
    
end

stp = stp + a_c;
v(stp) = 1;

for i = 1:1:N-1
    
    stp = stp + a_s;
    v(stp) = 1;
    
end

stp = stp + a_c;
v(stp) = 1;

for i = 1:1:N-1
    
    stp = stp + a_l;
    v(stp) = 1;
    
end

test = find(v == 1);
test'
