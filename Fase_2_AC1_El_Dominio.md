## Fase 2 · El dominio

> **[Módulo: SOR — Sistemas Operativos en Red]** · **Proyecto Final del Bloque 2 · Boochan Academy**
> 🧭 Índice del proyecto: [[02_Indice_Proyecto]] · 🏫 El cliente: [[00_El_Cliente_Boochan_Academy]]
>
> **📦 Entrega:** tres vídeos · instantánea `AC1 · Fase 2 terminada` · copia `.ova`

---

> [!important] ✍️ Este apartado son TRES vídeos y lo que produzcas va a tu repositorio
> | | |
> | :--- | :--- |
> | 📹 **3 vídeos** | `B2 · AC1 · F2 · Implementación` / `· Verificación` / `· Averías`, en la playlist `B2_Academia_1` |
> | 📝 **1 entrada de apuntes** | `b2-ac1.2-el-dominio.md` en `00_Apuntes/Trimestre_N/B2_Ubuntu_Local/`, con la estructura del **Bloque 0 · Fase 0.1.b** |
> | 💿 **Copias `.ova`** | A tu **disco externo**. Nunca a GitHub |
>
> **Identifícate al empezar cada vídeo** y pon **timestamps** en la descripción (`00:00 Presentación` y uno por paso). Los dos son corte duro en la rúbrica. Si algo de esto no lo tienes montado: **[[01_ANTES_DE_EMPEZAR]]**.

## **1 · EL ENCARGO**

> [!quote] 🗣️ Lo que te dice el cliente
> *"Lo que no puede ser es lo de ahora. Cada ordenador tiene sus cuentas, y cuando entra un alumno nuevo hay que ir aula por aula. En septiembre entraron treinta y estuvimos dos tardes. Y luego pasa que uno se cambia la contraseña en el equipo del aula 2 y en el aula 3 sigue siendo la vieja, y se lía. Queremos que las cuentas estén en un sitio y que los ordenadores pregunten ahí. Lo mismo que en la empresa de mi cuñado, que él entra con su usuario en cualquier ordenador de la oficina."*

> [!info] 🎯 Lo que ha pedido de verdad, traducido
> El cliente acaba de describirte **un dominio**, sin saber la palabra.
>
> Lo que está pidiendo, punto por punto:
> - Un **directorio central** donde vivan las cuentas.
> - Que los equipos **consulten ahí** en vez de en su disco.
> - Que una contraseña cambiada sea **la misma en todas partes**, al instante.
> - Que dar de alta a una persona sea **una operación, no ciento treinta**.

> [!info] 🧩 Los tres servicios que van dentro, y por qué te importan
> Un dominio no es una cosa: son **tres**, y las tres tienen que funcionar o no funciona nada.
>
> | Qué hace | Por qué el cliente lo notaría si falla |
> | :--- | :--- |
> | **Guarda** las cuentas, grupos y equipos | No habría a quién preguntar |
> | **Comprueba** que quien dice ser alguien lo es | Nadie podría iniciar sesión |
> | **Traduce nombres en direcciones** | Los equipos no encontrarían el servidor, aunque esté encendido |
>
> **El tercero es el que más problemas te va a dar en todo el proyecto**, y no es opinión: es lo que pasa siempre. Un dominio es, antes que nada, un servicio de nombres.

> [!danger] 🛑 En este apartado eliges el nombre del dominio. Y no se cambia
> Ya está elegido: **`ACADEMIA.LOCAL`**, NetBIOS **`ACADEMIA`**.
>
> Renombrar un dominio con equipos ya unidos es de las operaciones más desagradables que existen. **Escríbelo bien a la primera y compruébalo antes de continuar** — una errata aquí te la vas a encontrar en la Fase 6, con dos Windows ya configurados.

---

## **2 · IMPLEMENTACIÓN**

> [!example] 🎬 Antes de empezar
> 1. Léete el apartado entero, **averías incluidas**.
> 2. Ten delante los datos técnicos del punto 9 de [[00_El_Cliente_Boochan_Academy]].
> 3. **Arranca la grabación e identifícate.**

**Lo que tiene que existir al final de este apartado:**

- [ ] El dominio **`ACADEMIA.LOCAL`** creado y funcionando sobre el servidor de la Fase 1.
- [ ] El servidor es **el controlador** de ese dominio, y **el único**.
- [ ] El **servicio de nombres del dominio responde**: quien pregunte por `srv-academia.academia.local` obtiene `172.20.10.5`.
- [ ] El servidor **se resuelve a sí mismo** a través de su propio servicio de nombres, y esa configuración **sobrevive a un reinicio**.
- [ ] El dominio **se levanta solo** cuando la máquina arranca. Sin que tú entres a encenderlo.
- [ ] La autenticación del dominio funciona con la cuenta de administración.
- [ ] **No hay servicios antiguos estorbando**: si en el sistema queda algo de la etapa anterior escuchando en los mismos puertos, sobra.

> [!danger] 🛑 El fallo silencioso de este apartado, y no te voy a decir cuál es
> Hay una forma de terminar la Fase 2 con **todo aparentemente correcto** —el servicio activo, la autenticación funcionando, el nombre resolviéndose— y que en el **Fase 6**, con los Windows delante, te salga *"no se encuentra el dominio"*.
>
> La pista es esta: **tu servidor tiene más de una tarjeta de red.** Un servicio que se anuncia por la tarjeta equivocada funciona perfectamente **para sí mismo**.
>
> Piénsalo ahora. Si lo dejas para la Fase 6, lo vas a diagnosticar con dos máquinas más encima de la mesa.

> [!warning] ⚠️ Sobre el script de aprovisionamiento del bloque
> Existe un `provision_boochan.sh` en el repositorio del Bloque 2. **No sirve aquí**: lleva dentro el dominio, la contraseña y la dirección de Boochan S.L., que no son los tuyos.
>
> Tienes dos caminos y **los dos son legítimos** si sabes defenderlos en el vídeo:
> - **Hacerlo a mano**, comando a comando, entendiendo cada parámetro.
> - **Partir del script**, leerlo entero y adaptarlo a la academia.
>
> Lo que **no** vale: ejecutarlo tal cual y pelearte después con un dominio que se llama como no debe.
>
> **Si lo adaptas, en el vídeo tienes que explicar qué has cambiado y por qué.** Adaptar un script ajeno es una habilidad profesional de primer orden; ejecutarlo sin leerlo es lo contrario.

> [!question] 🤔 Para decir en voz alta en el vídeo
> 1. El cliente ha dicho *"que los ordenadores pregunten ahí"*. **¿Qué le tienes que hacer a un ordenador del aula para que pregunte ahí y no a su propio disco?** Todavía no lo has hecho: dilo, y di en qué apartado toca.
> 2. Tu servidor ahora apunta su resolución de nombres **a sí mismo**. ¿Por qué eso es imprescindible, y por qué se hace **al final** y no al principio?
> 3. Si mañana la academia abre una segunda sede, **¿qué le sobra a este montaje?** *(Pista: cuenta cuántos controladores tienes.)*

---

## **3 · VERIFICACIÓN**

> [!danger] 🛑 Las pruebas las decides tú
> Aquí tienes **lo que tiene que quedar demostrado**. Con qué comandos, desde dónde y en qué orden, es cosa tuya — y esa elección puntúa.

| # | Tiene que quedar demostrado | La trampa |
| :--- | :--- | :--- |
| 1 | Que el dominio existe y se llama **exactamente** `ACADEMIA.LOCAL` | Mayúsculas y minúsculas no dan igual en todos los sitios donde aparece |
| 2 | Que el servidor es controlador del dominio y está sirviendo | "El servicio está activo" y "el dominio funciona" no son la misma frase |
| 3 | Que el nombre del servidor **se resuelve a la dirección correcta** | ¿A quién le estás preguntando cuando resuelves? Fuérzalo |
| 4 | Que el dominio se anuncia **en la red de las aulas** | Esta es la prueba que evita el desastre de la Fase 6 |
| 5 | Que la autenticación del dominio funciona de verdad | Que exista una cuenta no demuestra que se pueda autenticar con ella |
| 6 | Que **todo lo anterior sigue igual después de reiniciar** | Un dominio que hay que levantar a mano no es un dominio |
| 7 | Que no quedan servicios antiguos peleándose por los mismos puertos | Dos programas escuchando en el mismo sitio: uno gana y no eliges tú |

> [!warning] ⚠️ La 4 es la que separa una Fase 2 aprobado de uno que revienta tres apartados más tarde
> **No te conformes con que el nombre resuelva.** Comprueba **a qué dirección** resuelve y **por qué tarjeta** se está ofreciendo el servicio. Son dos preguntas distintas y las dos tienen respuesta desde el servidor.

> [!example] 🤖 Y después, el verificador
> ```bash
> cd ~
> curl -O https://raw.githubusercontent.com/sor-iesjj/bloque-2-academia-1/main/99_Recursos/verificar_ac1_proyecto.sh
> chmod +x verificar_ac1_proyecto.sh
> less verificar_ac1_proyecto.sh
> sudo ./verificar_ac1_proyecto.sh
> ```
> Este es el verificador **grande**: comprueba el proyecto entero, de la Fase 2 a la Fase 7. Hoy te va a marcar como pendientes un montón de cosas que aún no existen, **y eso es correcto**: las personas y las carpetas llegan en los apartados siguientes.
>
> **Lo que sí tiene que estar en verde hoy es su bloque `A`.**
>
> El informe se guarda en `verificacion-academia.txt`. Guárdalo: en la Fase 7 vas a comparar el de hoy con el del final.

---

## **4 · LABORATORIO DE AVERÍAS**

> [!danger] 🛑 Requisito: la instantánea `AC1 · Fase 2 terminada` tomada y comprobada
> Y en este apartado el requisito es serio: **las dos averías tocan lo que sostiene el dominio entero.**

> [!warning] 🖥️ Ninguna de las dos te deja fuera del servidor
> Entras con tu usuario local, que no depende del dominio, y por **dirección**, no por nombre. Es lo mismo que viste en la Fase 4 del Bloque 2: **entraste por una IP**, y por eso podías arreglar un DNS roto.

---

### **AVERÍA 1 · El servidor que ya no sabe a quién preguntar**

> [!bug] 🔨 Qué tienes que romper
> Haz que el servidor **deje de usar su propio servicio de nombres** y pase a preguntarle a uno de internet.
>
> Cuidado: el fichero que hay que tocar **está protegido a propósito** para que nada lo sobrescriba. Parte del ejercicio es descubrir cómo está protegido y quitarle la protección. *(Y volvérsela a poner al reparar. Si no, la avería vuelve sola al reiniciar.)*

> [!question] 🤔 Predice antes de ejecutar
> 1. ¿Seguirá el servidor navegando por internet?
> 2. ¿Seguirá resolviendo `srv-academia.academia.local`?
> 3. ¿Se caerá algún servicio, o seguirán todos activos?

**Lo que tienes que hacer tú:** distinguir **qué sigue funcionando y qué no**, y explicar por qué esa combinación concreta es tan traicionera. En el vídeo tiene que verse la diferencia entre *resolver un nombre de internet* y *resolver un nombre del dominio*.

> [!success] 🎯 Lo que se te evalúa aquí
> Que entiendas que **un servidor de nombres es también un cliente de nombres**, y que apuntarlo al sitio equivocado deja media máquina funcionando de maravilla.
>
> Y algo que se te va a repetir: hay configuraciones que **no basta con cambiar, hay que fijarlas** para que sobrevivan al siguiente arranque.

---

### **AVERÍA 2 · El dominio que no vuelve**

> [!bug] 🔨 Qué tienes que romper
> Haz que el servicio del dominio **siga funcionando ahora mismo** pero **no se levante en el próximo arranque**. No lo pares: déjalo corriendo.

> [!question] 🤔 Predice antes de ejecutar
> 1. ¿Notará alguien algo hoy?
> 2. ¿Lo detectará alguna de las comprobaciones que hiciste en el punto 3?
> 3. ¿Cuándo se enteraría la academia de que esto pasó?

**Lo que tienes que hacer tú:** encontrar la comprobación que **sí** lo detecta —hay una y es de una sola palabra— y explicar por qué la que usa casi todo el mundo no vale.

> [!danger] 🛑 Antes de reparar, haz esto: reinicia la máquina
> Sí, con la avería puesta. Tienes instantánea.
>
> **Quiero que veas la academia un lunes por la mañana.** El servidor arranca, la máquina responde, y no puede entrar nadie. Ese es el escenario real de esta avería, y no se entiende hasta que se ve.

> [!success] 🎯 Lo que se te evalúa aquí
> Que sepas separar **"está funcionando"** de **"volverá a funcionar"**. Son dos propiedades distintas de un servicio, se comprueban con dos comandos distintos, y la segunda es la que te llama por teléfono un domingo.
>
> **Una bomba de relojería no da error el día que la pones.**

---

## **5 · PUNTO DE CONTROL**

> [!danger] 🛑 Verificación en verde primero. Y la VM apagada de verdad
> A partir de este apartado hay **Kerberos** en la máquina, así que lo de apagar deja de ser una manía y pasa a ser el motivo por el que tu instantánea servirá o no dentro de un mes: una instantánea con la RAM dentro **congela el reloj**, y un reloj desfasado tumba la autenticación entera.

Instantánea: **`AC1 · Fase 2 terminada`**.

```
SOR/Bloque_2/Proyecto_Academia/Fase 2/  B2-AC1-F2-el-dominio.ova
```

> [!info] 💿 Esta copia es la más valiosa que vas a hacer en todo el proyecto
> Piénsalo: las personas de la Fase 3 se recrean en diez minutos con un bucle. Las carpetas de la Fase 4, en cinco. **Un dominio no se recrea copiando comandos**: se aprovisiona, y si algo sale mal a mitad, se queda a medias de una forma difícil de arreglar.
>
> Si un día tienes que hacer sitio en el disco externo y borrar copias, **esta no se borra**.

### ✅ Antes de pasar a la Fase 3

- [ ] Los tres vídeos subidos, **con identificación al principio de cada uno**.
- [ ] El dominio responde **después de un reinicio limpio**, sin tocar nada.
- [ ] El bloque `A` del verificador, en verde.
- [ ] Instantánea **`AC1 · Fase 2 terminada`** con la VM apagada.
- [ ] **`B2-AC1-F2-el-dominio.ova`** en el disco externo, comprobado.
- [ ] Las dos averías reparadas **y el reinicio de la avería 2 grabado**.

---

> [!summary] 🎓 Qué has demostrado en este apartado
> Que sabes traducir *"queremos que las cuentas estén en un sitio"* a un controlador de dominio funcionando, y que entiendes que dentro hay **un directorio, una autenticación y un servicio de nombres** — y que el tercero es el que rompe.
>
> Y las dos ideas del laboratorio: que **un servicio puede estar vivo y no volver**, y que **una configuración que no se fija no está hecha**.
>
> **Siguiente:** [[Fase_3_AC1_Las_Personas]] — el dominio está vacío. Toca meter a la academia dentro.
