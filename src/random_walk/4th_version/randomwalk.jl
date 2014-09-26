using NumericExtensions, NumericFuns

type UpdateFunctor <: UnaryFunctor
  p :: Float64
  UpdateFunctor(p::Float64=0.5) = new(p)
end

NumericExtensions.evaluate(uf::UpdateFunctor, x::Int) = update(x, uf.p)
NumericExtensions.result_type(::UpdateFunctor, ::Type{Int64}) = Int64


update(x::Int, p::Float64=0.5) = rand()<p? x+1 : x-1

function randomwalk(p::Float64 = 0.5, N::Int = 1000, tmax::Int = 100)
  means = zeros(tmax+1)
  vars = zeros(tmax+1)
  xs = zeros(Int, N)

  for t in 1:tmax
    map1!(UpdateFunctor(p), xs)
    means[t+1] = mean(xs)
    vars[t+1] = var(xs)
  end
  return xs, means, vars
end
