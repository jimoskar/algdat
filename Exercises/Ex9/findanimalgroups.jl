import Base.union!



function findset(x)
    if x.p != x
        x.p = findset(x.p)
    end
    return x.p
end

function link(x,y)
    if x.rank > y.rank
        y.p = x
    else
        x.p = y
        if x.rank == y.rank
            y.rank += 1
        end
    end

end


function union!(x,y)
    link(findset(x),findset(y))
end



function findclusters(E, n, k)

    A = Dict{DisjointSetNode,Array{Int128,1}}()

    nodes = [DisjointSetNode() for i in 1:n]

    sort!(E)
    treesleft = n

    for edge in E
        if treesleft == k
            break
        end
        u = nodes[edge[2]]
        v = nodes[edge[3]]

        if findset(u) != findset(v)
                union!(findset(u),findset(v))
            treesleft -= 1
        end
    end

    for i in 1:n
        root = findset(nodes[i])
        if haskey(A,root)
            push!(A[root],i)
        else
            A[root] = [i]
        end
    end

    list = []

    for value in values(A)
        push!(list,value)
    end
    return list
end

function hammingdistance(s1, s2)
    dist = 0
    for i in 1:length(s1)
        if s1[i] != s2[i]
            dist += 1
        end
    end
    return dist
end


function findanimalgroups(animals, k)
    E = Array{Tuple{Int128,Int128,Int128},1}()
    for i in 1:length(animals)
        for j in i+1:length(animals)
            @show animals[i][2]
            @show animals[j][2]
            push!(E,(hammingdistance(animals[i][2],animals[j][2]),i,j))
        end
    end

    clusters = findclusters(E,length(animals),k)
    animalcluster = [Array{String,1}() for i in 1:k]

    for i in 1:length(clusters)
        cluster = ["" for i in 1:length(clusters[i])]
        animalcluster[i] = cluster
        for j in 1:length(clusters[i])
            animalcluster[i][j] = animals[clusters[i][j]][1]
        end
    end

    return animalcluster


end

k = 3
list = [("Spurv", "CCATTCGT"), ("Mus", "TAGGCATA"), ("Elg", "CCGGATTA"), ("Hjort", "CCGGAATA"), ("Ugle", "GGATTCGG"), ("Hamster", "TAGGCAGG"), ("Marsvin", "TAGGCATG"), ("Hauk", "GGATGCGG")]
@show findanimalgroups(list,k)
