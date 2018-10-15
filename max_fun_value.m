% max_fun_value.m
% Find the max function value for a given range and coresponding x


y = -10:0.1:10;
x = -10:0.1:10;
% w.l.o.g. transpose x
x_trans = transpose(x);
% resulting 
z = -x_trans.^2.*(y);
% z_max store the largest value for a particular x in range y
% max_x_index stores the index of largest coresponding x in x (array) 
[z_max max_x_index] = max(z,[],2);
x_max_z = zeros(length(x),1);
for i=1:1:length(x)
	x_max_z(i) = x(max_x_index(i));
end

% corespoding x for largest z over y
figure(3);
plot(y,x_max_z);
xlabel('y','FontSize',15);%
ylabel('opt. x','FontSize',15); 
set(gca, 'XScale', 'log');
set(gca,'FontSize',15);


% plot largest z over y
figure(4);
plot(y,z_max);
ylabel('opt. z ','FontSize',15);
xlabel('y','FontSize',15); 
set(gca,'FontSize',15);