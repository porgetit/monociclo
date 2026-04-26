# Monociclo

Este repositorio contiene una implementación educativa de un procesador monociclo con arquitectura RISC-V de 32 bits en Verilog. El proyecto está orientado a demostrar los bloques de un procesador de un solo ciclo y la conexión básica entre el contador de programa, la memoria de instrucciones, la unidad de control y la ALU.

## Estructura del Proyecto

- `componentes/`: Módulos de mayor nivel para el procesador.
- `modulos/`: Bloques reutilizables y componentes de soporte como sumadores, flip-flops, multiplexores y ROM.
- `esquemas/`: Diagramas lógicos en formato Digital (`.dig`).

## Componentes Principales

- `componentes/pc.v`: Implementa el contador de programa (PC) de 32 bits con avance automático de 4 bytes.
- `componentes/instruction_memory.v`: Memoria de instrucciones que construye una palabra de 32 bits a partir de cuatro bloques `rom_24x8`.
- `componentes/control_unit.v`: Unidad de control RISC-V que decodifica opcodes y genera señales de control para la ALU, registros y memoria.
- `componentes/alu_32.v`: ALU de 32 bits con operaciones de suma, resta, multiplicación, división y lógicas básicas.

## Módulos Reutilizables

- `modulos/and_gate.v`: Puerta lógica AND.
- `modulos/dff_enable.v`: Flip-flop D con habilitación de 1 bit.
- `modulos/dff_enable_32.v`: Flip-flop D con habilitación de 32 bits.
- `modulos/full_adder.v`, `modulos/full_adder_24.v`, `modulos/full_adder_32.v`: Sumadores de 1, 24 y 32 bits.
- `modulos/full_subtractor.v`, `modulos/full_subtractor_32.v`: Restadores de 1 y 32 bits.
- `modulos/divider_32.v`: Divisor de 32 bits.
- `modulos/multiplier_32.v`: Multiplicador de 32 bits.
- `modulos/mux2to1.v`, `modulos/mux2to1_32.v`: Multiplexores 2 a 1 de 1 y 32 bits.
- `modulos/pc_adder.v`: Sumador específico para el PC.
- `modulos/pc_stage.v`: Etapa de registro del PC con reset y enable.
- `modulos/rom_24x8.v`: ROM de 24 bits de dirección por 8 bits de datos, cargada desde `rom_data.hex`.

## Diagramas

La carpeta `esquemas/` incluye los siguientes archivos `.dig`:
- `control_unit.dig`
- `instruction_memory.dig`
- `pc.dig`
- `pc_stage.dig`
- `splitter.dig`

## Estado del Proyecto

Actualmente el repositorio muestra un avance significativo en los componentes de Fetch y en bloques de soporte:

- Contador de programa (`pc.v` y `pc_stage.v`) implementado.
- Memoria de instrucciones (`instruction_memory.v`) conectada a ROM de 8 bits.
- Unidad de control (`control_unit.v`) capaz de decodificar varios formatos RISC-V.
- ALU de 32 bits (`alu_32.v`) con operaciones aritméticas y lógicas.

Faltan las etapas de integración completa del datapath y el banco de registros. No existe un módulo superior que conecte todos los bloques en una CPU monociclo lista para simulación completa.

## Uso

1. Abre tu simulador Verilog preferido (ModelSim, Vivado, Icarus Verilog, etc.).
2. Asegúrate de que el archivo `rom_data.hex` esté disponible en el directorio del proyecto para `modulos/rom_24x8.v`.
3. Compila los módulos en orden de dependencia:
   - `modulos/*`
   - `componentes/*`
4. Simula primero los bloques individuales (`pc_stage`, `rom_24x8`, `alu_32`, `control_unit`) y luego avanza hacia una integración superior.

## Notas

- El proyecto es educativo y aún está en desarrollo.
- Revisa la coherencia de nombres y la integración antes de usarlo en un flujo de diseño real.
