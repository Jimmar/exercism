function raindrops(number)
    ans = ""

    ans *= number % 3 == 0 ? "Pling" : ""
    ans *= number % 5 == 0 ? "Plang" : ""
    ans *= number % 7 == 0 ? "Plong" : ""

    ans == "" ? string(number) : ans
end
