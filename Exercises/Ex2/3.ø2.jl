

if !isdefined(@__MODULE__, :__first__)
__first__ = true


mutable struct NodeDoublyLinked
    prev::Union{NodeDoublyLinked, Nothing} # Er enten forrige node eller nothing
    next::Union{NodeDoublyLinked, Nothing} # Er enten neste node eller nothing
    value::Int # Verdien til noden
end




list = NodeDoublyLinked(nothing,nothing,10)


function maxofdoublelinkedlist(linkedlist)
    max = -1
    if linkedlist.value > max
        max = linkedlist.value
    end
    curNode = linkedlist.next
    while curNode != nothing
        if(curNode.value > max)
            max = curNode.value
        end
        curNode = curNode.next
    end
    curNode = linkedlist.prev
    while curNode != nothing
        if(curNode.value>max)
            max = curNode.value
        end
        curNode = curNode.prev
    end
    return max
end


@show maxofdoublelinkedlist(list)

end
