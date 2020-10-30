

function mincoinsgreedy(coins, value)
    ret = 0
    dum = value
    for i in 1:length(coins)

        if dum >= coins[i]
            while dum - coins[i] >= 0
                ret += 1
                dum -= coins[i]
            end
            @show dum
        end
    end
    return ret

end



function mincoins(coins, value)
    dum = value
    mod = typemax(Int)
    nonmod = typemax(Int)
    for c in coins
        if value%c == 0
            mod = 0
            while  dum > 0
                mod += 1
                dum -= c
            end
            break
        end
    end

    nonmod = mincoinsgreedy(coins,value)
    @show mod, nonmod
    return min(mod,nonmod)
    #inf = typemax(Int)
    # Din kode her
end

coins=[1000, 500, 200, 100, 50, 20, 10, 5, 4, 3, 1]

@show mincoins(coins,1027)
