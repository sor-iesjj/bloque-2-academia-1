## Fase 3 · Las personas

> **[Módulo: SOR — Sistemas Operativos en Red]** · **Proyecto Final del Bloque 2 · Boochan Academy**
> 🧭 Índice del proyecto: [[02_Indice_Proyecto]] · 🏫 El cliente: [[00_El_Cliente_Boochan_Academy]]
>
> **📦 Entrega:** tres vídeos · instantánea `AC1 · Fase 3 terminada` · copia `.ova`

---

> [!important] ✍️ Este apartado son TRES vídeos y lo que produzcas va a tu repositorio
> | | |
> | :--- | :--- |
> | 📹 **3 vídeos** | `B2 · AC1 · F3 · Implementación` / `· Verificación` / `· Averías`, en la playlist `B2_Academia_1` |
> | 📝 **1 entrada de apuntes** | `b2-ac1.3-las-personas.md` en `00_Apuntes/Trimestre_N/B2_Ubuntu_Local/`, con la estructura del **Bloque 0 · Fase 0.1.b** |
> | 💿 **Copias `.ova`** | A tu **disco externo**. Nunca a GitHub |
>
> **Identifícate al empezar cada vídeo** y pon **timestamps** en la descripción (`00:00 Presentación` y uno por paso). Los dos son corte duro en la rúbrica. Si algo de esto no lo tienes montado: **[[01_ANTES_DE_EMPEZAR]]**.

## **1 · EL ENCARGO**

> [!quote] 🗣️ Lo que te dice el cliente
> *"Te paso la lista: somos tres profesores, Pilar y yo en secretaría, y los alumnos. Para probar mete seis, que ya meteremos el resto nosotros cuando nos enseñes. Y quiero que quede claro quién es quién, porque luego habrá que decir 'esto lo ven los profesores' y no me apetece ir uno por uno. Ah, y las contraseñas todas iguales de momento, que estamos probando."*

> [!info] 🎯 Lo que ha pedido de verdad, traducido
> - **Cuentas de dominio** para las once personas de la ficha del cliente.
> - **Tres colectivos** bien separados: profesorado, alumnado y secretaría.
> - Que el reparto de permisos que viene luego se pueda hacer **por colectivo y no persona a persona**. Eso ya te lo ha dicho él: *"no me apetece ir uno por uno"*.
> - Y una cosa que **no** ha dicho y tienes que hacer igual: que este montaje **sirva para 120 alumnos** sin cambiar el diseño.

> [!danger] 🛑 La frase que hay que oír bien: *"no me apetece ir uno por uno"*
> Está describiendo **por qué existen los grupos**. Un permiso se le da a un grupo, no a una persona; y cuando entra alguien nuevo, se le mete en el grupo y **hereda todo lo que ese grupo puede hacer**, sin tocar ni una carpeta.
>
> Si al terminar el proyecto dar de alta a un alumno nuevo te obliga a repasar cinco carpetas, **lo has diseñado mal** — aunque funcione.

---

## **2 · IMPLEMENTACIÓN**

> [!example] 🎬 Antes de empezar
> 1. Léete el apartado entero. **Hasta el final**, que hoy hay sorpresa.
> 2. Ten delante los puntos 4A y 4B de [[00_El_Cliente_Boochan_Academy]]: nombres, grupos, GID y UID exactos.
> 3. **Arranca la grabación e identifícate.**

**Lo que tiene que existir al final de este apartado:**

- [ ] Los **tres grupos** del dominio, con los **GID** exactos de la ficha: `profesores` 4001, `alumnos` 4002, `secretaria` 4003.
- [ ] Las **once cuentas**, con sus **UID** exactos y su nombre y apellido reales.
- [ ] Cada persona **dentro de su grupo**.
- [ ] El sistema operativo del servidor **reconoce a esas personas como usuarios suyos**: no basta con que existan en el directorio.
- [ ] Todo lo anterior **sigue igual después de reiniciar**.

> [!danger] 🛑 Los números no son un detalle. Son el apartado entero
> Un usuario se puede crear **sin decir qué número lleva**. El comando funciona, no da ningún error, y la persona existe.
>
> Y en el **Fase 5**, cuando des permisos al grupo `4002`, esos permisos **no alcanzarán a nadie** — y el error que verás allí hablará de accesos denegados, no de esta línea.
>
> **En Unix una persona no es su nombre: es su número.** Lo aprendiste en la Fase 5 del Bloque 2 y hoy no hay nadie recordándotelo en cada comando.

> [!warning] ⚠️ Hay una pieza sin la cual esto parece funcionar y no funciona
> Puedes acabar con las once cuentas creadas, listadas correctamente por las herramientas del dominio, **y que el sistema de ficheros del servidor no sepa quiénes son**.
>
> Son **dos mundos distintos** conviviendo en la misma máquina, y hay que decirle a uno que le pregunte al otro. Si no te suena de qué hablo, vuelve a la Fase 5 del Bloque 2: está en el primer paso, y es el que menos se recuerda.
>
> **Cómo detectarlo:** busca una comprobación que no use las herramientas del dominio, sino las del sistema. Si el dominio ve a `hugo.marti` y el sistema no, tienes exactamente este problema.

> [!question] 🤔 Para decir en voz alta en el vídeo
> 1. **¿Por qué `secretaria` es un grupo aparte**, si el cliente solo te habló de tres niveles de acceso? *(Pista: mira la matriz. Alguien tiene que poder entrar en esa carpeta.)*
> 2. Los alumnos van del `20101` al `20106` y los profesores del `20001` al `20003`. **¿Qué ganas separando los rangos?** Contéstalo con un ejemplo tuyo, no con la frase de la ficha.
> 3. **¿Cómo darías de alta a los 114 alumnos que faltan?** No hace falta que lo hagas: hace falta que sepas decirlo. Y que expliques **qué pasaría si dos de ellos acabaran con el mismo número**.

---

## **2.5 · 🚨 UN MOMENTO. ALGO HA SALIDO MAL**

> [!danger] 🛑 Esto no estaba en el índice, y no es un error del documento
> Para. Deja lo que estás haciendo.
>
> **Un compañero de la academia ha entrado al cuartito y ha tocado el servidor.** No sabes qué. No hay registro. Lo que tenías hecho hoy ya no te fías de ello.
>
> Esto pasa. Y cuando pasa, un técnico no se pone a auditar cambios que no puede reconstruir: **se vuelve a un estado conocido.**

**Lo que tienes que hacer, y va grabado en el vídeo de implementación:**

1. **Restaura la instantánea `AC1 · Fase 2 terminada`.** La del apartado anterior. Sí, pierdes lo que llevas hecho hoy.
2. **Comprueba que estás donde creías estar.** No lo des por hecho porque VirtualBox no se haya quejado: enseña en pantalla que el dominio de la academia está en pie y que **las personas de la Fase 3 ya no existen**.
3. **Vuelve a hacer el apartado entero.** Otra vez. Desde cero.

> [!question] 🤔 Antes de restaurar, contesta en voz alta
> 1. ¿Qué crees que vas a perder exactamente?
> 2. ¿Y el fichero del sistema que tocaste para que el servidor reconozca a las personas del dominio? ¿Sigue tocado después de restaurar?
> 3. ¿Cuánto tiempo calculas que te va a llevar rehacerlo?

> [!success] 🎯 Por qué te hago esto
> Porque **llevas dos apartados creando puntos de retorno y ninguno usándolos**. Y un punto de retorno que nunca has usado es una suposición, no un plan.
>
> Hay dos cosas que solo se aprenden restaurando de verdad:
> - **Qué se pierde**, exactamente. No lo que crees: lo que se pierde.
> - **Cuánto cuesta volver.** Si rehacer la Fase 3 te lleva 15 minutos, tus instantáneas están bien colocadas. Si te lleva dos horas, es que estás guardando demasiado poco a menudo — y eso es una conclusión sobre **tu forma de trabajar**, no sobre este apartado.
>
> **La segunda vez lo vas a hacer mejor y más rápido.** Eso también dice algo: los pasos que la primera vez fuiste descubriendo, ahora los entiendes.

> [!important] ✍️ En el vídeo, al terminar la segunda vuelta
> Di en voz alta **cuánto has tardado la segunda vez comparado con la primera**, y **una cosa que has hecho distinta**. Es la parte que se corrige de esta prueba.

---

## **3 · VERIFICACIÓN**

> [!danger] 🛑 Las pruebas las decides tú
> Y hoy hay una particularidad: **casi todo lo de este apartado se puede comprobar de dos maneras distintas**, y no dan la misma información. Elegir bien es el ejercicio.

| # | Tiene que quedar demostrado | La trampa |
| :--- | :--- | :--- |
| 1 | Que existen los **tres grupos** con sus GID exactos | Una herramienta te dirá que existen; otra, con qué número |
| 2 | Que existen las **once personas** con sus UID exactos | Comprobarlas de una en una a ojo es como no comprobarlas |
| 3 | Que cada persona está **en su grupo** | Que la persona exista y que pertenezca al grupo son dos cosas |
| 4 | Que el **sistema operativo**, no solo el dominio, reconoce a esas personas | Aquí es donde se cae la mitad de la clase |
| 5 | Que **nadie tiene un número repetido** | Dos personas con el mismo número no dan ningún error |
| 6 | Que todo sigue igual **después de reiniciar** | Ya sabes por qué |

> [!tip] 💡 La 2 y la 5 piden lo mismo que en la Fase 5 del Bloque 2: una herramienta, no un vistazo
> Once personas se comprueban a ojo. Ciento veinte, no. **Escribe algo que las compruebe todas de una vez** y enséñalo funcionando: eso es exactamente lo que hacía el bucle de auditoría de la Fase 5 del Bloque 2, y aquí lo tienes que sacar tú.
>
> No hace falta que sea elegante. Hace falta que si mañana hay 120 alumnos, siga valiendo.

> [!example] 🤖 Y después, el verificador
> ```bash
> sudo ./verificar_ac1_proyecto.sh
> ```
> Hoy tienen que estar en verde sus bloques **`A`** y **`B`**. El resto seguirá marcado como pendiente, y es correcto.

---

## **4 · LABORATORIO DE AVERÍAS**

> [!danger] 🛑 Requisito: instantánea `AC1 · Fase 3 terminada` tomada
> Hoy más que nunca. Acabas de rehacer este apartado dos veces: no lo hagas una tercera por no tener punto de retorno.

---

### **AVERÍA 1 · El traductor al que nadie pregunta**

> [!bug] 🔨 Qué tienes que romper
> Deja el dominio intacto, con sus once personas, **y haz que el sistema operativo del servidor deje de preguntarle por los usuarios**. Un solo fichero, y sin parar ningún servicio.
>
> *(Copia del fichero antes de tocarlo. Siempre.)*

> [!question] 🤔 Predice antes de ejecutar
> 1. ¿Seguirán existiendo las once personas?
> 2. ¿Qué contestará el sistema si le preguntas por `laura.gimenez`? ¿Y las herramientas del dominio?
> 3. Si esto pasara en la Fase 5, con las carpetas ya montadas, **¿qué le pasaría a los permisos?**

**Lo que tienes que hacer tú:** enseñar la contradicción en pantalla —el dominio la ve, el sistema no— y **explicar de dónde sale**. Ese es el vídeo entero.

> [!success] 🎯 Lo que se te evalúa aquí
> Que entiendas que en este servidor hay **dos censos de personas** y un fichero que decide a cuál se pregunta. Cuando alguien te diga *"el usuario existe pero el sistema dice que no"*, esto tiene que ser lo primero que mires.

---

### **AVERÍA 2 · La persona sin número**

> [!bug] 🔨 Qué tienes que romper
> Da de alta a un alumno nuevo —llámalo `prueba.temporal`— **sin decirle qué número lleva**. Ni UID ni GID: solo el nombre y la contraseña.
>
> Y no lo metas en ningún grupo, para que se parezca lo más posible a un alta hecha con prisa.

> [!question] 🤔 Predice antes de ejecutar
> 1. ¿Dará algún error el alta?
> 2. ¿Podrá esa persona iniciar sesión?
> 3. Cuando en la Fase 5 des permisos al grupo de alumnos, **¿le alcanzarán a esta persona?**

**Lo que tienes que hacer tú:** comparar esta cuenta con una bien creada y **enseñar la diferencia en pantalla**. Luego decide qué haces con ella: repararla o borrarla. **Las dos opciones son válidas**, pero tienes que justificar cuál eliges y por qué.

> [!warning] ⚠️ No dejes a `prueba.temporal` viviendo en el dominio de la academia
> Sea cual sea tu decisión, al final del vídeo el dominio tiene que quedar **con once personas, ni una más**. Una cuenta de pruebas olvidada en un directorio es exactamente el tipo de cosa que un auditor te marca — y con razón: nadie sabe qué puede hacer.

> [!success] 🎯 Lo que se te evalúa aquí
> Que reconozcas **el fallo que no avisa**. Todo el apartado gira sobre esto: el sistema te deja hacerlo mal, no protesta, y el daño aparece dos apartados más tarde y con otra cara.
>
> Y que sepas que **limpiar lo que has ensuciado forma parte del trabajo**, no es un extra.

---

## **5 · PUNTO DE CONTROL**

Instantánea: **`AC1 · Fase 3 terminada`**, VM apagada.

```
SOR/Bloque_2/Proyecto_Academia/Fase 3/  B2-AC1-F3-las-personas.ova
```

> [!info] 🌳 Fíjate en cómo va quedando tu árbol de instantáneas
> ```
> Sistema base
>  └── AC1 · Fase 1 terminada
>       └── AC1 · Fase 2 terminada
>            └── AC1 · Fase 3 terminada
> ```
> Cada una cuelga de la anterior. **Hoy has usado ese árbol por primera vez**, así que ya sabes que restaurar hacia atrás no borra nada de lo que hay delante.
>
> Míralo en pantalla antes de cerrar el vídeo. En la Fase 4 vas a moverte por él otra vez.

### ✅ Antes de pasar a la Fase 4

- [ ] Los tres vídeos subidos, **con identificación**.
- [ ] 🔴 **La restauración del punto 2.5 grabada**, con las tres comprobaciones y el comentario de tiempos.
- [ ] Las once personas, con **sus** números, y ninguna de más.
- [ ] Los bloques `A` y `B` del verificador, en verde.
- [ ] Instantánea **`AC1 · Fase 3 terminada`** y **`B2-AC1-F3-las-personas.ova`** en el disco externo.

---

> [!summary] 🎓 Qué has demostrado en este apartado
> Que sabes convertir *"te paso la lista"* en un directorio de personas y colectivos, con una numeración pensada para crecer, y que entiendes que **el permiso se le da al grupo y la persona lo hereda**.
>
> Y algo que no va de usuarios: **que sabes volver atrás.** Has restaurado, has comprobado dónde estabas y has rehecho el trabajo. Eso, hasta hoy, no lo habías hecho nunca de verdad.
>
> **Siguiente:** [[Fase_4_AC1_El_Almacenamiento]] — ya hay gente en la academia. Ahora hace falta dónde poner sus cosas.
