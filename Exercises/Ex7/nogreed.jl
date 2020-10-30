

function mincoins(coins, value)

    array = zeros(Int128,length(coins),value+1)
    @show array
    rows, cols = size(array)


    coins = reverse!(coins)
    values = zeros(Int128,value+1)
    for i in 1:value
        values[i+1] = i
    end

    for j in 2:length(values)
        array[1,j] = j-1
    end

    for i in 2:rows
        for j in 2:cols
            value = values[j]
            counter = 0
            minima = [array[i-1,j]]
            while value-coins[i] >= 0
                counter += 1
                value -= coins[i]
                push!(minima,Base.min(counter + array[i,value+1],array[i-1,j]))
            end
            @show minima
            array[i,j] = minimum(minima)
        end
    end
    min = Base.Inf
    for i in 1:length(coins)
        @show array[i,length(values)]
        if array[i,length(values)] < min
            min = array[i,length(values)]
        end
    end
    @show array
    return min
end

coins= [1, 18, 60, 136, 209, 227, 307, 347, 361, 411, 457]
coins = reverse!(coins)
value = 725
@show mincoins(coins,value)
