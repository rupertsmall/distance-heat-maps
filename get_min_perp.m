% get_min_perp function definition
% returns the minimum perpendicular distance to Thames river
 
function [DISTANCE] = get_min_perp(X,Y,PX,PY,N)
 
len = max(size(X));      % ignore orientation of vector
DISTANCE = 20*ones(N,N); % initiate probability matrix ~ 0
 
% calculate minimum perdpendicular length to piecewise Thames
for i=1:len-1
    % sort, because Thames sometimes goes backwards
    [x1 index] = min([X(i) X(i+1)]);
    x2 = X(i+2-index);
    y1 = Y(i+index-1); y2 = Y(i+2-index);
    
    % thames line y = mx + c
    m =(y2-y1)/(x2-x1);
    c = y1-m*x1;
    
    % perp lines matrix py = (-1/m)px + k
    K = PY + (1/m)*PX;
    
    % intercept matrices!
    INT_X = m*(K-c)/(m^2 + 1); INT_Y = m*INT_X + c;
    DIST = sqrt((INT_X - PX).^2 + (INT_Y - PY).^2);
    UPDATE = (x1 <= INT_X).*(INT_X <= x2).*(DIST < DISTANCE);
    UPDATE = logical(UPDATE);
    DISTANCE(UPDATE) = DIST(UPDATE);
    
    % calculate distance from cusps
    CUSP_DIST = sqrt((x1 - PX).^2 + (y1 - PY).^2);
    UPDATE = (CUSP_DIST < DISTANCE);
    UPDATE = logical(UPDATE);
    DISTANCE(UPDATE) = CUSP_DIST(UPDATE);
end
 
% do last point excluded by for loop
x1 = X(end); y1 = Y(end);
CUSP_DIST = sqrt((x1 - PX).^2 + (y1 - PY).^2);
UPDATE = (CUSP_DIST < DISTANCE);
UPDATE = logical(UPDATE);
DISTANCE(UPDATE) = CUSP_DIST(UPDATE);
 
end
