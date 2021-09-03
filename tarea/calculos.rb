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
            when @antiguedad > 15 then 0.1
            when @antiguedad > 11 then 0.07
            when @antiguedad > 7 then  0.05
            when @antiguedad > 4 then 0.04
            when @antiguedad <= 4 then 0.04
        end
    end
    def bono tardanza
        case
            when tardanza == 0 then 120
            when tardanza <= 5 then 80
            when tardanza <= 10 then 40
            when tardanza <= 15 then 0
            when tardanza > 15 then -40
        end
    end
    def sueldo (horas, tardanza)
        c = tarifa(@grado)*horas * ( 1 + aumento(@antiguedad)) + bono(tardanza)
        return c
    end        
end

juan = Calculos.new("0001-9","Juan","Perez","Bachiller",6)
puts juan.sueldo(50,5)