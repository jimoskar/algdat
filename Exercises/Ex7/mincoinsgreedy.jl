function mincoinsgreedy(coins, value)
    ret = 0
    dum = value
    for i in 1:length(coins)
        if dum > coins[i]
            while dum % coins[i] == 0
                ret += 1
                value -= coins[i]
            end
        end
    end
    return ret

end

@show mincoinsgreedy([1000,500,100,20,5,1],8)
