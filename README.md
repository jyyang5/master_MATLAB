# master_MATLAB
## Contents

- Reduce for-loop (max fun value)
- CellArray(plot muti funHandlers with legend)
- Plot pdf function for a given data
- Fliter a matrix
- Take index of median value in an array
- Compact plot using package subtightplot 



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

### Cell(plot muti funHandlers with legend)

- Discription of problem 

Suppose we have several functions f1,f2,...,fn with same input data x1,x2,...,xm 
For each function we want to plot the cureve with different legends

- Solution 

	 - Using Loop
	 - Use cell 
	 	- Stores functions in cell 

	 	cellFunArray = {@f1,@f2,...}
	 	- **NOTE**

	 		- If fun defined using **function** val=fName(var1,..)
	 	
	 			**cellFunArray = {@fName}**
	 		- Otherwise 

	 			**cellFunArray = {fName}**

	 		- when **call cellFunArray{index}(x1,x2,...)**
	 	- Stores lengedns in cell

	 	cellLegend = {'f1','f2',...}
	 	
	 	when call just use legend(cellLegend) 	
- E.G.

	 - Suppose we have three functions 

	 	- f1 = x.^(1.1);
	 	- f2 = x.^(1.2);
	 	- f3 = x.^(1.3); (defined use function)
	 - What to plot over a fixed array x = 1:1:100;
	 - 
	 - **NOTE**: must transpose x or y to make sure the resulting z is a 2D matrix( similar to grid search)
```matlab
% max_fun_value.m
% Find the max function value for a given range and coresponding x


f1 = @(x) x.^(1.1);
f2 = @(x) x.^1.2;

% if wanna compare and plot different strategy with legends cmp_legend != 0
% sigle plot cmp_legend = 1
cmp_legend =0; 
legendCell = {'f1','f2','f3'};
strategy_list = {f1,f2,@f3};
close all;
x = 1:1:10;
for i=1:length(strategy_list)
	if(i==length(strategy_list)) 
        cmp_legend = 1;		% plot legend in last function call
    end
    y = strategy_list{i}(x);
    figure(1); hold on;
    if(cmp_legend==0)
        plot(x,y);hold on;
    else % plot legends and axies (last function)
        plot(x,y);hold on;
        xlabel('x','fontsize',15);
        ylabel('y','fontsize',15);
        title('Multi y-x plot','fontsize',20);
        legend(legendCell);
        hold off;
    end
    
end
    

function val = f3(x)
    val = x.^1.3;
end

```

### Plot pdf function for a given data

- Discription of problem 

Given a set of data, count the number of occurance in a certain range and plot the normalized pdf function of the data

Plot empty bin ('FaceColor','none')
```
colour = 'g'
h = histogram(data,'Normalization','probability','FaceColor','none','edgecolor',colour);hold on;
```
- Solution 

	- Histogram and its built in properties

- E.G.
	- Given data (a list of numbers)
	- Want to plot the normlized pdf funtion 

```{matlab}
% Colour (light version compared to 'r','g','b')
% (green)[.2 .71 .3]
% (dark blue)[.25 .55 .79]
% dark red [.9 .1 .14]
% orange [1 0.5 0]
data = randn(100,1);
h = histogram(data,'Normalization','probability','facecolor',[1 0.5 0]);hold on;
count = h.BinCounts;		% height of the bar
w = h.BinWidth;				% width of the bar
range = h.BinLimits;		% [startX endX]
% Use the mid point of the bar
plot(range(1)+w/2:w:range(2)+w/2,c/sum(c),'color',[1 0.5 0]);hold on;
```

### Fliter a matrix

```{matlab}
# Filter zeros
filtered = nonezeros(data)

```


### Take index of median value in an array
- Discription of problem 

Have an array 'x'

Want to find the index of the median value of 'x'

- Solution 

Sort array 

Find median value

Filter get the index 


```{matlab}
x = randn(10,1);
% Sort the array
sorted_x = sort(x);
% Get the median value
med_x_val = sorted_x(length(sorted_x)/2);
% Obtain the index of median value in original array
x_med_index = find(x == med_x_val);
% w.l.o.g. take the first value (could be an array)
x_med_index = x_med_index(1);
```

### [Compact plot using package subtightplot](https://www.mathworks.com/matlabcentral/fileexchange/39664-subtightplot)
- Discription of problem 

Merge several plots in one figures but the spacing is too large

- Solution 

Use package subtightplot(subtightplot.m)

**NOTE**: things will be fine if you full screen the figure

- Paramters
```
subplot = @(m,n,p) subtightplot (m, n, p, [0.05 0.02], [0.05 0.02], [0.05 0.02]);		% compact setting that I like
% [rowSpace colSpace]
```



```{matlab}
% For tight subplots PLEASE put subtightplot.m in the same folder
make_it_tight = true;
subplot = @(m,n,p) subtightplot (m, n, p, [0.05 0.02], [0.05 0.02], [0.05 0.02]);		% compact setting that I like
if ~make_it_tight,  clear subplot;  end
% Then include you previous subplot code should do 
x = 1:0.1:5;
figure(20);
for i=1:1:4
	subplot(2,2,i);
	plot(x,x.^i/2);
end

```


