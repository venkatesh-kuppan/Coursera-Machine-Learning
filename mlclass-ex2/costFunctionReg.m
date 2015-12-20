function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

%J = 1 ./m * ( -y' * log( sigmoid(X * theta) ) - ( 1 - y' ) * log ( 1 - sigmoid( X * theta)) ) + lambda / (2*m) * ( theta' * theta - theta(1)^2 );
%mask = ones(size(theta));
%mask(1) = 0;
%grad = 1 ./m * X' * (sigmoid(X * theta) - y) + lambda * (theta .* mask)/ m;

MAX_ITR = 7;
J = zeros(MAX_ITR, 1);
for i = 1:MAX_ITR
    % Calculate the hypothesis function
    z = X * theta;
    h = 1 ./ (1 + exp(-z));
 J(i) =(1/m)*sum(-y.*log(h) - (1-y).*log(1-h))+ ...
    (lambda/(2*m))*norm(theta([2:end]))^2;
	
 G = (lambda/m).*theta; G(1) = 0; % extra term for gradient
  grad = ((1/m).*X' * (h-y)) + G;
  theta = theta - grad;


% =============================================================

end
