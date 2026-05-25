# 03 - Acceso SSH y administración

## Objetivo

Administrar los hosts del laboratorio con una identidad clara y separada de otros usos personales, evitando reutilizar llaves asociadas a repositorios de desarrollo.

## Estrategia aplicada

- Crear una llave Ed25519 dedicada al laboratorio.
- Utilizar un usuario nominal de administración en los equipos.
- Instalar solamente la clave pública en cada host.
- Mantener accesos de recuperación mientras se valida la nueva vía.
- Configurar alias SSH legibles por FQDN.

## Ejemplo de llave dedicada

No se publica ninguna clave real. En un entorno reproducible, el procedimiento sería:

```bash
ssh-keygen -t ed25519 \
  -f ~/.ssh/lab_ed25519 \
  -C "admin@homelab"
```

Verificación de fingerprint:

```bash
ssh-keygen -lf ~/.ssh/lab_ed25519.pub -E sha256
```

## Ejemplo sanitizado de `~/.ssh/config`

Ver `../examples/ssh_config.example`.

Principios:

```text
Una llave específica para el lab
Usuarios nominales
FQDN claros
IdentitiesOnly yes
```

## Administración Linux

En los nodos Linux y en el hypervisor se validó:

```bash
id admin-lab
sudo -v
sudo id
```

La comprobación de `sudo` fue importante: tener acceso SSH no garantiza automáticamente que la cuenta pueda administrar el sistema.

## Administración de RouterOS

El router fue integrado mediante un usuario nominal y una clave pública Ed25519. Se conservó temporalmente la cuenta administrativa de recuperación hasta contar con backups y pruebas completas.

## Problema real encontrado: cliente SSH moderno vs. router

Un cliente OpenSSH reciente puede advertir que el servidor no negocia key exchange post-cuántico. La autenticación por llave puede estar correcta y, aun así, aparecer el aviso.

Aprendizaje:

- diferenciar **autenticación** de **negociación criptográfica de sesión**;
- no esconder warnings globalmente sin entenderlos;
- aplicar excepciones solamente al host que lo necesita, si corresponde.

## Buenas prácticas

| Práctica | Motivo |
|---|---|
| No subir llaves privadas a Git | Evitar comprometer acceso |
| No reutilizar llave de GitHub | Separar dominios de confianza |
| Mantener recovery mientras se migra | Evitar bloqueo administrativo |
| Probar comandos remotos no interactivos | Verificar automatización futura |
| Documentar aliases y roles, no secretos | Facilitar operación sin exponer credenciales |
