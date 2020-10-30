
#mutable struct Node
    #i::Int
    #j::Int
    #floor::Bool
    #neighbors::Array{Node}
    #color::Union{String,Nothing}
    #distance::Union{Int,Nothing}
    #predecessor::Union{Node,Nothing}
#Node(i, j, floor=true) = Node(i, j, floor, [], nothing, nothing, nothing)

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

    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            if nodearray[i,j].floor
                push!(maze[i,j].neighbors,maze[i-1,j])
                push!(maze[i,j].neighbors,maze[i,j+1])
                push!(maze[i,j].neighbors,maze[i+1,j])
                push!(maze[i,j].neighbors,maze[i,j-1])
            else
                if i == 1 && j == 1
                    push!(maze[i,j].neighbors,maze[i+1,j])
                    push!(maze[i,j].neighbors,maze[i,j+1])
                elseif i == 1 && j == size(maze,2)
                    push!(maze[i,j].neighbors,maze[i+1,j])
                    push!(maze[i,j].neighbors,maze[i,j-1])
                elseif i == 1
                    push!(maze[i,j].neighbors,maze[i-1,j])
                    push!(maze[i,j].neighbors,maze[i,j+1])
                    push!(maze[i,j].neighbors,maze[i,j-1])
                elseif i == size(maze,2) && j == 1
                    push!(maze[i,j].neighbors,maze[i-1,j])
                    push!(maze[i,j].neighbors,maze[i,j+1])
                elseif i == size(maze,1) && j == size(maze, 2)
                    push!(maze[i,j].neighbors,maze[i+1,j])
                    push!(maze[i,j].neighbors,maze[i,j-1])
                elseif i == size(maze, 1)
                    push!(maze[i,j].neighbors,maze[i,j+1])
                    push!(maze[i,j].neighbors,maze[i-1,j])
                    push!(maze[i,j].neighbors,maze[i,j-1])
                elseif j == 1
                    push!(maze[i,j].neighbors,maze[i,j+1])
                    push!(maze[i,j].neighbors,maze[i+1,j])
                    push!(maze[i,j].neighbors,maze[i-1,j])
                elseif j == size(maze, 2)
                    push!(maze[i,j].neighbors,maze[i,j-1])
                    push!(maze[i,j].neighbors,maze[i+1,j])
                    push!(maze[i,j].neighbors,maze[i-1,j])
                end

            end

        end
    end

    # Fyll inn kode for å returnere en nodeliste ut ifra nodearray
end
