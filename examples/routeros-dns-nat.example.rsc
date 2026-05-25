# EJEMPLO SANITIZADO - NO IMPORTAR SIN ADAPTAR
# RouterOS: ejemplo conceptual de DHCP/DNS/NAT para una LAN de laboratorio.

# Interfaces esperadas del ejemplo:
# ether1       = uplink a router aguas arriba
# bridge-lab   = LAN interna 10.70.10.0/24

/ip address
add address=10.70.10.1/24 interface=bridge-lab comment="Gateway laboratorio"

/ip dns
set allow-remote-requests=yes servers=1.1.1.1,8.8.8.8

/ip dns static
add name=core-rt.lab.internal address=10.70.10.1 comment="Router lab"
add name=core-sw.lab.internal address=10.70.10.2 comment="Switch core"
add name=hv01.lab.internal address=10.70.10.10 comment="Hypervisor"
add name=nodo01.lab.internal address=10.70.10.20 comment="Linux node"
add name=nodo02.lab.internal address=10.70.10.21 comment="Linux node"
add name=nodo03.lab.internal address=10.70.10.22 comment="Linux node"

/ip firewall nat
add chain=srcnat action=masquerade out-interface=ether1 comment="NAT laboratorio hacia uplink"

# Pendiente en una implementación real:
# - DHCP server/pool específico
# - firewall input/forward
# - servicios de administración restringidos
# - export y backup seguro antes/después del cambio
