# master_MATLAB
## Contents

- Reduce for-loop (max fun value)


### Reduce for-loop (max fun value)

- Discription of problem 

Find the maximum value of a function f(x,y,...,z) in terms of x and the coresponding x 

- Solution 

	 - Using matrix
	 - Element-wise operation 
	 - Boardcasting (automatically done)  
	 - [max_val index] = max(z)  

- E.G.

	 - Suppose we have z=f(x,y) find max(z) in terms of x given a range of y
	 - f(x,y) = x^2/sqrt(y)+x*y
	 - 
	 - **NOTE**: must transpose x or y to make sure the resulting z is a 2D matrix( similar to grid search)
```matlab
y = start:increment:end;
x = x_start:x_increment:x_end;
% w.l.o.g. transpose x
x_trans = transpose(x);
% resulting y
z = x_trans.^2./sqrt(y)+x_trans.*y
% z_max store the largest value for a particular x in range y
% max_x_index stores the index of largest coresponding x in x (array) 
[z_max max_x_index] = max(z,[],dim=2);
x_max_z = zeros(length(x),1)
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

```