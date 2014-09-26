#=
These functions are taken from 
https://github.com/JuliaLang/julia/pull/8297
=#

function f(x)
  y = x+5
  z = y*y
  q = z/y
  m = q-3
end

@inline function f_inlined(x)
  y = x+5
  z = y*y
  q = z/y
  m = q-3
end

gc_disable()

g(x) = f(2x)
g_inlined(x) = f_inlined(2x)

x = 0

f(x)
f_inlined(x)
g(x)
g_inlined(x)

N = 1 << 20
@show N

println()

println("f(x) [no overhead]")
@time for i in 1:N
  x = f(x)
end

println()
x = 0
println("f_inlined(x) [there is an overhead to process :meta tag, I think.] ")
@time for i in 1:N
  x = f_inlined(x)
end

println()

println("g(x) = f(2x) [there is an overhead to call f(2x)]")
@time for i in 1:N
  x = g(x)
end

println()
x = 0
println("g_inlined(x) = f_inlined(2x) [no overhead]")
@time for i in 1:N
  x = g_inlined(x)
end

println()
x = 0
println("not function [these sentences won't be compiled]")
@time for i in 1:N
  y = x+5
  z = y*y
  q = z/y
  m = q-3
end
