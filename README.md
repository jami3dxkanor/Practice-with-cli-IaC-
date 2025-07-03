# AWS VPC - CLI Setup (Red Pública)

Este repositorio contiene un script que automatiza la creación de una red pública en AWS usando la CLI. Es parte de mis prácticas de infraestructura cloud desde la terminal.

## ¿Qué crea este script?

- ✅ Una VPC con bloque CIDR `10.0.0.0/16`
- ✅ Dos subnets públicas
- ✅ Un Internet Gateway (IGW)
- ✅ Una tabla de ruteo
- ✅ Ruta hacia internet (`0.0.0.0/0`)
- ✅ Asociación de la tabla con la subnet
- ✅ Configuración para asignar IP pública automáticamente

## Requisitos

- Tener configurada la CLI de AWS (`aws configure`)
- Permisos para crear recursos de red: VPC, Subnets, IGW, Tablas de ruteo

## Ejecución

```bash
chmod +x vpc-public-setup.sh
./vpc-public-setup.sh
