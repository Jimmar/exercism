function transform(input::AbstractDict)
    Dict(lowercase(letter) => score
         for (score::Int32, list::Array) in input
         for letter::Char in list)
end

