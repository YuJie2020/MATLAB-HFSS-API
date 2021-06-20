% ----------------------------------------------------------------------------
% 20200720 modify 更新语句
% reason: 原函数中实现同样功能的语句在新版 HFSS 中不再适用（VBScript 脚本语句有更新）
% ----------------------------------------------------------------------------
% ----------------------------------------------------------------------------
% function hfssSolveSetup(fid, SetupName)
% 
% Description :
% -------------
% Creates the VB script to solve a given solution setup.
% 
% Parameters :
% ------------
% fid       - file identifier of the HFSS script file.
% SetupName - name of the setup to be solved.
%
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssSolveSetup(fid, 'Setup750MHz');
% ----------------------------------------------------------------------------

% ----------------------------------------------------------------------------
% This file is part of HFSS-MATLAB-API.
%
% HFSS-MATLAB-API is free software; you can redistribute it and/or modify it 
% under the terms of the GNU General Public License as published by the Free 
% Software Foundation; either version 2 of the License, or (at your option) 
% any later version.
%
% HFSS-MATLAB-API is distributed in the hope that it will be useful, but 
% WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
% or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License 
% for more details.
%
% You should have received a copy of the GNU General Public License along with
% Foobar; if not, write to the Free Software Foundation, Inc., 59 Temple 
% Place, Suite 330, Boston, MA  02111-1307  USA
%
% Copyright 2004, Vijay Ramasami (rvc@ku.edu)
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------

function hfssSolveSetup(fid, SetupName)

fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("Optimetrics") \n');
fprintf(fid, 'oModule.SolveSetup "%s" \n', SetupName);