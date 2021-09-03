require 'docente'
class calculos{
    def initialize(Horas,Tardanza)
        attr_accessor :Grado,:Antiguedad,:Tardanza
        @Horas = Horas
        @Tardanza = Tardanza
    def tarifa
        case 
            when @Grado == "Bachiller" then 40
            when @Grado == "Titulado" then 80
            when @Grado == "Maestria" then 100
            when @Grado == "Doctorado" then 180
        end
    end
    def aumento
        case
            when @Antiguedad > 15 then 10%
            when @Antiguedad > 11 then 7%
            when @Antiguedad > 7 then 5%
            when @Antiguedad > 4 then 4%
            when @Antiguedad <= 4 then 3%
        end
    end
    def bono
        case
            when @Tardanza == 0 then 120
            when @Tardanza <= 5 then 80
            when @Tardanza <= 10 then 40
            when @Tardanza <= 15 then 0
            when @Tardanza > 15 then -40
        end
    def sueldo ()
        c = tarifa * Horas * ( 1 + aumento ) + bono
        return c
    end        
}