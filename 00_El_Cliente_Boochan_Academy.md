## 🏫 El cliente: Boochan Academy

> **[Módulo: SOR — Sistemas Operativos en Red]** · **Ficha de escenario del Proyecto Final del Bloque 2**
>
> **📍 Cuándo se lee:** **LO PRIMERO DE TODO**, antes incluso del índice. Y se vuelve a ella cada vez que dudes de un nombre, un número o un permiso.

---

> [!important] 👋 Empieza por aquí
> **Este es el primer documento del proyecto**, antes que el índice y antes que cualquier apartado.
>
> Y el orden no es casual: **primero se conoce al cliente, después se organiza el trabajo.** Ningún técnico abre un plan de tareas antes de saber para quién trabaja y qué necesita.
>
> Cuando termines de leer esto sabrás **qué hay que resolver**. Después vienen dos páginas cortas y en este orden:
> 1. **[[01_ANTES_DE_EMPEZAR|🛠️ Antes de empezar]]** — traer el material, preparar dónde guardas lo que produzcas y comprobar que puedes entregar. **20 minutos.**
> 2. **[[02_Indice_Proyecto|🧭 El índice]]** — cómo está organizado el encargo y qué se evalúa.

> [!abstract] 📌 Qué es este documento
> Esto **no es un enunciado de prácticas**. Es lo que te entregaría un cliente de verdad: quién es, qué tiene, quién trabaja allí y qué quiere que pueda hacer cada uno.
>
> **Es la fuente de verdad del proyecto entero.** Si en un apartado hay una discrepancia con esta página, **manda esta página**.
>
> Lo que **no** vas a encontrar aquí: cómo se hace. Eso es tu trabajo.

> [!danger] 🛑 Esto no es Boochan S.L. y los comandos de las fases no valen
> Otro dominio, otra red, otras carpetas, otros números. **Copiar y pegar de las fases no te va a funcionar** — está hecho a propósito.
>
> Lo que sí te vale de las fases es **lo que aprendiste**: qué hace cada herramienta y por qué. Eso viaja. Los valores, no.

---

## **1 · LA EMPRESA**

**Boochan Academy** es una academia de informática privada. Da clases de tarde a unos 120 alumnos y tiene contratados a tres profesores y dos personas en secretaría.

Hasta ahora cada equipo iba por su cuenta: el alumno se sentaba, usaba una cuenta local y guardaba su trabajo en el disco de ese ordenador. **Te llaman porque eso ya no se sostiene.**

> [!quote] 🗣️ Lo que te dijeron en la reunión, literal
> *"El problema es que si un chaval falta un día y al siguiente se sienta en otra aula, no tiene nada de lo suyo. Y cuando formateamos un equipo, perdemos trabajo de gente. Queremos que cada uno entre con su nombre en cualquier ordenador del centro y encuentre sus cosas. Y queremos poder decir quién ve qué, porque ahora mismo cualquiera abre cualquier carpeta."*

---

## **2 · LAS INSTALACIONES**

| Aula | Planta | Equipos de alumno | Equipo de profesor |
| :--- | :--- | :---: | :---: |
| `aula1` | Baja | 25 | 1 |
| `aula2` | Baja | 25 | 1 |
| `aula3` | Baja | 25 | 1 |
| `aula4` | Primera | 25 | 1 |
| `aula5` | Primera | 25 | 1 |
| **Total** | | **125** | **5** |

**130 equipos.** Ese número no es decorativo: es la razón por la que este encargo no se resuelve creando usuarios locales.

> [!question] 🤔 La cuenta que tienes que saber hacer
> Un alumno nuevo, con cuentas locales, son **130 altas**. Uno que se va, **130 bajas**. Un cambio de contraseña, **130 veces**.
>
> Con 120 alumnos y rotación cada trimestre, eso no es trabajo: es imposible. **De ahí sale el requisito 3A**, y de ahí sale todo lo demás.

---

## **3 · LO QUE PIDE EL CLIENTE**

**3A — "Que cada uno entre con su nombre en cualquier equipo del centro."**
Un alumno de `aula1` que mañana se sienta en `aula4` tiene que poder iniciar sesión igual, con la misma contraseña, y llegar a sus cosas. Las cuentas **no viven en los equipos**: viven en un sitio central que todos consultan.

**3B — "Que cada uno vea lo suyo y nada más."**
Tres niveles, y el cliente los describió así:

| Nivel | Quién | Qué puede |
| :--- | :--- | :--- |
| **Técnico** | Tú | Todo. Eres quien administra el sistema |
| **Profesores** | Los tres profesores | Sus cosas, **y las carpetas de todos los alumnos** |
| **Alumnos** | Los 120 | **Solo su propia carpeta** |

**3C — "Que los apuntes los pongan los profesores y los alumnos solo los lean."**
Hoy los apuntes están en un pendrive que va de mano en mano y hay tres versiones distintas circulando.

**3D — "Que los alumnos entreguen prácticas sin poder cotillear la del compañero."**
Textual: *"el año pasado tuvimos dos entregas idénticas y no había forma de saber quién copió a quién."*

**3E — "Que los exámenes no los vea nadie más que nosotros. Ni que sepan que están ahí."**
El cliente insistió en esta parte. Lo explicó él solo: *"si el chaval ve una carpeta que se llama exámenes, aunque no pueda abrirla, ya sabe que existe y ya está dándole vueltas."*

**3F — "Secretaría es aparte. Ahí ni los profesores."**
Matrículas, recibos, datos bancarios de las familias. *"Eso lo llevamos Pilar y yo, y punto."*

---

## **4 · LAS PERSONAS**

Formato de nombre de usuario: **`nombre.apellido`**, todo en minúsculas.
**Contraseña de todos:** `Acad3mia.2026`

### 4A · Los tres colectivos

| Colectivo | Grupo | GID | Rango de UID |
| :--- | :--- | :---: | :--- |
| Profesorado | `profesores` | **4001** | `20001`–`20003` |
| Alumnado | `alumnos` | **4002** | `20101`–`20106` |
| Secretaría | `secretaria` | **4003** | `20201`–`20202` |

> [!info] 🎓 Por qué los rangos de UID están separados por colectivo
> No es manía. Con `20001`, `20101` y `20201` **el número te dice quién es la persona** sin consultar nada: un `20 1 xx` es alumno. En un `ls -ln` de un servidor con problemas, eso es la diferencia entre entender la salida y no entenderla.
>
> Es exactamente lo que hacen los sistemas de verdad: los usuarios de sistema van por debajo de 1000, los humanos por encima. **Un plan de numeración es documentación que viaja dentro del sistema.**

### 4B · La plantilla

| Usuario | Nombre completo | Grupo | UID |
| :--- | :--- | :--- | :---: |
| `laura.gimenez` | Laura Giménez | profesores | 20001 |
| `sergio.beltran` | Sergio Beltrán | profesores | 20002 |
| `nuria.pastor` | Nuria Pastor | profesores | 20003 |
| `hugo.marti` | Hugo Martí | alumnos | 20101 |
| `carla.ortiz` | Carla Ortiz | alumnos | 20102 |
| `iker.romero` | Iker Romero | alumnos | 20103 |
| `noa.vidal` | Noa Vidal | alumnos | 20104 |
| `dani.serra` | Dani Serra | alumnos | 20105 |
| `lucia.penalva` | Lucía Peñalva | alumnos | 20106 |
| `pilar.quiles` | Pilar Quiles | secretaria | 20201 |
| `raul.esteve` | Raúl Esteve | secretaria | 20202 |

> [!warning] ⚠️ Seis alumnos, no ciento veinte
> Montas **seis** porque con seis se demuestra todo lo que hay que demostrar y caben en una VM de laboratorio. El diseño tiene que servir para 120 sin cambiar nada más que la lista.
>
> **Si tu solución solo funciona porque son seis, tu solución no vale.** Es una pregunta que te van a hacer.

> [!danger] 🛑 Los números no son decorativos
> UID y GID son **exactamente** los de esta tabla. Si una persona acaba con otro número, los permisos que le des después **no le alcanzarán y no dará ningún error**. Ya lo viste en el Bloque 2, y aquí no hay nadie recordándotelo paso a paso.

---

## **5 · LAS CARPETAS DE LA ACADEMIA**

| Carpeta | Para qué es | De quién es |
| :--- | :--- | :--- |
| **`material/`** | Apuntes, ejercicios, guías. Lo que el profesor reparte | Profesorado |
| **`entregas/`** | Buzón donde los alumnos dejan sus prácticas | Alumnado (deposita) · Profesorado (recoge) |
| **`examenes/`** | Exámenes, plantillas de corrección, notas | Profesorado |
| **`secretaria/`** | Matrículas, recibos, datos de las familias | Secretaría |
| **`alumnos/<usuario>/`** | La carpeta personal de cada alumno | Cada alumno, la suya |

> [!danger] 🛑 Qué significa exactamente "encontrar sus cosas" — y qué NO
> El requisito 3A se cumple con **dos** cosas, y solo con esas dos:
> 1. Que **sus credenciales valgan en cualquier equipo** del centro.
> 2. Que **su carpeta personal esté en el servidor** y le llegue por red desde donde se siente.
>
> **Lo que queda FUERA de este proyecto: los perfiles móviles.** El escritorio, el fondo de pantalla, los iconos y la configuración de Windows **no** tienen que viajar con el alumno. Eso es otra tecnología, con otros problemas —y con una carpeta de perfil que se corrompe el día menos pensado—.
>
> Si te pones a montar perfiles móviles, estás haciendo trabajo que nadie te ha pedido y que **no se corrige**. El cliente quiere sus ficheros, no su fondo de pantalla.

> [!info] 🗄️ Un dato que el cliente te dio y que condiciona el diseño
> *"Los chavales se descargan de todo. El disco del aula 2 se llenó en un mes."*
>
> **Las carpetas personales de los alumnos son lo único de esta academia que va a crecer sin control.** Piensa dónde las pones antes de ponerlas: el día que se llenen, algo se va a quedar sin sitio, y tú eliges qué.

---

## **6 · 🔴 LA MATRIZ DE PERMISOS**

**Esta tabla es el contrato.** Todo lo que hagas en los apartados Fase 3, Fase 4, Fase 5 y Fase 6 sirve para que se cumpla exactamente, y para que puedas demostrarlo.

| Colectivo ↓ · Carpeta → | `material` | `entregas` | `examenes` | `secretaria` | su carpeta personal | la carpeta de otro alumno |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **profesores** | **RW** | **R** *(todas)* | **RW** | — 🚫 | **RW** *(todas)* | **RW** |
| **alumnos** | **R** | **D** | — 🚫 | — 🚫 | **RW** | — 🚫 |
| **secretaria** | — | — | — 🚫 | **RW** | — | — |

**Leyenda**
- **RW** — leer y escribir
- **R** — solo lectura
- **D** — **depositar**: puede dejar ficheros dentro, **no puede listar el contenido** ni borrar lo que ya está
- **—** — sin acceso
- **🚫** — sin acceso **y sin verla siquiera** en el listado de red

---

## **7 · POR QUÉ LA MATRIZ ES ASÍ** *(esto entra en la corrección)*

**7A — Los profesores escriben `material` y los alumnos solo lo leen.**
Un apunte con el que estudian veinte personas **tiene que tener una sola versión**. Si el alumno puede escribir, en dos semanas hay tres copias distintas y nadie sabe cuál es la buena — que es exactamente el problema del pendrive que te contaron.
Y hay un motivo menos evidente: **el alumno no pierde nada** por no poder escribir ahí. Tiene su carpeta personal para trabajar. **Dar un permiso que nadie necesita es regalar riesgo a cambio de nada.**

**7B — 🔴 `entregas` es un buzón, no una carpeta compartida.**
El alumno **puede dejar** su práctica. **No puede ver** lo que hay dentro ni borrar lo de otro.
- Si pudiera **listar**, copiaría la práctica del compañero. Es el problema 3D, con nombre y apellidos.
- Si pudiera **borrar**, un descuido —o una gracia— destruye el trabajo de otro y **no hay forma de saber quién fue**.

Piénsalo como el buzón de tu portal: **echas tu carta y no puedes sacar las de los demás**. Nadie encuentra raro que un buzón funcione así.

**7C — 🔴 `examenes` no es que esté prohibida: es que no existe para el alumno.**
Denegar el acceso y **ocultar la existencia** son dos capas distintas de seguridad. El cliente lo explicó mejor que muchos manuales: *"si ve que la carpeta está, ya sabe que hay algo que buscar"*.
**El nombre de una carpeta es información.** `examenes`, `nominas`, `direccion`: quien los ve ya sabe qué pedir, a quién y dónde está guardado.

**7D — 🔴 Secretaría es una isla. Ni los profesores entran.**
Ahí hay matrículas, recibos y datos bancarios de familias: **datos personales de terceros**, no de la academia. Un profesor necesita saber qué alumnos tiene en clase; **no necesita saber cuánto paga cada familia ni si alguien va con un recibo devuelto**.

> [!question] 🤔 La pregunta que te van a hacer
> *"Si el profesor es de más nivel que el alumno, ¿cómo puede ser que no entre en secretaría?"*
>
> Piénsalo antes de seguir leyendo. **La respuesta:** porque los permisos **no son un escalafón**. No van de quién manda más, van de **qué necesita cada uno para su trabajo**. Un profesor y una administrativa hacen cosas distintas, así que acceden a cosas distintas — y ninguno de los dos está "por encima".
>
> Se llama **principio de mínimo privilegio**, y es lo que sostiene toda esta tabla. Lo viste en Boochan S.L. con RRHH y contabilidad: **es la misma regla, con otra ropa.**

**7E — Los profesores entran en todas las carpetas de alumnos.**
Corrigen, revisan y recuperan trabajo perdido. **Todos los profesores a todos los alumnos**, sin distinguir aula ni asignatura: la academia es pequeña, los grupos se reparten cada trimestre y un modelo por asignatura habría que rehacerlo cuatro veces al año.

> [!info] 🎓 Una decisión de diseño que hay que saber defender
> Esa simplicidad es **una elección**, no un descuido. En un centro de 800 alumnos y 60 profesores, la respuesta sería otra.
>
> **Un diseño se ajusta al tamaño del cliente.** Montar aquí una jerarquía por aulas y asignaturas sería trabajo de más hoy y trabajo de mantenimiento cada trimestre, para resolver un problema que esta academia no tiene. Eso también es criterio profesional — y también te lo pueden preguntar.

**7F — Ningún alumno entra en la carpeta de otro alumno.**
No hace falta justificarlo mucho: es el requisito 3B. Lo que sí hay que entender es que **esto no se cumple solo por poner las carpetas separadas**. Alguien tiene que decidir, carpeta a carpeta, quién puede.

---

## **8 · LAS PRUEBAS QUE HABRÁ QUE PODER DEMOSTRAR**

Al final del proyecto, **desde los equipos de aula**, tienes que poder enseñar esto. No son los pasos: son el resultado que el cliente compró.

| # | Quién | Qué intenta | Qué debe pasar | Qué demuestra |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Un alumno | Entrar en `aula1` y luego en `aula4` con el mismo usuario | **Encuentra sus cosas las dos veces** | El requisito 3A: es lo que compró el cliente |
| 2 | Un alumno | Ver `examenes` en el listado de red | **Ni siquiera aparece** | 3E · invisibilidad |
| 3 | Un alumno | Abrir la carpeta personal de otro alumno | **Denegado** | 3B · mínimo privilegio |
| 4 | Un alumno | Modificar un apunte de `material` | **Denegado**, pero puede leerlo | 3C · lectura sin escritura |
| 5 | Un alumno | Listar lo que hay en `entregas` | **Denegado**, aunque acaba de dejar ahí su práctica | 3D · buzón |
| 6 | Un alumno | Borrar la entrega de otro | **Denegado** | 3D · buzón |
| 7 | Un profesor | Abrir la carpeta personal de cualquier alumno | **Funciona** | 7E |
| 8 | Un profesor | Ver `secretaria` en el listado de red | **Ni siquiera aparece** | 3F · la isla |
| 9 | Secretaría | Entrar en `secretaria` | **Funciona** | Una isla sin habitantes no sirve de nada |

> [!success] 🎯 El objetivo del proyecto entero
> No es "montar un servidor". Es que **no se pueda hacer nada que no esté autorizado** — y poder demostrarlo con una prueba por regla, delante de quien te paga.

---

## **9 · LOS DATOS TÉCNICOS QUE YA ESTÁN DECIDIDOS**

Esto no lo eliges tú: viene dado, como en cualquier encargo real donde hay una red que ya existe.

```
DOMINIO      ACADEMIA.LOCAL          (NetBIOS: ACADEMIA)
RED          172.20.10.0/24
SERVIDOR     172.20.10.5   ·  nombre: srv-academia
CLIENTE 1    172.20.10.20  ·  aula1-pc01   (equipo de ALUMNO, planta baja)
CLIENTE 2    172.20.10.21  ·  aula4-prof   (equipo de PROFESOR, primera planta)

GRUPOS       profesores 4001 · alumnos 4002 · secretaria 4003
UID          20001-20003 profesorado
             20101-20106 alumnado
             20201-20202 secretaría
CLAVE        Acad3mia.2026   (todas las cuentas, incluida la de administración)
```

> [!warning] ⚠️ Dos clientes, cinco aulas
> Montas **dos** equipos Windows: uno hace de equipo de aula y otro de equipo de profesor. Con eso se demuestran las nueve pruebas del punto 8.
>
> **Que sean dos no cambia el diseño.** Si tu solución necesita saber cuántos equipos hay, está mal planteada.

> [!tip] 💡 Sobre la contraseña única
> Todas las cuentas con la misma contraseña porque esto es un laboratorio y hay que poder probar nueve escenarios sin perder media hora.
>
> **En la academia real, cada persona tendría la suya y estaría obligada a cambiarla al primer inicio de sesión.** Saber qué estás simplificando es parte de entenderlo — y es de las cosas que se preguntan.

---

> [!summary] 🎓 Qué llevas de esta ficha
> - **Un cliente con un problema real**, no un enunciado: 130 equipos, cuentas locales y un pendrive con tres versiones de los apuntes.
> - **Una matriz de permisos con su porqué.** Cada casilla se defiende con una frase; si no sabes defenderla, todavía no la has entendido.
> - **Dos ideas que se repiten:** que denegar y ocultar son cosas distintas, y que los permisos no son un escalafón sino un reparto de necesidades.
> - **Los datos técnicos cerrados**, que son distintos de los de las fases **a propósito**.
>
> **Siguiente:** [[02_Indice_Proyecto]] — el índice del encargo, apartado por apartado.
