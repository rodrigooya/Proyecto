class Docente
    def initialize (rut,nombre,apellido,grado,antiguedad)
        @rut = rut
        @nombre = nombre
        @apellido = apellido
        @grado = grado
        @antiguedad = antiguedad
    end
    def datos
        puts "el docente de nombre #{@nombre} #{@apellido} rut #{@rut} es de grado #{@grado} tiene una antiguedad de #{@antiguedad}" 
    end
end

juan = Docente.new("0001-9","Juan","Perez","Bachiller",6)
juan.datos

