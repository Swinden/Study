%% Mid2Max.m           % 中间型

function [posit_x] = Mid2Max(x,best)     % 中间型
    M = max(abs(x-best));
    posit_x = 1 - abs(x-best) / M;
end