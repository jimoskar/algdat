p = [4,5,12,15]

function bottom_up_cut_rod(p,n)
    r = zeros(n)
    for j in 1:n
        q  = -Base.Inf
        for i in 1:j
            q = max(q,p[i]+r[j-1])
        end
        r[j] = q
    end
    return r[n]
end

@show bottom_up_cut_rod(p,4)
