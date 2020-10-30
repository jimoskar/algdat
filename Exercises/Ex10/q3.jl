




function floyd_warshall(adjacency_matrix, nodes, f, g)
    for k in 1:nodes
        for i in 1:nodes
            for j in 1:nodes
                adjacency_matrix[i,j] = f(adjacency_matrix[i,j],g(adjacency_matrix[i,k],adjacency_matrix[k,j]))

            end
        end
    end
end
