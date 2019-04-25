function tf = ver_greater_than(ver1, ver2)
%function tf = ver_greater_than(ver1, ver2)
% ver1 > ver2 ? 1 : 0;
%
% INPUTS
%    ver1    [string]    software version number
%    ver2    [string]    software version number
%
% OUTPUTS
%    tf      [bool]      true if ver1 > ver2
%
% SPECIAL REQUIREMENTS
%    none

% Copyright (C) 2015 Dynare Team
%
% This file is part of Dynare.
%
% Dynare is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

tf = true;
ver1 = strsplit(ver1, {'.', '-'});
ver2 = strsplit(ver2, {'.', '-'});

maj_ver1 = str2double(ver1{1});
maj_ver2 = str2double(ver2{1});
if maj_ver1 > maj_ver2
    return;
end

min_ver1 = str2double(ver1{2});
min_ver2 = str2double(ver2{2});
if (maj_ver1 == maj_ver2) && (min_ver1 > min_ver2)
    return;
end

if (length(ver1) == length(ver2) && length(ver1) == 3)
    ismaster1 = isnan(str2double(ver1{3}));
    ismaster2 = isnan(str2double(ver2{3}));
    if (maj_ver1 == maj_ver2) && (min_ver1 == min_ver2) && (ismaster1 && ~ismaster2)
        return;
    end

    if ~ismaster1 && ~ismaster2
        rev_ver1 = str2double(ver1{3});
        rev_ver2 = str2double(ver2{3});
        if (maj_ver1 == maj_ver2) && (min_ver1 == min_ver2) && (rev_ver1 > rev_ver2)
            return;
        end
    end
end

tf = false;
end
