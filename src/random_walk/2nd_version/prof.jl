include("randomwalk.jl")

p = 0.5
N = 10000
tmax = 10000

## compile functions
randomwalk()

@profile randomwalk(p, N, tmax)
@time randomwalk(p, N, tmax)

open("tree.dat", "w") do io
  Profile.print(io)
end
open("flat.dat", "w") do io
  Profile.print(io, format = :flat)
end
