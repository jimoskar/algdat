

s = [1,2,3,4,2,11,1]

function reverseandlimit(array, maxnumber)
    ret = []
    for i in (length(array)):-1:1
        push!(ret,array[i])
    end
    for i in 1:length(ret)
        if(ret[i]>maxnumber)
            ret[i] = maxnumber
        end
    end
    return ret
end


@show reverseandlimit(s,2)
