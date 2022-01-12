module SampleJuliaProj

# Write your package code here.

using Combinatorics
export find_subset 
greet() = "Hello World"
greet_random() = "Hello World Random"
# Write your package code here.
export func

"""
    func(x)

Returns double the number `x` plus `1`.
"""
func(x) = 2x + 1

"""
	find_subset(n::Int64,p,q,RV::AbstractString="X")
```@docs
Given `i` and `j` compute `Κ ⊆ \U1d4a9 \\{i,j}`; i.e., all non exclusive subsets. `i,j` can also be empty (i.e. []), in which case the non-empty superset gets listed. An optional prefix can be added (default is `X`).  
#### Examples
```

Given `i` and `j` compute `Κ ⊆ \U1d4a9 \\{i,j}`; i.e., all non exclusive subsets. `i,j` can also be empty (i.e. []), in which case the non-empty superset gets listed. An optional prefix can be added (default is `X`).  
#### Examples
```julia-repl
julia>find_subset(4,1,3,"X")
["" "X1" "X1,X2" "X1,X2,X5" "X1,X5" "X2" "X2,X5" "X5"]

julia>find_subset(4,1,3,"")
["" "1" "1,2" "1,2,5" "1,5" "2" "2,5" "5"]

julia> find_subset(5,4,3,"🍒")
["" "🍒3" "🍒3,🍒4" "🍒4"]

julia> find_subset(5,[],[],"🍓")
["🍓1" "🍓1,🍓2" "🍓1,🍓2,🍓3" "🍓1,🍓3" "🍓2" "🍓2,🍓3" "🍓3"]
```
"""
function find_subset(n::Int64,p,q,RV::AbstractString="X")
	s="$(RV)" .* string.(1:n)
	s1="$(RV)" .* string(p)
	s2="$(RV)" .* string(q)
	PowerSet = collect(powerset(s,1,n)) # Skip empty set
	setXk=[]
	for kk = 1:Int64(exp2(n)-1)
		subSet1 = vcat(PowerSet[kk,:][1])
		subSet2 = setdiff(subSet1,[s1,s2])
		setXk=[setXk; join(subSet2,",")]
	end
	
	return sort(unique(setXk))
end


end
