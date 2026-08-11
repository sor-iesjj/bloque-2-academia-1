#!/bin/bash
# =============================================================================
# BOOCHAN ACADEMY - Verificacion del apartado Fase 1 (Las aulas y el servidor)
# =============================================================================
# Modulo: SOR - Sistemas Operativos en Red · 2.º SMR · IES Jorge Juan (Alicante)
# Proyecto Final del Bloque 2
#
# QUE HACE: comprueba que la maquina servidora de Boochan Academy tiene nombre,
#           direccion y acceso remoto, y que esa configuracion es PERSISTENTE.
#           No modifica NADA. Solo lee.
#
# USO:
#   chmod +x verificar_ac1_fase1.sh
#   sudo ./verificar_ac1_fase1.sh
#
# El informe se guarda en verificacion-academia-base.txt, en la carpeta actual.
# Escenario completo: ../00_El_Cliente_Boochan_Academy.md
#
# ---------------------------------------------------------------------------
# ESTE VERIFICADOR NO TE DA EL ARREGLO. A PROPOSITO.
# Los del bloque te decian el comando exacto para reparar cada fallo. Este te
# dice QUE esta mal y POR QUE importa. El COMO es tu trabajo: esto es un
# proyecto evaluable, no una practica guiada.
# ---------------------------------------------------------------------------
# =============================================================================

# Sin 'set -e' A PROPOSITO: si una comprobacion falla queremos seguir con el
# resto. Un verificador que aborta al primer fallo solo cuenta el primero.

INFORME="verificacion-academia-base.txt"
FALLOS=0
AVISOS=0

# --- Los datos de la academia. Si cambian, se cambian AQUI --------------------
NOMBRE_ESPERADO="srv-academia"
IP_ESPERADA="172.20.10.5"
RED_ESPERADA="172.20.10."
PREFIJO_ESPERADO="24"

V='\033[0;32m'; R='\033[0;31m'; A='\033[0;33m'; N='\033[0m'
ok()    { echo -e "${V}[OK]   ${N} $1"; echo "[OK]    $1" >> "$INFORME"; }
fallo() { echo -e "${R}[FALLO]${N} $1"; echo "[FALLO] $1" >> "$INFORME"; FALLOS=$((FALLOS+1)); }
aviso() { echo -e "${A}[AVISO]${N} $1"; echo "[AVISO] $1" >> "$INFORME"; AVISOS=$((AVISOS+1)); }
info()  { echo "        $1"; echo "        $1" >> "$INFORME"; }

if [ "$EUID" -ne 0 ]; then
    echo "ERROR: ejecutalo con sudo   ->   sudo ./verificar_ac1_fase1.sh"
    exit 1
fi

{
  echo "============================================================"
  echo " PROYECTO FINAL B2 - BOOCHAN ACADEMY"
  echo " Verificacion del apartado Fase 1: las aulas y el servidor"
  echo " Fecha:    $(date '+%Y-%m-%d %H:%M:%S')"
  echo " Maquina:  $(hostname)"
  echo "============================================================"
} > "$INFORME"
cat "$INFORME"

# =============================================================================
# BLOQUE A - IDENTIDAD DE LA MAQUINA
# =============================================================================
# El nombre de un servidor vive en mas de un sitio. Que uno diga una cosa y
# otro diga otra es una fuente de problemas que aparece semanas despues.
echo "" | tee -a "$INFORME"
echo "--- A. Identidad de la maquina ---" | tee -a "$INFORME"

HN=$(hostname)
if [ "$HN" = "$NOMBRE_ESPERADO" ]; then
    ok "A1. La maquina se llama '$NOMBRE_ESPERADO'"
else
    fallo "A1. La maquina se llama '$HN' y deberia llamarse '$NOMBRE_ESPERADO'"
    info "     El nombre acordado con el cliente esta en el punto 9 del escenario."
fi

if grep -qx "$NOMBRE_ESPERADO" /etc/hostname 2>/dev/null; then
    ok "A2. /etc/hostname coincide con el nombre actual"
else
    fallo "A2. /etc/hostname NO dice '$NOMBRE_ESPERADO'"
    info "     El nombre de ahora se pierde en el proximo arranque."
fi

if grep -qE "^[0-9].*[[:space:]]$NOMBRE_ESPERADO([[:space:]]|$)" /etc/hosts 2>/dev/null; then
    ok "A3. /etc/hosts tiene una entrada para '$NOMBRE_ESPERADO'"
else
    aviso "A3. /etc/hosts no resuelve '$NOMBRE_ESPERADO' localmente"
    info "     No es fatal hoy, pero varios servicios se resuelven a si mismos."
fi

# =============================================================================
# BLOQUE B - LA DIRECCION, Y QUE SEA PERSISTENTE
# =============================================================================
# "Lo he cambiado" no es lo mismo que "se quedara cambiado". Este bloque mira
# las dos cosas por separado: lo que hay ahora y lo que habra tras reiniciar.
echo "" | tee -a "$INFORME"
echo "--- B. Direccion de red ---" | tee -a "$INFORME"

if ip -4 addr show | grep -q "inet $IP_ESPERADA/$PREFIJO_ESPERADO"; then
    ok "B1. La maquina tiene AHORA la direccion $IP_ESPERADA/$PREFIJO_ESPERADO"
else
    ACTUALES=$(ip -4 -o addr show scope global | awk '{print $4}' | tr '\n' ' ')
    fallo "B1. No tiene $IP_ESPERADA/$PREFIJO_ESPERADO. Tiene:${ACTUALES:- ninguna}"
    info "     La direccion del servidor la fijo el cliente. No es negociable."
fi

IFAZ=$(ip -4 -o addr show | grep "$IP_ESPERADA" | awk '{print $2}' | head -1)
if [ -n "$IFAZ" ]; then
    info "     Esa direccion esta en la interfaz: $IFAZ"
fi

# Persistencia: la direccion tiene que estar ESCRITA en la configuracion,
# no solo puesta en memoria.
if grep -rqs "$IP_ESPERADA" /etc/netplan/ 2>/dev/null; then
    ok "B2. La direccion esta escrita en la configuracion de red (/etc/netplan)"
else
    fallo "B2. $IP_ESPERADA no aparece en /etc/netplan"
    info "     La direccion de hoy no sobrevivira al proximo arranque."
    info "     Una configuracion que no sobrevive a un reinicio NO esta hecha."
fi

# ¿Hay alguien mas repartiendo direcciones en esta interfaz?
if grep -rqs "dhcp4:[[:space:]]*true" /etc/netplan/ 2>/dev/null; then
    aviso "B3. Alguna interfaz sigue pidiendo direccion por DHCP"
    info "     Puede ser correcto (la salida a internet) o puede ser el fallo"
    info "     que el cliente te conto: 'cada vez que se iba la luz cambiaba'."
    info "     Mira CUAL de las dos interfaces lo tiene y justificalo en el video."
else
    ok "B3. Ninguna interfaz pide direccion por DHCP"
fi

# =============================================================================
# BLOQUE C - CONECTIVIDAD: SON DOS PRUEBAS, NO UNA
# =============================================================================
# Llegar a internet y llegar a la red de las aulas son cosas distintas y se
# comprueban por separado. Un servidor puede tener una y no la otra.
echo "" | tee -a "$INFORME"
echo "--- C. Conectividad ---" | tee -a "$INFORME"

if ip route | grep -q "^default"; then
    ok "C1. Hay ruta por defecto (salida hacia fuera de la red local)"
else
    fallo "C1. NO hay ruta por defecto - la maquina no puede salir a internet"
    info "     Sin salida no podras instalar ni actualizar nada."
fi

if ping -c 2 -W 2 8.8.8.8 >/dev/null 2>&1; then
    ok "C2. Hay conectividad hacia internet"
else
    aviso "C2. No responde 8.8.8.8 - puede ser la red del centro, o tu configuracion"
    info "     Compruebalo tu: sin internet no se instalan paquetes."
fi

if ip route | grep -q "$RED_ESPERADA"; then
    ok "C3. La maquina tiene ruta hacia la red del laboratorio ($RED_ESPERADA0/24)"
else
    fallo "C3. No hay ruta hacia $RED_ESPERADA0/24 - los equipos de aula no llegarian"
fi

if getent hosts archive.ubuntu.com >/dev/null 2>&1; then
    ok "C4. La resolucion de nombres de internet funciona"
else
    aviso "C4. No se resuelve archive.ubuntu.com"
    info "     Ojo: en la Fase 2 el servidor pasa a resolver por si mismo."
    info "     Si eso ya esta hecho, comprueba que su reenvio funciona."
fi

# =============================================================================
# BLOQUE D - ADMINISTRACION REMOTA
# =============================================================================
# El cliente no te ha pedido esto con estas palabras, pero lo pidio: "que no
# tengas que bajar al cuartito". Un servidor sin acceso remoto no se administra.
echo "" | tee -a "$INFORME"
echo "--- D. Administracion remota ---" | tee -a "$INFORME"

if systemctl is-active ssh >/dev/null 2>&1 || systemctl is-active sshd >/dev/null 2>&1; then
    ok "D1. El servicio de acceso remoto esta activo"
else
    fallo "D1. El servicio de acceso remoto NO esta activo"
    info "     Sin el, este servidor solo se administra con la ventana de la VM."
fi

if systemctl is-enabled ssh >/dev/null 2>&1 || systemctl is-enabled sshd >/dev/null 2>&1; then
    ok "D2. Y arrancara solo en el proximo inicio"
else
    fallo "D2. El acceso remoto NO esta habilitado para el arranque"
    info "     Hoy funciona. Manana, tras reiniciar, no. Y no eliges tu cuando"
    info "     se reinicia un servidor."
fi

if ss -tlnp 2>/dev/null | grep -q ":22 "; then
    ok "D3. Hay algo escuchando en el puerto 22"
else
    fallo "D3. Nadie escucha en el puerto 22"
fi

# =============================================================================
# BLOQUE E - ESTADO DEL SISTEMA
# =============================================================================
echo "" | tee -a "$INFORME"
echo "--- E. Estado del sistema ---" | tee -a "$INFORME"

LIBRE_MB=$(df -Pm / | awk 'NR==2 {print $4}')
if [ "${LIBRE_MB:-0}" -ge 12000 ]; then
    ok "E1. Espacio libre en /: ${LIBRE_MB} MB (suficiente para la Fase 4)"
elif [ "${LIBRE_MB:-0}" -ge 6000 ]; then
    aviso "E1. Espacio libre en /: ${LIBRE_MB} MB - justo para lo que viene"
    info "     En la Fase 4 tienes que crear los espacios de almacenamiento."
    info "     Calcula sus tamanos con este numero delante, no a ojo."
else
    fallo "E1. Solo quedan ${LIBRE_MB} MB libres en / - te vas a quedar sin sitio"
fi

RAM_MB=$(free -m | awk '/^Mem:/ {print $2}')
if [ "${RAM_MB:-0}" -ge 3500 ]; then
    ok "E2. Memoria: ${RAM_MB} MB"
else
    aviso "E2. Memoria: ${RAM_MB} MB - esta maquina va a ser controlador de dominio"
    info "     Justifica en el video por que crees que le basta."
fi

if [ -f /var/run/reboot-required ]; then
    aviso "E3. El sistema pide un reinicio pendiente de actualizaciones"
    info "     Mejor reiniciar AHORA que a mitad de la Fase 2."
else
    ok "E3. No hay reinicios pendientes"
fi

# =============================================================================
# VEREDICTO
# =============================================================================
echo "" | tee -a "$INFORME"
echo "============================================================" | tee -a "$INFORME"
if [ "$FALLOS" -eq 0 ] && [ "$AVISOS" -eq 0 ]; then
    echo " VEREDICTO: Fase 1 SUPERADO" | tee -a "$INFORME"
elif [ "$FALLOS" -eq 0 ]; then
    echo " VEREDICTO: Fase 1 SUPERADO CON $AVISOS AVISO(S)" | tee -a "$INFORME"
    echo " Un aviso no es un fallo: es algo que TU tienes que justificar." | tee -a "$INFORME"
else
    echo " VEREDICTO: Fase 1 NO SUPERADO - $FALLOS FALLO(S)" | tee -a "$INFORME"
    echo " El arreglo no viene aqui. Es un proyecto, no una practica guiada." | tee -a "$INFORME"
fi
echo "============================================================" | tee -a "$INFORME"

{
  echo ""
  echo "ESTE SCRIPT NO HA COMPROBADO:"
  echo "  - Que la direccion sobreviva DE VERDAD a un reinicio (reinicia y miralo)"
  echo "  - Que se pueda entrar por SSH DESDE OTRA maquina"
  echo "  - Que exista la instantanea 'AC1 · Fase 1 terminada' ni la copia .ova"
  echo ""
  echo "Las tres las tienes que demostrar tu, en el video de verificacion."
} | tee -a "$INFORME"

if [ -n "$SUDO_USER" ]; then
    chown "$SUDO_USER":"$SUDO_USER" "$INFORME" 2>/dev/null
fi

echo ""
echo "Informe guardado en: $(pwd)/$INFORME"

[ "$FALLOS" -eq 0 ] && exit 0 || exit 1
