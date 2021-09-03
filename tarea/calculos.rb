require './docente'
class Calculos < Docente
    def initialize (rut,nombre,apellido,grado,antiguedad,horas,tardanza)
        @rut = rut
        @nombre = nombre
        @apellido = apellido
        @grado = grado
        @antiguedad = antiguedad
        @horas = horas
        @tardanza = tardanza
    end
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
            when @antiguedad > 15 then 0.1
            when @antiguedad > 11 then 0.07
            when @antiguedad > 7 then  0.05
            when @antiguedad > 4 then 0.04
            when @antiguedad <= 4 then 0.04
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
        c = tarifa(@grado)*@horas * ( 1 + aumento(@antiguedad)) + bono(@tardanza)
        return c
    end
    def datos
    array = [@rut,@nombre,@apellido,@grado,@antiguedad]
    end 
    def datos_sueldo
        puts "El profesor #{@nombre} #{@apellido} Rut: #{@rut}, #{@grado} con una antiguedad de #{@antiguedad} tubo un sueldo de:"      
    end
end

juan = Calculos.new("0001-9","Juan","Perez","Bachiller",5,50,6)
pedro = Calculos.new("0002-5","Pedro","Muñoz","Titulado",4,70,16)
diego = Calculos.new("0003-7","Diego","Gonzalez","Maestria",8,80,8)
jose = Calculos.new("0004-3","Jose","Lopez","Doctorado",10,100,0)

profesores = [juan,pedro,diego,jose]
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
    elsif i.datos.include?("Titulado")
        sum_titulado = sum_titulado + i.sueldo
        titulado.push(i.datos)
    elsif i.datos.include?("Maestria")
        sum_maestria = sum_maestria + i.sueldo
        maestria.push(i.datos)
    elsif i.datos.include?("Doctorado")
        sum_doctorado = sum_doctorado + i.sueldo
        doctorado.push(i.datos)
    end
end

profesores.each do |i|
    puts i.datos_sueldo
    puts i.sueldo
end
puts "Los profesores bachiller son: #{bachiller}"
puts "Los profesores titulado son: #{titulado}"
puts "Los profesores maestria son: #{maestria}"
puts "Los profesores doctorado son: #{doctorado}"