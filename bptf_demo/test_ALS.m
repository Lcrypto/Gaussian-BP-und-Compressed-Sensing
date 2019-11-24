function [] = test_ALS()

A = [ 0 1 0 2; 0 3 0 2; 1 1 0 0; 2 1 0 1];
A=sparse(A);
[a,b,c]=find(A);
% a list of non-zero positions i,j of sparse factorized matrix A
TTr.subs = [a b ones(length(c),1)];
% a list of matrix values
TTr.vals = c;
% size of factorized matrix A
TTr.size = [ size(A) 1];

B = [ 1 0 2 0; 0 0 1 0; 0 0 -1 0; 0 0 -.5 1];
B=sparse(B);
[a,b,c]=find(B);
w=ones(length(c),1);
TTe.subs = [a b w];
TTe.vals = c;
TTe.size = [size(A) 1];

D=20; % dimension of matrices U,V s.t. U'V=~ A
max_iter = 100; % number of iterations
addpath ~/www-graphlab/graphlab/
save_c_gl4a('als', TTr);
save_c_gl4a('alse', TTe);
ALS(TTr,TTe, D, max_iter,0.001,0.001);