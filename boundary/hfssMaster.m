% 20200720 newFunction 功能: 添加主边界条件
%
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------
function hfssMaster(fid, Name, face, Start, End, Units)
Start = reshape(Start, length(Start), 1);
End = reshape(End, length(End), 1);
if iscell(Start)
    1;
else
    Start = mat2cell(Start,[1,1,1],1);
end
if iscell(End)
    1;
else
    End = mat2cell(End,[1,1,1],1);
end

fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("BoundarySetup")\n');
fprintf(fid, 'oModule.AssignMaster _\n');
fprintf(fid, 'Array("NAME:%s", _\n',Name);
fprintf(fid, '"Faces:=", _\n');  
fprintf(fid, 'Array(%d), _\n', face);
fprintf(fid, 'Array("NAME:CoordSysVector", _\n');
fprintf(fid, '"Origin:=", _\n');

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

fprintf(fid, '"UPos:=", _\n');  
fprintf(fid, 'Array( _\n');
if isnumeric(End{1,1})
    fprintf(fid, '"%f%s", _\n', End{1,1}, Units);
else
    fprintf(fid, '"%s", _\n', End{1,1});
end

if isnumeric(End{2,1})
    fprintf(fid, '"%f%s", _\n', End{2,1}, Units);
else
    fprintf(fid, '"%s", _\n', End{2,1});
end

if isnumeric(End{3,1})
    fprintf(fid, '"%f%s")), _\n', End{3,1}, Units);
else
    fprintf(fid, '"%s")), _\n', End{3,1});
end

fprintf(fid, '"ReverseV:=", _\n');
fprintf(fid, 'true)\n');