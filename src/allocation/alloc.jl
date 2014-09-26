function alloc(N::Int)
  xs = ones(N,N,N)
  x = maximum(xs)
  ys = ones(N,N,N)
  y = maximum(ys)
end
@time alloc(200)
