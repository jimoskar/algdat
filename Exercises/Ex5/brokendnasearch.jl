
mutable struct Node
    children::Dict{Char,Node}
    count::Int
end


function brokendnasearch(root, dna, i=1)
    if i > length(dna)
        return root.count
    end

    num = 0
    if(dna[i] == '?')
        for value in values(root.children)
            num += brokendnasearch(value,dna,i+1)
        end
    elseif haskey(root.children,dna[i])
        num += brokendnasearch(root.children[dna[i]],dna,i+1)
    end

    return num
end
