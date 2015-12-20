function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
for i = 1:rows(X)
    minJ = 10000;
    minK = 0;
    
    % check against all centroids
    for k = 1:K
        C = X(i,:) - centroids(k,:);
        
        % sum all the columns squared values
        sumSqr = 0;
        for l = 1:columns(X)
            sumSqr = sumSqr + C(l).^2;
        end
        
        if sumSqr < minJ
            minJ = sumSqr;
            minK = k;
        end
    end

    % save the index with the min value
    idx(i) = minK;
end






% =============================================================

end

