require './docente'
class Calculos < Docente
    
    def tarifa grado
        @grado = grado
        case 
            when @grado == "Bachiller" then 40
            when @grado == "Titulado" then 80
            when @grado == "Maestria" then 100
            when @grado == "Doctorado" then 180
        end
        
    end
    def aumento antiguedad
        @antiguedad = antiguedad
        case
            when @antiguedad > 15 then 1.1
            when @antiguedad > 11 then 1.07
            when @antiguedad > 7 then  1.05
            when @antiguedad > 4 then 1.04
            when @antiguedad <= 4 then 1.03
        end
    end
    def bono tardanza
        @tardanza = tardanza
        case
            when tardanza == 0 then 120
            when tardanza <= 5 then 80
            when tardanza <= 10 then 40
            when tardanza <= 15 then 0
            when tardanza > 15 then -40
        end
    end
    def sueldo 
        c = tarifa(@grado)*@horas * aumento(@antiguedad) + bono(@tardanza)
        return c
    end
    def datos
    array = [@rut,@nombre,@apellido,@grado,@antiguedad]
    end 
    def datos_sueldo
        puts "El profesor #{@nombre} #{@apellido} Rut: #{@rut}, #{@grado} con una antiguedad de #{@antiguedad} años, tubo un sueldo de:"      
    end
    def imp_tarifas
        puts "El valor de la Hora por #{@grado}:"
        puts tarifa(@grado)
    end
end
=begin
juan = Calculos.new("0001-9","Juan","Perez","Bachiller",5,50,6)
pedro = Calculos.new("0002-5","Pedro","Muñoz","Titulado",4,70,16)
diego = Calculos.new("0003-7","Diego","Gonzalez","Maestria",8,80,8)
jose = Calculos.new("0004-3","Jose","Lopez","Doctorado",10,100,0)
"89075371", "Pedro", "Quispe", "Bachiller", 2, 100, 2)

("08127636", "Fernando", "Rordiguez", "Maestria", 5, 80, 18)
=end
pedro = Calculos.new("89075371", "Pedro", "Quispe", "Bachiller", 2, 100, 2)
fernando = Calculos.new("08127636", "Fernando", "Rordiguez", "Maestria", 5, 80, 18)


profesores = [pedro,fernando]
sum_bachiller = 0
sum_titulado = 0
sum_maestria = 0
sum_doctorado = 0
bachiller = []
titulado = []
maestria = []
doctorado = []
profesores.each do |i|
    if i.datos.include?("Bachiller")
        sum_bachiller = sum_bachiller + i.sueldo
        bachiller.push(i.datos) 
        i.imp_tarifas
    elsif i.datos.include?("Titulado")
        sum_titulado = sum_titulado + i.sueldo
        titulado.push(i.datos)
        i.imp_tarifas
    elsif i.datos.include?("Maestria")
        sum_maestria = sum_maestria + i.sueldo
        maestria.push(i.datos)
        i.imp_tarifas
    elsif i.datos.include?("Doctorado")
        sum_doctorado = sum_doctorado + i.sueldo
        doctorado.push(i.datos)
        i.imp_tarifas
    end
end

profesores.each do |i|
    puts "#{i.datos_sueldo} #{i.sueldo}"
end

puts "Los profesores bachiller son: #{bachiller}"
puts "Los profesores titulado son: #{titulado}"
puts "Los profesores maestria son: #{maestria}"
puts "Los profesores doctorado son: #{doctorado}"

=begin
puts "El monto pagado a Bachiller es: #{sum_bachiller}"
puts "El monto pagado a titulado es: #{sum_titulado}"
puts "El monto pagado a maestria es: #{sum_maestria}"
puts "El monto pagado a doctorado es: #{sum_doctorado}"
=end