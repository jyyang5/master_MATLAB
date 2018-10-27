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
    else
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