%--------------------------------------------------------------------------
%           创建Windows Media Player服务器，播放歌曲“青花瓷”
%--------------------------------------------------------------------------

% 创建Windows Media Player服务器，并返回对象句柄h
h = actxserver('WMPlayer.OCX.7')
h.get    % 查看对象h的所有属性

h.invoke    % 查看对象h的所有方法

h.openPlayer('E:\codebase\suanfajihe\【Matlab】40 统计分析与应用\1. 利用MATLAB生成Word和Excel文档\青花瓷.mp3')