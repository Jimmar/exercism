"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year)
    div_year(x) = year % x == 0
    div_year(4) && !div_year(100) || div_year(400)
end