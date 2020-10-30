


function binaryintervalsearch(x, delta, coordinate)

    l = fld(length(x),2)

    if(coordinate == 1)
        median = x[fld(l,2)+1,1]
        if(l%2 == 0)
            median = (x[fld(l,2),1] + x[cld(l,2)+1,1])/2
        end
        lower = median - delta
        upper = median + delta
        for i in 1:l
            if(x[i,1] <= upper)
                max = i
            end
        end
        for j in l:-1:1
            if(x[j,1]>= lower)
                min = j
            end
        end

        if min>max
            max = -1
            min = -1
        end


        return min, max
    elseif(coordinate == 2)

        median = x[fld(l,2)+1,2]
        if(l%2 == 0)
            median = (x[fld(l,2),2] + x[cld(l,2)+1,1])/2
        end
        lower = median - delta
        upper = median + delta
        for i in 1:l
            if(x[i,2] <= upper)
                max = i
            end
        end
        for j in l:-1:1
            if(x[j,2]>= lower)
                min = j
            end
        end

        if min>max
            max = -1
            min = -1
        end


        return min, max
    end


end

x = [1 2; 2 3; 3 0; 4 0; 5 1]
@show length(x)

@show binaryintervalsearch(x,1.5,1)

x = [1.0 -1.0; 2.0 2.0; 3.0 3.0; 4.0 5.0; 5.0 5.0]

@show binaryintervalsearch(x,1,2)
