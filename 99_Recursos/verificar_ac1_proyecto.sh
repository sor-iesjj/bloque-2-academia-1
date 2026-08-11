#!/bin/bash
# =============================================================================
# BOOCHAN ACADEMY - Verificacion del proyecto (apartados Fase 2 a Fase 7)
# =============================================================================
# Modulo: SOR - Sistemas Operativos en Red · 2.º SMR · IES Jorge Juan (Alicante)
# Proyecto Final del Bloque 2
#
# QUE HACE: comprueba el dominio, las personas, el almacenamiento y LA MATRIZ
#           DE PERMISOS de Boochan Academy. No modifica NADA. Solo lee.
#
# USO:
#   chmod +x verificar_ac1_proyecto.sh
#   sudo ./verificar_ac1_proyecto.sh
#
# El informe se guarda en verificacion-academia.txt, en la carpeta actual.
# Escenario y matriz completa: ../00_El_Cliente_Boochan_Academy.md
#
# ---------------------------------------------------------------------------
# POR QUE UN SOLO SCRIPT PARA SEIS APARTADOS:
# Porque el 80 % de las comprobaciones se repetirian en seis ficheros casi
# iguales, y porque asi cada vez que lo pasas ves TODO el proyecto, no solo lo
# de hoy. Si la Fase 5 rompe algo de la Fase 3, te enteras el mismo dia.
# Es normal (y correcto) que en la Fase 2 te marque como pendientes cosas que
# todavia no existen: mira solo los bloques que te tocan.
#
#   Fase 2 -> bloque A          Fase 5 -> bloques A-F
#   Fase 3 -> bloques A-B       Fase 6 -> bloques A-G
#   Fase 4 -> bloques A-C       Fase 7 -> bloques A-G
#
# ESTE VERIFICADOR NO TE DA EL ARREGLO. A PROPOSITO.
# Te dice QUE esta mal y POR QUE importa. El COMO es tu trabajo.
# ---------------------------------------------------------------------------
# =============================================================================

# Sin 'set -e' A PROPOSITO: si una comprobacion falla queremos seguir con el
# resto. Un verificador que aborta al primer fallo solo cuenta el primero.

INFORME="verificacion-academia.txt"
FALLOS=0
AVISOS=0

# --- Los datos de la academia. Si cambian, se cambian AQUI --------------------
REALM="ACADEMIA.LOCAL"
REALM_MIN="academia.local"
SERVIDOR="srv-academia"
IP_SERVIDOR="172.20.10.5"
BASE="/srv/academia"
ALUMNOS_DIR="$BASE/alumnos"

GRUPOS="profesores:4001 alumnos:4002 secretaria:4003"

USUARIOS="laura.gimenez:20001:profesores
sergio.beltran:20002:profesores
nuria.pastor:20003:profesores
hugo.marti:20101:alumnos
carla.ortiz:20102:alumnos
iker.romero:20103:alumnos
noa.vidal:20104:alumnos
dani.serra:20105:alumnos
lucia.penalva:20106:alumnos
pilar.quiles:20201:secretaria
raul.esteve:20202:secretaria"

ALUMNADO="hugo.marti carla.ortiz iker.romero noa.vidal dani.serra lucia.penalva"

# --- Las carpetas de la academia: nombre:grupo_dueño:permisos_octales --------
CARPETAS="material:profesores:2770
examenes:profesores:2770
secretaria:secretaria:2770
entregas:alumnos:3730"

# --- LA MATRIZ, en dos listas -----------------------------------------------
# Lo que DEBE existir: carpeta:grupo:permiso_esperado
# (el acceso de cada colectivo a SU carpeta viene de los permisos clasicos,
#  no de una ACL: aqui solo van los CRUCES)
CRUCES="material:alumnos:r-x
entregas:profesores:r-x"

# Y lo que NO debe existir. examenes y secretaria son ISLAS.
PROHIBIDOS="examenes:alumnos
examenes:secretaria
secretaria:profesores
secretaria:alumnos
material:secretaria
entregas:secretaria"

# --- Recursos que Samba tiene que publicar ----------------------------------
RECURSOS="material entregas examenes secretaria"
# Y estos dos, ademas, no pueden aparecer a quien no tiene acceso:
OCULTOS="examenes secretaria"

V='\033[0;32m'; R='\033[0;31m'; A='\033[0;33m'; N='\033[0m'
ok()    { echo -e "${V}[OK]   ${N} $1"; echo "[OK]    $1" >> "$INFORME"; }
fallo() { echo -e "${R}[FALLO]${N} $1"; echo "[FALLO] $1" >> "$INFORME"; FALLOS=$((FALLOS+1)); }
aviso() { echo -e "${A}[AVISO]${N} $1"; echo "[AVISO] $1" >> "$INFORME"; AVISOS=$((AVISOS+1)); }
info()  { echo "        $1"; echo "        $1" >> "$INFORME"; }

# El nombre de un grupo puede venir con el dominio delante (ACADEMIA\alumnos).
# Esta funcion se queda con la parte de la derecha.
sin_dominio() { echo "${1##*\\}"; }

if [ "$EUID" -ne 0 ]; then
    echo "ERROR: ejecutalo con sudo   ->   sudo ./verificar_ac1_proyecto.sh"
    exit 1
fi

{
  echo "============================================================"
  echo " PROYECTO FINAL B2 - BOOCHAN ACADEMY"
  echo " Verificacion del proyecto (Fase 2 a Fase 7)"
  echo " Fecha:    $(date '+%Y-%m-%d %H:%M:%S')"
  echo " Maquina:  $(hostname)"
  echo "============================================================"
} > "$INFORME"
cat "$INFORME"

# =============================================================================
# BLOQUE A - EL DOMINIO  (Fase 2)
# =============================================================================
echo "" | tee -a "$INFORME"
echo "--- A. El dominio ($REALM) ---" | tee -a "$INFORME"

if systemctl is-active samba-ad-dc >/dev/null 2>&1; then
    ok "A1. El controlador de dominio esta activo"
else
    fallo "A1. El controlador de dominio NO esta activo"
    info "     Sin el no hay directorio, ni autenticacion, ni nombres."
    info "     Mira que dice: sudo journalctl -u samba-ad-dc -n 30 --no-pager"
fi

# 'active' dice que funciona HOY. 'enabled' dice que volvera manana.
# Son dos propiedades distintas y la segunda es la que te llama un domingo.
if systemctl is-enabled samba-ad-dc >/dev/null 2>&1; then
    ok "A2. Y volvera a levantarse solo en el proximo arranque"
else
    fallo "A2. El dominio NO esta habilitado para el arranque"
    info "     Hoy funciona. El lunes que viene, no. Y nada te avisara."
fi

if command -v samba-tool >/dev/null 2>&1; then
    REALM_REAL=$(samba-tool domain info 127.0.0.1 2>/dev/null | awk -F': *' '/Realm/ {print $2}')
    if [ -z "$REALM_REAL" ]; then
        REALM_REAL=$(grep -i "^[[:space:]]*realm" /etc/samba/smb.conf 2>/dev/null | head -1 | awk -F'=' '{gsub(/ /,"",$2); print $2}')
    fi
    if [ "${REALM_REAL^^}" = "$REALM" ]; then
        ok "A3. El dominio se llama '$REALM'"
    else
        fallo "A3. El dominio dice llamarse '${REALM_REAL:-desconocido}' y deberia ser '$REALM'"
        info "     Renombrar un dominio con equipos unidos es de lo peor que hay."
    fi
else
    fallo "A3. No esta samba-tool: aqui no hay controlador de dominio montado"
fi

# El servicio de nombres es lo que mas problemas da en todo el proyecto.
DNS_RESP=$(host -t A "$SERVIDOR.$REALM_MIN" 127.0.0.1 2>/dev/null | awk '/has address/ {print $NF}' | head -1)
if [ "$DNS_RESP" = "$IP_SERVIDOR" ]; then
    ok "A4. El dominio resuelve '$SERVIDOR.$REALM_MIN' a $IP_SERVIDOR"
elif [ -n "$DNS_RESP" ]; then
    fallo "A4. '$SERVIDOR.$REALM_MIN' resuelve a $DNS_RESP y deberia ser $IP_SERVIDOR"
    info "     ESTE ES EL FALLO QUE REVIENTA EL Fase 6. El dominio se ha anunciado"
    info "     por la tarjeta equivocada. Desde el servidor todo parece correcto;"
    info "     desde un Windows, 'no se encuentra el dominio'."
else
    fallo "A4. El servicio de nombres del dominio no resuelve su propio servidor"
fi

if grep -q "nameserver 127.0.0.1" /etc/resolv.conf 2>/dev/null; then
    ok "A5. El servidor se pregunta a si mismo los nombres"
else
    fallo "A5. El servidor NO usa su propio servicio de nombres"
    info "     Resolvera los nombres de internet y no los del dominio."
fi

if lsattr /etc/resolv.conf 2>/dev/null | awk '{print $1}' | grep -q "i"; then
    ok "A6. Y esa configuracion esta fijada: sobrevivira al reinicio"
else
    fallo "A6. /etc/resolv.conf no esta protegido contra reescritura"
    info "     Hoy apunta bien. En el proximo arranque, el sistema lo reescribe."
    info "     'Lo he cambiado' no es lo mismo que 'se quedara cambiado'."
fi

# Restos de la etapa anterior peleandose por los mismos puertos.
for s in smbd nmbd; do
    if systemctl is-active "$s" >/dev/null 2>&1; then
        fallo "A7. El servicio '$s' esta corriendo a la vez que el controlador"
        info "     Dos programas compitiendo por los mismos puertos: gana uno"
        info "     y no lo eliges tu."
    fi
done
systemctl is-active smbd >/dev/null 2>&1 || systemctl is-active nmbd >/dev/null 2>&1 || \
    ok "A7. No hay servicios antiguos estorbando"

# =============================================================================
# BLOQUE B - LAS PERSONAS  (Fase 3)
# =============================================================================
echo "" | tee -a "$INFORME"
echo "--- B. Las personas ---" | tee -a "$INFORME"

# El sistema operativo y el dominio son dos censos distintos. Si el sistema no
# pregunta al dominio, las personas existen y el servidor no las conoce.
if grep -qE "^passwd:.*winbind" /etc/nsswitch.conf 2>/dev/null && \
   grep -qE "^group:.*winbind" /etc/nsswitch.conf 2>/dev/null; then
    ok "B1. El sistema pregunta al dominio por usuarios y por grupos"
else
    fallo "B1. El sistema NO pregunta al dominio (falta en /etc/nsswitch.conf)"
    info "     Las personas existiran en el directorio y el sistema de ficheros"
    info "     no sabra quienes son. Y los permisos se dan en el sistema."
fi

for g in $GRUPOS; do
    NOM="${g%:*}"; GID_ESP="${g#*:}"
    GID_REAL=$(getent group "$NOM" 2>/dev/null | cut -d: -f3)
    if [ -z "$GID_REAL" ]; then
        fallo "B2. El grupo '$NOM' no existe o no se ve desde el sistema"
    elif [ "$GID_REAL" = "$GID_ESP" ]; then
        ok "B2. Grupo '$NOM' con GID $GID_ESP (correcto)"
    else
        fallo "B2. El grupo '$NOM' tiene GID $GID_REAL y deberia ser $GID_ESP"
        info "     Los permisos que des a $GID_ESP no alcanzaran a nadie."
    fi
done

FALTAN=""; MAL_UID=""; MAL_GRUPO=""
while IFS= read -r LINEA; do
    [ -z "$LINEA" ] && continue
    U=$(echo "$LINEA" | cut -d: -f1)
    UID_ESP=$(echo "$LINEA" | cut -d: -f2)
    GRP_ESP=$(echo "$LINEA" | cut -d: -f3)

    UID_REAL=$(id -u "$U" 2>/dev/null)
    if [ -z "$UID_REAL" ]; then
        FALTAN="$FALTAN $U"
        continue
    fi
    [ "$UID_REAL" = "$UID_ESP" ] || MAL_UID="$MAL_UID $U($UID_REAL!=$UID_ESP)"

    PERTENECE=0
    for g in $(id -nG "$U" 2>/dev/null); do
        [ "$(sin_dominio "$g")" = "$GRP_ESP" ] && PERTENECE=1
    done
    [ "$PERTENECE" = "1" ] || MAL_GRUPO="$MAL_GRUPO $U"
done <<< "$USUARIOS"

[ -z "$FALTAN" ]    && ok "B3. Las 11 personas de la academia existen" \
                    || fallo "B3. No existen o no se ven:$FALTAN"
[ -z "$MAL_UID" ]   && ok "B4. Todas llevan el numero (UID) que les toca" \
                    || { fallo "B4. Numeros que no son los del escenario:$MAL_UID"; \
                         info "     En Unix una persona no es su nombre: es su numero."; }
[ -z "$MAL_GRUPO" ] && ok "B5. Todas estan en su colectivo" \
                    || { fallo "B5. No pertenecen a su colectivo:$MAL_GRUPO"; \
                         info "     El permiso se le da al grupo. Fuera del grupo, no llega."; }

# Dos personas con el mismo numero son la MISMA persona para el sistema de
# ficheros, y eso no da ningun error.
DUPES=$(while IFS= read -r L; do [ -n "$L" ] && id -u "$(echo "$L" | cut -d: -f1)" 2>/dev/null; done <<< "$USUARIOS" | sort | uniq -d)
if [ -z "$DUPES" ]; then
    ok "B6. No hay dos personas con el mismo numero"
else
    fallo "B6. Numeros repetidos entre las personas de la academia: $DUPES"
    info "     Para el sistema de ficheros son la misma persona."
fi

# Cuentas de mas: lo que sobra tambien es un fallo.
EXTRA=$(getent passwd 2>/dev/null | awk -F: '$3>=20000 && $3<21000 {print $1}' | sed 's/^.*\\//' | sort -u)
N_EXTRA=0
for u in $EXTRA; do
    echo "$USUARIOS" | cut -d: -f1 | grep -qx "$u" || { N_EXTRA=$((N_EXTRA+1)); \
        fallo "B7. Hay una cuenta que no es de la academia: '$u'"; }
done
[ "$N_EXTRA" -eq 0 ] && ok "B7. No hay cuentas de mas en el rango de la academia"

# =============================================================================
# BLOQUE C - EL ALMACENAMIENTO  (Fase 4)
# =============================================================================
echo "" | tee -a "$INFORME"
echo "--- C. El almacenamiento ---" | tee -a "$INFORME"

if mountpoint -q "$BASE"; then
    ok "C1. $BASE es un punto de montaje (tiene su propio espacio)"
else
    fallo "C1. $BASE NO es un punto de montaje"
    info "     Si no hay un espacio propio detras, todo comparte disco con el sistema."
fi

if mountpoint -q "$ALUMNOS_DIR"; then
    ok "C2. $ALUMNOS_DIR tiene su propio espacio, separado del anterior"
else
    fallo "C2. $ALUMNOS_DIR NO esta montado aparte"
    info "     El cliente lo dijo claro: que los videos de los alumnos no dejen"
    info "     sin sitio a los recibos de secretaria. Eso se resuelve AISLANDO."
fi

if grep -q "$BASE" /etc/fstab 2>/dev/null && grep -q "$ALUMNOS_DIR" /etc/fstab 2>/dev/null; then
    ok "C3. Los dos espacios estan declarados para montarse al arrancar"
else
    fallo "C3. Falta alguno de los dos en /etc/fstab"
    info "     Montado a mano hoy, desaparecido manana."
fi

while IFS= read -r LINEA; do
    [ -z "$LINEA" ] && continue
    C=$(echo "$LINEA" | cut -d: -f1)
    G_ESP=$(echo "$LINEA" | cut -d: -f2)
    P_ESP=$(echo "$LINEA" | cut -d: -f3)
    RUTA="$BASE/$C"

    if [ ! -d "$RUTA" ]; then
        fallo "C4. No existe la carpeta '$C'"
        continue
    fi
    G_REAL=$(sin_dominio "$(stat -c %G "$RUTA" 2>/dev/null)")
    P_REAL=$(stat -c %a "$RUTA" 2>/dev/null)

    if [ "$G_REAL" = "$G_ESP" ]; then
        ok "C4. '$C' pertenece al colectivo '$G_ESP'"
    else
        fallo "C4. '$C' pertenece a '$G_REAL' y deberia ser de '$G_ESP'"
        info "     Ojo: si el dominio no estaba en pie al asignarlo, se queda"
        info "     a nombre de root SIN dar ningun error."
    fi

    if [ "$P_REAL" = "$P_ESP" ]; then
        ok "C5. '$C' con permisos $P_ESP (correcto)"
    else
        fallo "C5. '$C' tiene permisos $P_REAL y deberian ser $P_ESP"
        case "$C" in
          entregas) info "     'entregas' es un BUZON: se deposita, no se lista, no se borra lo ajeno." ;;
          *)        info "     Repasa que el cuarto digito este puesto: la herencia de colectivo." ;;
        esac
    fi
done <<< "$CARPETAS"

# Las carpetas personales: una por alumno, y de su dueño.
SIN_CARPETA=""; MAL_DUENO=""
for u in $ALUMNADO; do
    if [ ! -d "$ALUMNOS_DIR/$u" ]; then
        SIN_CARPETA="$SIN_CARPETA $u"
        continue
    fi
    D=$(sin_dominio "$(stat -c %U "$ALUMNOS_DIR/$u" 2>/dev/null)")
    [ "$D" = "$u" ] || MAL_DUENO="$MAL_DUENO $u(es de $D)"
done
[ -z "$SIN_CARPETA" ] && ok "C6. Cada alumno tiene su carpeta personal" \
                      || fallo "C6. No tienen carpeta personal:$SIN_CARPETA"
[ -z "$MAL_DUENO" ]   && ok "C7. Y cada carpeta personal es de su dueño" \
                      || { fallo "C7. Carpetas personales con dueño equivocado:$MAL_DUENO"; \
                           info "     Si son de root, ningun alumno podra trabajar en la suya."; }

if ! command -v getfacl >/dev/null 2>&1; then
    fallo "C8. No esta instalado 'acl': no se pueden leer ni poner las listas de acceso"
    echo "" | tee -a "$INFORME"
    echo " VEREDICTO: NO SUPERADO - sin 'acl' no se puede comprobar la matriz" | tee -a "$INFORME"
    exit 1
fi

# =============================================================================
# BLOQUE D - LA MATRIZ: LO QUE DEBE EXISTIR  (Fase 5)
# =============================================================================
echo "" | tee -a "$INFORME"
echo "--- D. La matriz de permisos: los cruces ---" | tee -a "$INFORME"

D=0
while IFS= read -r LINEA; do
    [ -z "$LINEA" ] && continue
    D=$((D+1))
    CARPETA=$(echo "$LINEA" | cut -d: -f1)
    GRUPO=$(echo "$LINEA"   | cut -d: -f2)
    PERM=$(echo "$LINEA"    | cut -d: -f3)
    RUTA="$BASE/$CARPETA"

    ACL=$(getfacl -p "$RUTA" 2>/dev/null)
    LINEA_ACL=$(echo "$ACL" | grep -E "^group:[^:]*${GRUPO}:")

    if [ -z "$LINEA_ACL" ]; then
        fallo "D$D. '$GRUPO' no tiene acceso a '$CARPETA' (la matriz dice $PERM)"
        continue
    fi

    # LA MASCARA puede recortar un permiso sin borrarlo. getfacl lo marca con
    # #effective, y es la trampa mas fina de todo el proyecto.
    if echo "$LINEA_ACL" | grep -q "#effective:"; then
        EFECTIVO=$(echo "$LINEA_ACL" | sed 's/.*#effective://' | tr -d ' \t')
        fallo "D$D. '$GRUPO' sobre '$CARPETA': pone algo y se aplica '$EFECTIVO'"
        info "     LA MASCARA lo esta recortando. El permiso figura y NO funciona."
        info "     Lo escrito y lo aplicado pueden ser cosas distintas."
    else
        PERM_REAL=$(echo "$LINEA_ACL" | cut -d: -f3 | awk '{print $1}')
        if [ "$PERM_REAL" = "$PERM" ]; then
            ok "D$D. '$GRUPO' sobre '$CARPETA': $PERM (correcto)"
        else
            fallo "D$D. '$GRUPO' sobre '$CARPETA': tiene $PERM_REAL y la matriz dice $PERM"
            if [ "$PERM" = "r-x" ] && [ "$PERM_REAL" = "rwx" ]; then
                info "     TIENE ESCRITURA Y NO DEBERIA. Vuelve a leer el punto 7 del escenario."
            fi
        fi
    fi

    # Sin la ACL por defecto, funciona con lo de hoy y falla con lo de manana.
    if echo "$ACL" | grep -qE "^default:group:[^:]*${GRUPO}:"; then
        ok "D$D-bis. '$GRUPO' sobre '$CARPETA': la herencia esta puesta"
    else
        fallo "D$D-bis. '$GRUPO' sobre '$CARPETA': FALTA la herencia"
        info "     Los ficheros que se creen a partir de manana no lo llevaran."
        info "     Es un fallo que crece con el tiempo en vez de aparecer de golpe."
    fi
done <<< "$CRUCES"

# El profesorado tiene que llegar a TODAS las carpetas personales.
SIN_PROF=""
for u in $ALUMNADO; do
    [ -d "$ALUMNOS_DIR/$u" ] || continue
    getfacl -p "$ALUMNOS_DIR/$u" 2>/dev/null | grep -qE "^group:[^:]*profesores:" \
        || SIN_PROF="$SIN_PROF $u"
done
if [ -z "$SIN_PROF" ]; then
    ok "D-alum. El profesorado llega a todas las carpetas personales"
else
    fallo "D-alum. El profesorado NO llega a estas carpetas:$SIN_PROF"
    info "     Requisito 7E del escenario. Y piensa como lo harias con 120."
fi

# =============================================================================
# BLOQUE E - LA MATRIZ: LO QUE NO DEBE EXISTIR  (Fase 5)
# =============================================================================
# Un permiso de MAS es peor que uno de menos: el de menos se nota enseguida,
# el de mas no lo nota nadie hasta que alguien ve lo que no debia.
echo "" | tee -a "$INFORME"
echo "--- E. La matriz de permisos: lo que NO debe existir ---" | tee -a "$INFORME"

SOBRAN=0
while IFS= read -r LINEA; do
    [ -z "$LINEA" ] && continue
    CARPETA=$(echo "$LINEA" | cut -d: -f1)
    GRUPO=$(echo "$LINEA"   | cut -d: -f2)
    if getfacl -p "$BASE/$CARPETA" 2>/dev/null | grep -qE "^group:[^:]*${GRUPO}:"; then
        fallo "E. '$GRUPO' TIENE acceso a '$CARPETA' y no deberia"
        info "     Segun la matriz, esa casilla esta vacia."
        SOBRAN=$((SOBRAN+1))
    fi
done <<< "$PROHIBIDOS"

# Y que ningun alumno llegue a la carpeta de otro alumno.
CRUCE_ALUMNOS=0
for u in $ALUMNADO; do
    [ -d "$ALUMNOS_DIR/$u" ] || continue
    # OJO: [^:]* y no [^:]+ — el grupo puede llegar con prefijo de dominio
    # (ACADEMIA\alumnos) o sin el (alumnos). El '+' exigiria al menos un
    # caracter delante y NO detectaria el segundo caso: falso negativo justo
    # en la comprobacion de que ningun alumno entra en la carpeta de otro.
    PERM_AL=$(getfacl -p "$ALUMNOS_DIR/$u" 2>/dev/null | grep -E "^group:[^:]*alumnos:" | cut -d: -f3 | awk '{print $1}')
    if [ -n "$PERM_AL" ] && [ "$PERM_AL" != "---" ]; then
        fallo "E. El colectivo 'alumnos' tiene acceso ($PERM_AL) a la carpeta de '$u'"
        info "     Requisito 3B: cada alumno, solo la suya."
        CRUCE_ALUMNOS=$((CRUCE_ALUMNOS+1))
    fi
done

if [ "$SOBRAN" -eq 0 ] && [ "$CRUCE_ALUMNOS" -eq 0 ]; then
    ok "E. Nadie tiene acceso de mas (examenes y secretaria siguen siendo islas)"
fi

# =============================================================================
# BLOQUE F - LA PUBLICACION Y LA INVISIBILIDAD  (Fase 5)
# =============================================================================
echo "" | tee -a "$INFORME"
echo "--- F. Publicacion en la red ---" | tee -a "$INFORME"

# Se valida ANTES de reiniciar. Aqui el servicio que publica las carpetas es
# tambien el controlador de dominio: una errata se lleva el dominio entero.
if testparm -s >/dev/null 2>&1; then
    ok "F1. La configuracion de Samba no tiene errores de sintaxis"
else
    fallo "F1. La configuracion de Samba TIENE errores de sintaxis"
    info "     NO reinicies el servicio: aqui es el controlador de dominio."
    info "     Se llevaria por delante los nombres, la autenticacion y el directorio."
fi

for s in $RECURSOS; do
    if testparm -s 2>/dev/null | grep -q "^\[$s\]"; then
        ok "F2. El recurso [$s] esta publicado"
    else
        fallo "F2. El recurso [$s] no aparece publicado"
    fi
    VECES=$(grep -c "^\[$s\]" /etc/samba/smb.conf 2>/dev/null)
    if [ "${VECES:-0}" -gt 1 ]; then
        fallo "F2-bis. La seccion [$s] aparece $VECES veces en smb.conf"
        info "     Samba usa la ULTIMA y descarta las anteriores sin avisar."
        info "     Sintoma: cambias algo, reinicias, y no pasa nada."
    fi
done

# Las carpetas personales tienen que llegar al alumno por red, se llame como
# se llame el recurso: lo que se comprueba es que algo apunte ahi.
if testparm -s 2>/dev/null | grep -qE "path = $ALUMNOS_DIR"; then
    ok "F3. Hay un recurso publicado que da acceso a las carpetas personales"
else
    fallo "F3. Nada publica las carpetas personales del alumnado"
    info "     Sin eso, el alumno inicia sesion en cualquier aula y no encuentra"
    info "     sus cosas. Que es LO QUE EL CLIENTE COMPRO (requisito 3A)."
fi

# La invisibilidad: denegar el acceso y ocultar la existencia son dos capas.
for s in $OCULTOS; do
    CONF=$(testparm -s --section-name="$s" 2>/dev/null)
    if echo "$CONF" | grep -qi "access based share enum *= *yes"; then
        ok "F4. [$s] no aparecera a quien no tenga acceso"
    else
        fallo "F4. [$s] SE VERA desde Windows aunque no se pueda entrar"
        info "     El cliente fue explicito: 'si ven una carpeta que pone examenes,"
        info "     ya estan dandole vueltas'. El nombre de una carpeta es informacion."
    fi
    if ! echo "$CONF" | grep -qi "hide unreadable *= *yes"; then
        fallo "F4-bis. [$s] mostrara contenido que no se puede abrir"
    fi
done

for s in $RECURSOS; do
    CONF=$(testparm -s --section-name="$s" 2>/dev/null)
    if ! echo "$CONF" | grep -qi "vfs objects.*acl_xattr"; then
        aviso "F5. [$s] sin 'acl_xattr': Windows puede machacar tus permisos al copiar"
    fi
done

# =============================================================================
# BLOQUE G - EL DOMINIO SIGUE VIVO DESPUES DE TODO  (Fase 6-Fase 7)
# =============================================================================
echo "" | tee -a "$INFORME"
echo "--- G. El dominio despues de los cambios ---" | tee -a "$INFORME"

if systemctl is-active samba-ad-dc >/dev/null 2>&1; then
    ok "G1. El controlador de dominio sigue activo tras tocar su configuracion"
else
    fallo "G1. El controlador de dominio se ha caido"
fi

if id laura.gimenez >/dev/null 2>&1; then
    ok "G2. Las personas del dominio se siguen resolviendo"
else
    fallo "G2. El sistema ya no resuelve a las personas del dominio"
fi

if command -v ufw >/dev/null 2>&1 && ufw status 2>/dev/null | grep -qi "Status: active"; then
    ok "G3. Hay un cortafuegos activo (Fase 7)"
    if ufw status verbose 2>/dev/null | grep -qi "deny (incoming)"; then
        ok "G3-bis. Con politica de denegar por defecto"
    else
        aviso "G3-bis. El cortafuegos no deniega por defecto"
        info "     Una lista de excepciones sin politica de fondo no cierra nada."
    fi
else
    aviso "G3. No hay cortafuegos activo - es la Fase 7. Antes de eso, es normal."
fi

# =============================================================================
# VEREDICTO
# =============================================================================
echo "" | tee -a "$INFORME"
echo "============================================================" | tee -a "$INFORME"
if [ "$FALLOS" -eq 0 ] && [ "$AVISOS" -eq 0 ]; then
    echo " VEREDICTO: TODO LO COMPROBABLE DESDE EL SERVIDOR, CORRECTO" | tee -a "$INFORME"
elif [ "$FALLOS" -eq 0 ]; then
    echo " VEREDICTO: CORRECTO CON $AVISOS AVISO(S)" | tee -a "$INFORME"
    echo " Un aviso no es un fallo: es algo que TU tienes que justificar." | tee -a "$INFORME"
else
    echo " VEREDICTO: $FALLOS FALLO(S)" | tee -a "$INFORME"
    echo " Mira en que bloque estan y compara con el apartado que estes haciendo." | tee -a "$INFORME"
    echo " El arreglo no viene aqui. Es un proyecto, no una practica guiada." | tee -a "$INFORME"
fi
echo "============================================================" | tee -a "$INFORME"

{
  echo ""
  echo "ESTE SCRIPT NO HA COMPROBADO, Y NO PUEDE:"
  echo "  - Que 'examenes' sea INVISIBLE de verdad en el listado de red"
  echo "  - Que un alumno no pueda LISTAR el contenido de 'entregas'"
  echo "  - Que un alumno entre en dos aulas distintas y encuentre sus cosas"
  echo "  - Que existan las instantaneas ni las copias .ova"
  echo ""
  echo "Las tres primeras solo se ven DESDE UN CLIENTE WINDOWS (Fase 6): desde"
  echo "Ubuntu, una carpeta bien ocultada y una a medias se comportan igual."
  echo "Aqui solo se comprueba que el servidor esta bien configurado para ello."
  echo ""
  echo "Un script no sustituye a una prueba real. Complementa."
} | tee -a "$INFORME"

if [ -n "$SUDO_USER" ]; then
    chown "$SUDO_USER":"$SUDO_USER" "$INFORME" 2>/dev/null
fi

echo ""
echo "Informe guardado en: $(pwd)/$INFORME"
echo "Subelo a tu repositorio."

[ "$FALLOS" -eq 0 ] && exit 0 || exit 1
