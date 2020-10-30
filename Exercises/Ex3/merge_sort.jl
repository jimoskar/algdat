
list = [1 2;1 2;3 2]

println(list[1,1])




# x og y er to sorterte tabeller, coordinate angir koordinat
function mergearrays(x,y,coordinate)

    if (coordinate == 1)
        xl = fld(length(x),2)
        yl = fld(length(y),2)
        A = zeros(xl+yl,2)


        x = vcat(x,[Base.Inf 1])
        y = vcat(y,[Base.Inf 1])

        p = 1
        k = 1
        for i in 1:(xl+yl)
            if(x[p,1] > y[k,1])
                A[i,1] = y[k,1]
                A[i,2] = y[k,2]
                k += 1
            else
                A[i,1] = x[p,1]
                A[i,2] = x[p,2]
                p += 1
            end
        end
        else
            xl = fld(length(x),2)
            yl = fld(length(y),2)
            A = zeros(xl+yl,2)


            x = vcat(x,[1 Base.Inf])
            y = vcat(y,[1 Base.Inf])
            
            p = 1
            k = 1
            for i in 1:(xl+yl)
                if(x[p,2] > y[k,2])
                    A[i,1] = y[k,1]
                    A[i,2] = y[k,2]
                    k += 1
                else
                    A[i,1] = x[p,1]
                    A[i,2] = x[p,2]
                    p += 1
                end
            end
    end

        return A
end




# x er en usortert tabell, coordinate angir koordinat vi skal sortere langs
function mergesort(x, coordinate)
    xlength = fld(length(x),2)
    @show x
    A = x
    if(xlength > 1)
        left = mergesort(x[1:cld(xlength,2),1:2],coordinate)
        right = mergesort(x[cld(xlength,2)+1:xlength,1:2],coordinate)
        A = mergearrays(left,right,coordinate)
    end

    return A

end

x = [3.0 1.0; 2.0 2.0; 3.0 3.0]
y = [3 4; 4 9; 7 10; 7 10]

@show mergearrays(x,y,2)

@show mergesort(x,1)
