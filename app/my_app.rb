require 'sinatra'
require 'slim'

get '/' do 

  mes_x = []
  mes_y = []
  goal  = []
  
  y0 = rand(168..205)
  masse = rand(567..624)
  diametre = rand(238..248)/10.0
  dist = rand(423..470)
 
  #print "angle (en degré) = "
  #to = gets.chomp
  #Conversion en rad
  #to = to.to_f * Math::PI / 180

  to = 60 * Math::PI / 180
 
  #print "force (en m/s) = "
  #v = gets.chomp
  #v = v.to_f

  v = 55

  #hauteur (à une distance x)
  (0..(dist+30)).step(10) do |dot|
    mes_x << dot.to_s
    mes_y << (y0 + dot * Math.tan(to) - ((9.81*dot**2)/(2*v*Math.cos(to))**2)).abs
    if dot < (dist - 20) || dot > (dist + 20)  then
      goal << Float::NAN
    else
      goal << 305
    end  
  end

  slim :index, locals: { my_abs: mes_x, my_ord: mes_y, 
                         panier: goal, 
                         distance: dist, taille: y0 }

end

get "/*" do
  redirect "/"
end
