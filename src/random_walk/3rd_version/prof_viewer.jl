include("prof.jl")

if !isinteractive()
  println("Press Ctrl-C to quit.")
  wait(Condition())
end
