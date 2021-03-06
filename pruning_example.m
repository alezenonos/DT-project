function prune_example(x,y)
    
% x: noSamples x 45 (as returned by loaddata)
% y: noSamples x 1 (as returned by loaddata)

% returns a classification tree with specific parameters
% treats the first 100 columns of x as unordered categorical values
tree = treefit(x,y,'method','classification','catidx',1:100,'splitmin',1);

% 10 fold CV
% cost: If t is a classification tree, the cost of a node is the sum of the
%       misclassification costs of the observations in that node
%       Ta lathoi poy exei kathe kombos
% nodes: number of terminal nodes in each subtree
% bestlevel: the best level to prune the tree
[cost,s,nodes,bestLevel] = treetest(tree,'cross',x,y);

% computes cost using resubstitution method
[cost2,s2,nodes2,bestLevel2] = treetest(tree,'resubstitution');


nodes(bestLevel2+1)
% nodes2(bestLevel2)
% Prunes the tree in best level
% Ayta den xrisimopoioyntai gia to plot all mporoyn na mas poyn 
prunedTree = treeprune(tree,'level',bestLevel);
prunedTree2 = treeprune(tree,'level',bestLevel2);

[mincost,minloc] = min(cost);
[mincost2,minloc2] = min(cost2);

%Blue curve
plot(nodes,cost,'b-x','MarkerSize',8)
hold on
plot(nodes(bestLevel+1),cost(bestLevel+1),'ks'); % To kalytero simeio na kanoyme prune to dentro
xlabel('Tree size (number of terminal nodes)')
ylabel('Cost')
grid on

% Red Curve
plot(nodes2,cost2,'r-x','MarkerSize',8)
plot(nodes2(bestLevel2+1),cost2(bestLevel2+1),'ks');% To kalytero simeio na kanoyme prune to dentro