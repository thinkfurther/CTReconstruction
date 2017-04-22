function views = rotate_axial_plane( V, degrees )
%%ROTATE_AXIAL_PLANE Rotate the volumn on axial plane,
% save all views in given degrees.
%   'V' is the volumn data.
%   'degrees' is a vector consists of degrees, default is
%   from 0 to 360.

% Set default value for degrees
if nargin < 2 || isempty(degrees)
    degrees = 0 : 360;
end

% Obtain the size of input volumn data
[w, h, d] = size(V);

% Obtain the length of 'degrees'
d_num = length(degrees);

% Initialize the output
views = zeros(d, w, d_num);

% Initialize a temporary variable
V_temp = zeros(w, h, d);

% Conut how many views have been obtained
step = 0;
h = waitbar(0, 'Rotating Axial Plane ...');

for i = degrees
    % In each degree,
    for j = 1 : d
        % In each image in the volumn, rotate the image,
        % thus, the volumn will be rotated
        V_temp(:, :, j) = imrotate(V(:, :, j), i, 'crop');
        
    end
    
    % Save MIP into output
    step = step + 1;
    views(:, :, step) = MIP(V_temp, 'coronal');
    
    waitbar(step / d_num)
    
end
close(h)

end