require 'sinatra'
require 'slim'

before do
  @y0 = rand(168..205) if @y0 == nil
  masse = rand(567..624)
  diametre = rand(238..248)/10.0
  @dist = rand(423..470) if @dist == nil
end

get '/' do 

  mes_x = []
  mes_y = []
  goal  = []
  
  #print "angle (en degré) = "
  #to = gets.chomp
  to = 63 * Math::PI / 180
 
  #print "force (en m/s) = "
  #v = gets.chomp
  #v = v.to_f
  v = 57

  #hauteur (à une distance x)
  (0..(@dist+30)).step(10) do |dot|
    mes_x << dot.to_s
    mes_y << (@y0 + dot * Math.tan(to) - ((9.81*dot**2)/(2*v*Math.cos(to))**2)).abs
    
    if dot < (@dist - 20) || dot > (@dist + 20)  then
      goal << Float::NAN
    else
      goal << 305
    end  
  end

  slim :index, locals: { my_abs: mes_x, my_ord: mes_y, 
                         panier: goal }

end

get "/*" do
  redirect "/"
end
