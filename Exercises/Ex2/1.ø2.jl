
if !isdefined(@__MODULE__, :__first__)
__first__ = true

mutable struct Node
    next::Union{Node, Nothing} # next kan peke på et Node-objekt eller ha verdien nothing.
    value::Int
end

function createlinkedlist(length)
    # Creates the list starting from the last element
    # This is done so the last element we generate is the head
    child = nothing
    node = nothing

    for i in 1:length
        node = Node(child, rand(1:800))
        child = node
    end
    return node
end


# Skriv koden din her!
function findindexinlist(linkedlist, index)
    curNode = linkedlist
    curIndex = 1
    while (curIndex != index && curNode.next != nothing)
        curNode = curNode.next
        curIndex+=1
    end

    if(curIndex != index)
        return -1
    end
    return curNode.value
end

list = createlinkedlist(8)

println(findindexinlist(list,7))
