#!/usr/bin/env bash
set -euo pipefail

# Script público de ejemplo.
# Ajustar dominio, hosts e IPs al entorno propio antes de utilizarlo.

LAB_DOMAIN="lab.internal"
HOSTS=(core-rt core-sw hv01 nodo01 nodo02 nodo03)

echo "== Resolucion DNS interna =="
for host in "${HOSTS[@]}"; do
    fqdn="${host}.${LAB_DOMAIN}"
    printf "%-28s " "$fqdn"
    if getent hosts "$fqdn" >/dev/null; then
        getent hosts "$fqdn" | awk 'NR==1 {print $1}'
    else
        echo "NO RESUELVE"
    fi
done

echo
echo "== Ruta a Internet y ruta al hypervisor =="
ip route get 1.1.1.1
ip route get 10.70.10.10

echo
echo "== Acceso SSH de ejemplo =="
for host in core-rt hv01 nodo01 nodo02 nodo03; do
    echo "-- $host --"
    ssh -o ConnectTimeout=5 "$host" 'echo "conexion SSH OK"' || echo "ERROR conectando a $host"
done
