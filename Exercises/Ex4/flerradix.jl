function countingsortletters(A,position)

m = chartodigit('z')
B = [ "" for i in 1:length(A) ]
C = [0 for i in 1:m]


for i in 1:length(A)
    C[chartodigit(A[i][position])] += 1
end
for j in 2:m
    C[j] += C[j-1]
end

for i in length(A):-1:1

    B[C[chartodigit(A[i][position])]] = A[i]
    C[chartodigit(A[i][position])] -= 1

end
return B

end

function countingsortlength(A)
    maxlength = 1000
    B = fill(" ", length(A))
    C = fill(0,max_length)
    for i in 1:length(A)
        C[length(A[i])+1] += 1
    end
    for j in 2:max_length
        C[j] += C[j-1]
    end
    for i in length(B):-1:1
        B[C[length(A[i])+1]] = A[i]
        C[length(A[i])+1] -= 1
    end

    return B

end



function chartodigit(character)
    return character -  '`'
end



function flexradix(A, maxlength)
    lengths = [[] for i in 1:maxlength]

    emptycount = 0

    for j in 1:length(A)
        if (A[j] == "")
            emptycount += 1
        else
            push!(lengths[length(A[j])],A[j])
        end
    end

    sorted = []

    for position in maxlength:-1:1

        sorted = vcat(lengths[position],sorted)
        sorted = countingsortletters(sorted,position)
    end

    empty = ["" for i in 1:emptycount]

    return vcat(empty,sorted)

end

A = ["","baby","kobra", "aggie", "agg", "kort", "hyblen","","hei","ho","aaaaa"]

@show flexradix(A, 17)
