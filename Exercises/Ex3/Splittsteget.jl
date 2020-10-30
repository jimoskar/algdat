



function splitintwo(x,y)
    l = length(x)
    xlength = cld(l,2)

    x_median = cld(xlength,2)
    if(xlength%2 == 0 )
        x_median = (x[fld(xlength,2),1]+x[fld(xlength,2)+1,1])/2
    end

    xl = zeros(cld(xlength,2),2)
    xr = zeros(fld(xlength,2),2)

    yl = zeros(cld(xlength,2),2)
    yr = zeros(fld(xlength,2),2)

    r_indexx = 1
    l_indexy = 1
    r_indexy = 1

    for i in 1:xlength
        if(i <= cld(xlength,2))
            xl[i,1] = x[i,1]
            xl[i,2] = x[i,2]

            if(y[i,1] <= x_median && l_indexy <=  cld(xlength,2))
                yl[l_indexy,1] = y[i,1]
                yl[l_indexy,2] = y[i,2]
                l_indexy += 1
            else
                yr[r_indexy,1] = y[i,1]
                yr[r_indexy,2] = y[i,2]
                r_indexy += 1
            end
        else
            xr[r_indexx,1] = x[i,1]
            xr[r_indexx,2] = x[i,2]
            r_indexx += 1

            if(y[i,1] <= x_median && l_indexy <=  cld(xlength,2)  )
                yl[l_indexy,1] = y[i,1]
                yl[l_indexy,2] = y[i,2]
                l_indexy += 1
            else
                yr[r_indexy,1] = y[i,1]
                yr[r_indexy,2] = y[i,2]
                r_indexy += 1
            end

        end


    end
    return xl, xr, yl, yr

end


x = [1.0 2.0; 2.0 3.0; 3.0 2.0; 4.0 5.0; 6.0 6.0; 7.0 1.0]

y = [7.0 1.0; 1.0 2.0; 3.0 2.0; 2.0 3.0; 4.0 5.0; 6.0 6.0]

@show splitintwo(x,y)
