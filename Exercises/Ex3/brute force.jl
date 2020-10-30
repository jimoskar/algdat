function bruteforce(x)
    min = Base.Inf
    l = fld(length(x),2)
    for i in 1:(l-1)
        for j in (i+1):l
            dist = sqrt((x[i,1]-x[j,1])^2+(x[i,2]-x[j,2])^2)
            if(dist < min)
            min = dist
            end
        end
    end
    return min
end

x = [1 1; 10 0; 2 2; 5 5]

bruteforce(x)
