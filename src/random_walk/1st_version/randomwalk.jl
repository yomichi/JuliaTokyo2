update(x::Int, p::Float64=0.5) = rand()<p? x+1 : x-1

function randomwalk(p::Float64 = 0.5, N::Int = 1000, tmax::Int = 100)
  means = zeros(tmax+1)
  vars = zeros(tmax+1)
  xs = zeros(Int, N)

  for t in 1:tmax
    xs = map( x->update(x,p), xs)
    means[t+1] = mean(xs)
    vars[t+1] = var(xs)
  end
  return xs, means, vars
end
