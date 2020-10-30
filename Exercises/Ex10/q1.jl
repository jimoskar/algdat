using DataStructures: PriorityQueue, enqueue!, dequeue!


mutable struct Node
    name::String # used to distinguish nodes when debugging
    d::Union{Float64, Nothing} # d for distance
    p::Union{Node, Nothing} # p for predecessor
end
Node(name) = Node(name, nothing, nothing) # constructor used for naming nodes

mutable struct Graph
    V::Array{Node} # V for Vertices
    Adj::Dict{Node, Array{Node}} # Adj for Adjacency
end



function general_dijkstra!(G, w, s, reverse=false)
    initialize!(G,s)
    S = Array{Node, 1}()
    Q = PriorityQueue(u => u.d for u in G.V)
    if reverse
        Q = PriorityQueue(Base.Order.Reverse)
    end


    while !isempty(Q)
        u = dequeue!(Q)
        push!(S,u)
        for v in G.Adj[u]
            if haskey(Q, v)
                update!(u,v,w)
            end
        end
    end

end
