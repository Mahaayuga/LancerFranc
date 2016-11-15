stop = "!"

y0 = rand(168..205)
masse = rand(567..624)
diametre = rand(238..248)/10.0
dist = rand(423..470)

printf "Vous mesurez %1.2fm et vous avez un ballon de basket standard\n", y0/100.00
printf "Masse : #{masse}g\n"
printf "Diametre : #{diametre}cm\n"
printf "L'anneau du panier, standard, est à 3,05m de hauteur. Il fait 0,45m de diamètre\n"
printf "Vous êtes positionné à %1.2fm du panier\n\n", dist/100.00

loop do 
  
  print "angle (en degré) = "
  to = gets.chomp
  #Conversion en rad
  to = to.to_f * Math::PI / 180
  
  print "force (en m/s) = "
  v = gets.chomp
  v = v.to_f

  #hauteur (à une distance x)
  x = dist
  y = y0 + x * Math.tan(to) - ((9.81*x**2)/(2*v*Math.cos(to))**2)
  printf "%.0f : ", x
  puts '%.1f' % y
  
  reponse = gets.chomp
  break if reponse == stop
end
