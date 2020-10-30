


function dnasimilarity(s1, s2)
    sim = 0
    for i in 1:length(s1)
        if(s1[i]==s2[i])
            sim += 1
        end
    end
        return sim
end
