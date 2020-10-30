



function lis(s, mls)
    ml = maximum(mls)
    lis = zeros(Int, ml)
    for i = length(mls):-1:1
        if(mls[i] == ml)
            lis[ml] = s[i]
            counter = 0
            for j in (i-1):-1:1
                if(s[j] < lis[ml-counter] && mls[j] == mls[i]-1-counter)
                    lis[ml-1-counter]  = s[j]
                    counter += 1
                end
                if counter == ml-1
                    break
                end
            end
            break
        end
    end
    return lis
end

s = [2,1,4,3,6,5]
mls = [1,1,2,2,3,3]

@show lis(s,mls)
