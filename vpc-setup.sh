## Creando Flujo vpc

echo "Creando Vpc"

VPC_ID=$(aws ec2 create-vpc \
--cidr-block 10.0.0.0/16 \
--tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=Vpc-demo}]' \
--query 'Vpc.VpcId' \
--output text)

echo "Obteniendo ID $VPC_ID"

echo "creando subnet" 

SUBNET_ID=$(aws ec2 create-subnet \
    --vpc-id $VPC_ID \
    --cidr-block 10.0.1.0/24 \
    --availability-zone us-east-1a \
    --query 'Subnet.SubnetId' \
    --output text
)

echo "Subnet pública creeada $SUBNET_ID"

SUBNET_ID2=$(aws ec2 create-subnet \
    --vpc-id $VPC_ID \
    --cidr-block 10.0.2.0/24 \
    --availability-zone us-east-1a \
    --query 'Subnet.SubnetId' \
    --output text
)

echo "Subnet pública creeada $SUBNET_ID2"


IGW_ID=$(aws ec2 create-internet-gateway \
    --query 'InternetGateway.InternetGatewayId' \
    --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=internet-gateway}]' \
    --output text
)

echo "Obteniendo Id de IGW $IGW_ID"

##AQUI NO SE COMO ES EL QUERY PARA OBTENER ESO EXACTAMENTE PERO L ODEMAS ESTOY SEGURO QUE ES ASI AHORA ESO NO REQUIERE JUNTARLO RECIEN SE USA ATTACH


aws ec2 attach-internet-gateway \
    --vpc-id  $VPC_ID \
    --internet-gateway-id $IGW_ID

echo "Internet gateway"

MAIN_ROUTE_ID=$(aws ec2 create-route-table \
    --vpc-id $VPC_ID \
    --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=main-tabla-de-ruta}]' \
    --query 'RouteTable.RouteTableId'\
    --output text
)

echo "Tabla de ruta creada $MAIN_ROUTE_ID"

aws ec2 create-route \
    --route-table-id $MAIN_ROUTE_ID \
    --destination-cidr-block 0.0.0.0/0 \
    --gateway-id $IGW_ID

echo "Ruta hacia internet creada"

aws ec2 associate-route-table \
    --subnet-id $SUBNET_ID \
    --route-table-id $MAIN_ROUTE_ID

echo "Tabla de ruta asociada a la Subnet pública ✅"

aws ec2 modify-subnet-attribute \
  --subnet-id $SUBNET_ID \
  --map-public-ip-on-launch

