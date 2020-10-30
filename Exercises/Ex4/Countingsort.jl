






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
@show A
@show C
@show B
for i in length(A):-1:1
    @show i
    @show C[chartodigit(A[i][position])]
    B[C[chartodigit(A[i][position])]] = A[i]
    C[chartodigit(A[i][position])] -= 1
    @show B
end
return B

end



function chartodigit(character)
    return character -  '`'
end

@show chartodigit('a')

A = ["aaa","bb","cdh","aba"]

@show countingsortletters(A,2)
