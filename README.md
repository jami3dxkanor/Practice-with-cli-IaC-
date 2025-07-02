# AWS VPC - CLI Setup (Red Pública)

Este script crea una infraestructura básica de red pública en AWS utilizando la AWS CLI.

## Flujo del script:

1. Crear una VPC
2. Crear subnets públicas
3. Crear y asociar un Internet Gateway
4. Crear una tabla de ruteo
5. Crear una ruta hacia internet (0.0.0.0/0)
6. Asociar la tabla a la subnet
7. Activar asignación automática de IP pública

## Requisitos

- Tener configurada la AWS CLI (`aws configure`)
- Permisos para crear recursos de red
