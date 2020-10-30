mutable struct Node
    children::Dict{Char,Node}
    count::Int
end

function searchtree(root, dna)
    num = 0
    currentnode = root
    for i in 1:length(dna)
        if(haskey(currentnode.children, dna[i]))
            currentnode = currentnode.children[dna[i]]
        else
            return 0
        end
    end

    return currentnode.count

end
