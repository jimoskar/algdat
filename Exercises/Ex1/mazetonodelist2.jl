


function mazetonodelist(maze)
    # Vi lager en matrise nodearray med størrelse tilsvarende maze,
    # men med Node-objekter isteden
    nodearray = Array{Node}(undef, size(maze, 1), size(maze, 2))

    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            if i == 1 || i == size(maze,1) || j == 1 || j == size(maze,2)
                nodearray[i,j] = Node(i,j,false)
            else
                nodearray[i,j] = Node(i,j)
            end
        end
    end

    maze2 = zeros(Int128,size(maze, 1)+2, size(maze, 2)+2)
    for i in 2:size(maze, 1)
        for j in 2:size(maze, 2)
            maze2[i+1,j+1] == maze[i,j]
        end
    end
    @show maze2

    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            if maze[i,j] == 1
                if maze2[i+1,j] == 1
                    push!(nodearray[i,j].neighbors,nodearray[i+1,j])
                end
                if maze2[i-1,j] == 1
                    push!(nodearray[i,j].neighbors,nodearray[i-1,j])
                end
                if maze2[i,j-1] == 1
                    push!(nodearray[i,j].neighbors,nodearray[i,j-1])
                end
                if maze2[i,j+1] == 1
                    push!(nodearray[i,j].neighbors,nodearray[i,j+1])
                end
            end

        end
    end

    nodelist = []
    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            if maze[i,j] == 1
                push!(nodelist,nodearray[i,j])
            end
        end
    end
    return nodelist
end

maze = [0 0 0 0 0 0 0
        1 1 0 1 1 1 0
        0 1 0 1 0 0 0
        0 1 0 1 1 1 0
        0 1 1 1 0 1 0
        0 1 0 1 0 1 1
        0 0 0 0 0 0 0]

@show  mazetonodelist(maze)
