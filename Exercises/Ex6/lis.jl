function lislength(s)
    mls = zeros(Int, size(s))
    mls[1] = 1
    for i = 2:length(s)

    end
    return maximum(mls) # Returnerer det største tallet i listen
end







function lislength(s)
    #mls = zeros(Int, size(s))
    mls = fill(1,size(s))
    @show mls
    mls[1] = 1
    for i = 2:length(s)
        for j in 1:i

            if(s[i] > s[j] && mls[j] >= mls[i])
                mls[i] = mls[j]+1
            end
        end
    end
    @show mls
    return maximum(mls) # Returnerer det største tallet i listen
end

s = [5,3,3,6,7]

@show lislength(s)
