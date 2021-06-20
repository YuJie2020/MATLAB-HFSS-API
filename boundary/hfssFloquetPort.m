% ----------------------------------------------------------------------------
% 20200721 newFunction 功能: 添加 Floquet 波端口激励
%
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------
function hfssFloquetPort(fid, Name, FaceID, Start, End_A, End_B, Units)
Start = reshape(Start, length(Start), 1);
End_A = reshape(End_A, length(End_A), 1);
if iscell(Start)
    1;
else
    Start = mat2cell(Start,[1,1,1],1);
end
if iscell(End_A)
    1;
else
    End_A = mat2cell(End_A,[1,1,1],1);
end

Start = reshape(Start, length(Start), 1);
End_B = reshape(End_B, length(End_B), 1);
if iscell(Start)
    1;
else
    Start = mat2cell(Start,[1,1,1],1);
end
if iscell(End_B)
    1;
else
    End_B = mat2cell(End_B,[1,1,1],1);
end

fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("BoundarySetup")\n');
fprintf(fid, 'oModule.AssignFloquetPort _\n');
fprintf(fid, 'Array( _\n');
fprintf(fid, '"NAME:%s", _\n', Name);
fprintf(fid, '"Faces:=", Array(%d), _\n', FaceID);
fprintf(fid, '"NumModes:=", 2, _\n'); 
fprintf(fid, '"RenormalizeAllTerminals:=", true, _\n');
fprintf(fid, '"DoDeembed:=", false, _\n');
fprintf(fid, 'Array("NAME:Modes", _\n');
fprintf(fid, 'Array("NAME:Mode1", _\n');
fprintf(fid, '"ModeNum:=", 1, _\n');
fprintf(fid, '"UseIntLine:=", false, _\n');
fprintf(fid, '"CharImp:=", "Zpi"), _\n');
fprintf(fid, 'Array("NAME:Mode2", _\n');
fprintf(fid, '"ModeNum:=", 2, _\n');
fprintf(fid, '"UseIntLine:=", false, _\n');
fprintf(fid, '"CharImp:=", "Zpi")), _\n');
fprintf(fid, '"ShowReporterFilter:=", false, _\n');
fprintf(fid, '"ReporterFilter:=", Array(false, false), _\n');
fprintf(fid, '"UseScanAngles:=", true, _\n');
fprintf(fid, '"Phi:=", "0deg", _\n'); 
fprintf(fid, '"Theta:=", "0deg", _\n'); 
fprintf(fid, 'Array("NAME:LatticeAVector", _\n');

fprintf(fid, '"Start:=", _\n');
fprintf(fid, 'Array( _\n');
if isnumeric(Start{1,1})
    fprintf(fid, '"%f%s", _\n', Start{1,1}, Units);
else
    fprintf(fid, '"%s", _\n', Start{1,1});
end
    
if isnumeric(Start{2,1})
    fprintf(fid, '"%f%s", _\n', Start{2,1}, Units);
else
    fprintf(fid, '"%s", _\n', Start{2,1});
end
  
if isnumeric(Start{3,1})
   fprintf(fid, '"%f%s"), _\n', Start{3,1}, Units);
else
     fprintf(fid, '"%s"), _\n', Start{3,1});
end

fprintf(fid, '"End:=", _\n');
fprintf(fid, 'Array( _\n');
if isnumeric(End_A{1,1})
    fprintf(fid, '"%f%s", _\n', End_A{1,1}, Units);
else
    fprintf(fid, '"%s", _\n', End_A{1,1});
end

if isnumeric(End_A{2,1})
    fprintf(fid, '"%f%s", _\n', End_A{2,1}, Units);
else
    fprintf(fid, '"%s", _\n', End_A{2,1});
end

if isnumeric(End_A{3,1})
    fprintf(fid, '"%f%s")), _\n', End_A{3,1}, Units);
else
    fprintf(fid, '"%s")), _\n', End_A{3,1});
end

fprintf(fid, 'Array("NAME:LatticeBVector", _\n');
fprintf(fid, '"Start:=", _\n');
fprintf(fid, 'Array( _\n');
if isnumeric(Start{1,1})
    fprintf(fid, '"%f%s", _\n', Start{1,1}, Units);
else
    fprintf(fid, '"%s", _\n', Start{1,1});
end
    
if isnumeric(Start{2,1})
    fprintf(fid, '"%f%s", _\n', Start{2,1}, Units);
else
    fprintf(fid, '"%s", _\n', Start{2,1});
end
  
if isnumeric(Start{3,1})
   fprintf(fid, '"%f%s"), _\n', Start{3,1}, Units);
else
     fprintf(fid, '"%s"), _\n', Start{3,1});
end

fprintf(fid, '"End:=", _\n');
fprintf(fid, 'Array( _\n');
if isnumeric(End_B{1,1})
    fprintf(fid, '"%f%s", _\n', End_B{1,1}, Units);
else
    fprintf(fid, '"%s", _\n', End_B{1,1});
end

if isnumeric(End_B{2,1})
    fprintf(fid, '"%f%s", _\n', End_B{2,1}, Units);
else
    fprintf(fid, '"%s", _\n', End_B{2,1});
end

if isnumeric(End_B{3,1})
    fprintf(fid, '"%f%s")), _\n', End_B{3,1}, Units);
else
    fprintf(fid, '"%s")), _\n', End_B{3,1});
end

fprintf(fid, 'Array("NAME:ModesList", _\n');
fprintf(fid, 'Array("NAME:Mode", _\n');
fprintf(fid, '"ModeNumber:=", 1, _\n');
fprintf(fid, '"IndexM:=", 0, _\n');
fprintf(fid, '"IndexN:=", 0, _\n');
fprintf(fid, '"KC2:=", 0, _\n');
fprintf(fid, '"PropagationState:=", "Propagating", "Attenuation:=", 0, _\n');
fprintf(fid, '"PolarizationState:=", "TE", _\n');
fprintf(fid, '"AffectsRefinement:=", true), _\n');
fprintf(fid, 'Array("NAME:Mode", "ModeNumber:=", 2, _\n');
fprintf(fid, '"IndexM:=", 0, _\n');
fprintf(fid, '"IndexN:=", 0, _\n');
fprintf(fid, '"KC2:=", 0, _\n');
fprintf(fid, '"PropagationState:=", "Propagating", "Attenuation:=", 0, _\n');
fprintf(fid, '"PolarizationState:=", "TM", _\n');
fprintf(fid, '"AffectsRefinement:=", true))) \n');