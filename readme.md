# Monociclo

Este repositorio contiene una implementación educativa de un procesador monociclo con arquitectura RISC-V de 32 bits en Verilog. El proyecto está enfocado en demostrar los componentes básicos de un procesador de un solo ciclo, incluyendo el contador de programa (PC) y la memoria de programa.

## Estructura del Proyecto

- `componentes/`: Contiene los módulos de alto nivel del procesador.
- `modulos/`: Incluye los bloques básicos reutilizables como sumadores, multiplexores y flip-flops.
- `Taller 6/`: Diagramas esquemáticos en formato Digital para visualizar los circuitos.

## Componentes

- `pc_stage.v`: Registro del contador de programa de 32 bits con habilitación de escritura.
- `pc_tb.v`: Contador de programa con autoincremento (+4 bytes por ciclo).
- `program_memory.v`: Memoria de programa que lee instrucciones de 32 bits desde ROM.

## Módulos

- `and_gate.v`: Puerta AND básica.
- `dff_enable.v` y `dff_enable_32.v`: Flip-flops D con habilitación.
- `full_adder.v`, `full_adder_24.v`, `full_adder_32.v`: Sumadores de 1, 24 y 32 bits.
- `mux2to1.v` y `mux2to1_32.v`: Multiplexores de 1 y 32 bits.
- `pc_adder.v`: Sumador específico para el PC.
- `rom_24x8.v`: ROM de 24 bits de dirección x 8 bits de datos.

## Diagramas

En la carpeta `Taller 6/` se encuentran los archivos `.dig` que representan los esquemas lógicos de los componentes principales:
- `PC.dig`: Diagrama del registro PC.
- `PC_tb.dig`: Diagrama del PC con sumador.
- `program-mem.dig`: Diagrama de la memoria de programa.

## Estado del Proyecto

El proyecto implementa únicamente la etapa de Fetch (obtención de instrucciones) del procesador monociclo RISC-V. Faltan las etapas de Decode, Execute, Memory y Write-back para completar el procesador.

## Uso

Para simular o sintetizar el diseño:
1. Utiliza herramientas de simulación como ModelSim o Vivado.
2. Asegúrate de proporcionar el archivo `rom_data.hex` requerido por la ROM en `rom_24x8.v`.
3. Compila los módulos en orden de dependencia y simula los componentes individuales o crea un módulo de nivel superior para integrar PC y memoria de programa.

Este proyecto es educativo y está en desarrollo, por lo que se recomienda revisar y corregir los errores antes de su uso en producción.
