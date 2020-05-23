include("PhasePortraitV2.jl")
#function for 5440 Final Q1
#x1:range of D1 values 
#x1:range of D2 values
#Use '@' to apply calculations across all rows
#Returns computed (dx1/dt, dx2/dt) over the range of (x1,x2)

function toggleMono(x1, x2)
  n=0.000000000000001

  u = @. ((1/(1+10*(x2^2/(0.1+x2^2))^2))-x1)*n
  v = @. ((1/(1+10*(x1^2/(0.1+x1^2))^2))-x2)*n

  return(u,v)
end

#Range of x1, x2 values
x1range = (0,1,15)  #Has the form (min, max, num points)
x2range = (0,1,15)  #Has the form (min, max, num points)


tspan=(0.0,30.0)    #time span

phaseplot(toggleMono, x1range, x2range, xinit=(), t=tspan, clines=true, norm=true, scale=0.5)
