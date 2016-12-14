% MIT License
% 
% Copyright (c) 2016 Sotiris Papatheodorou
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

% Fill NaN delimited polygons
function h = fill_poly(P , colorspec )

if nargin < 2
    colorspec = 'b';
end

x = P(1,:);
y = P(2,:);

nan_indices = find( isnan(x) ); % The indices are the same for x and y
indices = [ 0 nan_indices length(x)+1 ];

h = [];

for i=1:length( nan_indices )+1

    ht = fill(   x( indices(i) + 1 : indices(i+1) - 1 ) , ...
            y( indices(i) + 1 : indices(i+1) - 1 ) , ...
            colorspec ,'EdgeColor','None');
    
    h = [h ht];
    hold on;

end

