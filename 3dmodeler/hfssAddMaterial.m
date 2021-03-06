% ----------------------------------------------------------------------------
% 20200718 modify 将参数细节优化
% reason: 原函数中无法具体设置材料的属性（相对介电常数和介质损耗角正切）
% ----------------------------------------------------------------------------
% function hfssAssignMaterial(fid, Object, Material)
% 
% Description :
% -------------
% Creates the VB Script necessary to assign a material selection to an 
% existing HFSS object.
%
% Parameters :
% ------------
% fid      - file identifier of the HFSS script file.
% Object   - name of the object to which the material is to assigned.
% Material - the material to be assigned to the Object. This is a string that
%            should either be predefined in HFSS or defined using 
%            hfssAddMaterial(...)
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssAssignMaterial(fid, 'FR4Mount', 'FR4epoxy'); 
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
function hfssAddMaterial(fid, Name, perm, dlt)

fprintf(fid, '\n');
fprintf(fid, 'Set oDefinitionManager = oProject.GetDefinitionManager()\n');
fprintf(fid, 'oDefinitionManager.AddMaterial _\n');
fprintf(fid, 'Array("NAME:%s", _\n',Name);
fprintf(fid, '"CoordinateSystemType:=", _\n');  
fprintf(fid, '"Cartesian", _\n');
fprintf(fid, 'Array("NAME:AttachedData"), _\n');
fprintf(fid, 'Array("NAME:ModifierData"), _\n');
fprintf(fid, '"permittivity:=","%f",_\n',perm);
fprintf(fid, '"dielectric_loss_tangent:=","%f")\n',dlt);




