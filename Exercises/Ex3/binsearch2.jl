
println("=====================")

function binsearch(x,p,r,lower,upper,coordinate)
    @show x[p,coordinate]
    @show x[r,coordinate]
    if (p>r)
        return -1, -1
    elseif(x[p,coordinate] < lower && x[r,coordinate] > upper)
        return binsearch(x,p+1,r-1,lower,upper,coordinate)
    elseif(x[p,coordinate] < lower)
        return binsearch(x,p+1,r,lower,upper,coordinate)
    elseif(x[r,coordinate] >upper)
        return binsearch(x,p,r-1,lower,upper,coordinate)
    end
    @show p
    @show r
    return p, r
end



function binaryintervalsearch(x, delta, coordinate)
    l = fld(length(x),2)
    @show length(x)
    @show l
    median = x[fld(l,2)+1,coordinate]
    if(l%2 == 0)
        median = (x[fld(l,2),coordinate] + x[fld(l,2)+1,coordinate])/2
    end
    @show median
    lower = median - delta
    upper = median + delta
    @show lower
    @show upper
    return binsearch(x,1,l,lower,upper,coordinate)
end

x = [1.0 0.0; 2.0 0.0; 3.0 0.0; 4.0 0.0]
binaryintervalsearch(x,0.1,1)
