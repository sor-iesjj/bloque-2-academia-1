## Fase 5 · La política de acceso

> **[Módulo: SOR — Sistemas Operativos en Red]** · **Proyecto Final del Bloque 2 · Boochan Academy**
> 🧭 Índice del proyecto: [[02_Indice_Proyecto]] · 🏫 El cliente: [[00_El_Cliente_Boochan_Academy]]
>
> **📦 Entrega:** tres vídeos · instantánea `AC1 · Fase 5 terminada` · copia `.ova`

---

> [!danger] 🛑 Este es el apartado central del proyecto. Léelo entero antes de tocar nada
> Aquí es donde se cumple —o no— lo que el cliente compró. Los cuatro apartados anteriores eran la infraestructura; **este es el producto.**
>
> También es el más largo y el que más se suspende. Reserva una sesión entera.

---

> [!important] ✍️ Este apartado son TRES vídeos y lo que produzcas va a tu repositorio
> | | |
> | :--- | :--- |
> | 📹 **3 vídeos** | `B2 · AC1 · F5 · Implementación` / `· Verificación` / `· Averías`, en la playlist `B2_Academia_1` |
> | 📝 **1 entrada de apuntes** | `b2-ac1.5-la-politica-de-acceso.md` en `00_Apuntes/Trimestre_N/B2_Ubuntu_Local/`, con la estructura del **Bloque 0 · Fase 0.1.b** |
> | 💿 **Copias `.ova`** | A tu **disco externo**. Nunca a GitHub |
>
> **Identifícate al empezar cada vídeo** y pon **timestamps** en la descripción (`00:00 Presentación` y uno por paso). Los dos son corte duro en la rúbrica. Si algo de esto no lo tienes montado: **[[01_ANTES_DE_EMPEZAR]]**.

## **1 · EL ENCARGO**

> [!quote] 🗣️ Lo que te dice el cliente
> *"Vale, ya está todo montado. Ahora lo importante: los apuntes los subimos nosotros y ellos solo leen, que si no me acaban editando el guion de la práctica. Las prácticas que las dejen en su sitio pero sin cotillear lo del compañero, que el año pasado tuvimos dos entregas calcadas. Los exámenes, ni tocarlos ni verlos: si ven una carpeta que pone exámenes ya están dándole vueltas. Y lo de secretaría lo llevamos Pilar y yo, ahí no entra nadie más, ni los profesores. Que conste que no es desconfianza, es que ahí hay datos de las familias."*

> [!info] 🎯 Lo que ha pedido de verdad, traducido
> Te acaba de dictar **cuatro reglas distintas**, y cada una necesita un mecanismo diferente:
>
> | Lo que dijo | Lo que significa técnicamente |
> | :--- | :--- |
> | *"ellos solo leen"* | Un colectivo con **lectura** sobre una carpeta que es de otro |
> | *"sin cotillear lo del compañero"* | Poder **dejar** un fichero sin poder **listar** ni **borrar** lo que hay |
> | *"ni tocarlos ni verlos"* | Denegar el acceso **y** ocultar que la carpeta existe |
> | *"ahí no entra nadie más"* | Una **isla**: sin cruces de ningún tipo |
>
> **La matriz completa, con la justificación de cada casilla, está en el punto 6 de [[00_El_Cliente_Boochan_Academy]].** Ténla abierta todo el apartado. No la reconstruyas de memoria: son cinco carpetas y tres colectivos, y es facilísimo dar un permiso de más.

> [!danger] 🛑 Un permiso de MÁS es peor que uno de menos
> **El de menos se nota enseguida:** alguien no puede trabajar, te llama, lo arreglas en dos minutos.
>
> **El de más no lo nota nadie.** Nadie llama para decir *"oye, puedo entrar donde no debería"*. Se descubre el día que alguien lee lo que no tenía que leer — o no se descubre nunca.
>
> Cuando verifiques, comprueba las dos cosas: **lo que tiene que estar y lo que NO puede estar.**

---

## **2 · IMPLEMENTACIÓN**

> [!example] 🎬 Antes de empezar
> 1. Léete el apartado entero.
> 2. Ten abierta la **matriz** del punto 6 de la ficha del cliente. Si no sabes **por qué** un profesor no entra en secretaría, no sabes qué estás haciendo.
> 3. **Arranca la grabación e identifícate.**

**Lo que tiene que existir al final de este apartado:**

- [ ] La **matriz de permisos completa**, aplicada carpeta por carpeta.
- [ ] Los profesores llegan a **todas** las carpetas personales del alumnado.
- [ ] Ningún alumno llega a la carpeta de otro alumno.
- [ ] `material`: los profesores escriben, el alumnado **solo lee**.
- [ ] `entregas` funciona **como un buzón**: el alumnado deposita, **no lista y no borra**. Los profesores recogen.
- [ ] `examenes` y `secretaria` son **islas**, y además **no aparecen** en el listado de red de quien no tiene acceso.
- [ ] **Todo lo anterior se aplica también a lo que se cree mañana**, no solo a lo que existe hoy.
- [ ] Las carpetas están **publicadas en la red** para que los equipos de aula lleguen a ellas.
- [ ] La configuración de publicación **está validada antes de aplicarse**.

> [!warning] ⚠️ Los permisos clásicos no llegan, y tienes que decir por qué en el vídeo
> Una carpeta clásica de Unix tiene **un dueño y un grupo**. Punto. En cuanto necesitas que **dos colectivos distintos** tengan **niveles distintos** sobre la misma carpeta —y aquí lo necesitas en varias— se te acaba la herramienta.
>
> Lo que la sustituye lo montaste en la Fase 7 del Bloque 2. **Y lleva una trampa fina que anula permisos sin borrarlos**: si no la conoces, vas a ver un permiso escrito, correcto y que no funciona.

> [!danger] 🛑 `entregas` es el punto difícil del apartado. Piénsalo despacio
> "Depositar sin poder listar" **no es un permiso normal**. Un alumno tiene que poder **crear** un fichero dentro y **no poder ver** qué más hay.
>
> Los permisos de Unix distinguen tres cosas donde mucha gente ve una sola: **leer** una carpeta no es lo mismo que **entrar** en ella, y ninguna de las dos es **escribir**. Si nunca te has parado a pensar qué significa cada letra **en un directorio**, hoy es el día.
>
> Y encima hace falta que **nadie borre lo de otro**, que es un mecanismo aparte y ya lo pusiste en la Fase 4.
>
> **Pista honesta:** es el mismo diseño que el buzón de tu portal, y existe en Unix desde hace cuarenta años con ese nombre. Búscalo por ahí.

> [!warning] ⚠️ Y lo que se cree mañana
> Un permiso puesto a mano funciona **una vez**. Los ficheros y carpetas que se creen a partir de ahora **no lo llevan** salvo que digas expresamente que se hereda.
>
> Es un fallo que **no afecta a nada de lo que existe hoy** y que puede tardar semanas en notarse: los ficheros antiguos accesibles, los nuevos no, sobre la misma carpeta y el mismo colectivo. Si te suena a incidencia imposible de diagnosticar, es porque lo es.

> [!question] 🤔 Para decir en voz alta en el vídeo
> 1. **¿Por qué `material` no puede resolverse simplemente poniéndola "de todos"?** Explica qué pasaría en dos semanas.
> 2. **¿Qué diferencia hay entre no poder abrir una carpeta y que la carpeta no aparezca?** Y la de verdad: **¿por qué le importa tanto al cliente la segunda?**
> 3. Un profesor entra en la carpeta de todos los alumnos. **¿Se lo has dado carpeta por carpeta o de una vez?** Si es carpeta por carpeta, ¿qué vas a hacer cuando haya 120?
> 4. **¿Por qué secretaría no tiene ningún cruce, siendo el profesorado "de más nivel"?** Contesta con el principio que lo sostiene, no con *"porque lo pidió el cliente"*.

---

## **3 · VERIFICACIÓN**

> [!danger] 🛑 Este apartado no se puede verificar entero desde el servidor. Y hay que decirlo
> La mitad de lo que has hecho hoy —**que una carpeta sea invisible**— solo se ve desde el listado de red de un equipo Windows. Y eso es el **Fase 6**.
>
> Desde el servidor, una carpeta bien ocultada y una a medias **se comportan exactamente igual**.
>
> **No confundas "el servidor está bien configurado" con "la protección funciona".** Lo que no puedas comprobar hoy, **lo dejas anotado como pendiente** y lo tachas en la Fase 6. Una verificación que da por hecho lo que no ha probado no es una verificación.

| # | Tiene que quedar demostrado | La trampa |
| :--- | :--- | :--- |
| 1 | Que **cada casilla con acceso** de la matriz está puesta | Ve casilla por casilla contra la tabla. De memoria, no |
| 2 | 🔴 Que **las casillas vacías siguen vacías** | Nadie te va a reportar un permiso de más |
| 3 | Que ningún permiso está **escrito pero recortado** | Esto tiene un nombre y sale en una columna que casi nadie mira |
| 4 | Que la herencia funciona | No leas la configuración: **crea un fichero y mira qué le sale puesto** |
| 5 | Que `entregas` deja depositar y **no deja listar** | Pruébalo actuando como un alumno, no mirando permisos |
| 6 | Que un alumno **no entra** en la carpeta de otro | Igual: intentándolo |
| 7 | Que la configuración de publicación **es válida** | Y esto se comprueba **antes** de reiniciar nada, no después |
| 8 | Que el dominio **sigue vivo** después de tocar esa configuración | Reiniciar ese servicio a ciegas no te tumba las carpetas: te tumba el dominio |

> [!danger] 🛑 La 8 no es un adorno
> El servicio que publica las carpetas **es el mismo que sostiene el dominio**. Si lo reinicias con una errata en su configuración, se lleva por delante el servicio de nombres, la autenticación y el directorio. **El servidor seguirá encendido y la academia habrá dejado de existir.**
>
> Por eso la 7 va antes que la 8. Es el mismo reflejo del validador de la Fase 4, con otro fichero.

> [!tip] 💡 Cómo se hacen las pruebas 5 y 6 sin tener Windows todavía
> Actuando **como otra persona** desde el propio servidor. Lo hiciste en las fases 6 y 7 y es la única forma de probar un permiso de verdad: **un permiso no se lee, se intenta.**

> [!example] 🤖 Y después de haberlo comprobado tú, el verificador
> ```bash
> sudo ./verificar_ac1_proyecto.sh
> ```
> Hoy tienen que estar en verde los bloques **`A`** a **`F`**. El bloque `D` es el que compara **casilla por casilla** con la matriz, y el `E` el que busca **lo que sobra**.
>
> > [!question] 🤔 Para el vídeo
> > 1. El script lleva la matriz escrita dentro, en dos listas: lo que debe existir y lo que no. **¿Por qué comprueba también lo que NO debe existir?**
> > 2. Di **dos comprobaciones que hace y que tú no habías hecho a mano**.
> > 3. La difícil: **el script dice que hay algo que no puede comprobar. ¿Qué es y por qué no puede?**

> [!important] ✍️ Anota las pruebas que quedan pendientes para la Fase 6
> - [ ] Un alumno **no ve** `examenes` en el listado de red.
> - [ ] Un profesor **no ve** `secretaria` en el listado de red.
> - [ ] Un alumno **no lista** el contenido de `entregas` aunque acabe de dejar ahí su práctica.
> - [ ] Un alumno **no abre** la carpeta personal de otro alumno.

---

## **4 · LABORATORIO DE AVERÍAS**

> [!danger] 🛑 Requisito: instantánea `AC1 · Fase 5 terminada` tomada
> Y esta vez compruébalo de verdad, mirando la lista. En el punto 5 vas a necesitar que tus copias sean reales.

> [!info] 🎓 Por qué se rompe algo que funciona
> La seguridad tiene una propiedad incómoda: **cuando está mal puesta se comporta igual que cuando está bien puesta**, hasta que aparece alguien que no debía entrar y entra.
>
> Ninguna de las dos averías de hoy da un error. **Vas a provocarlas para aprender a reconocerlas**, porque en la academia nadie te va a avisar.

---

### **AVERÍA 1 · El permiso que sobra**

> [!bug] 🔨 Qué tienes que romper
> Dale al colectivo de **profesores** acceso de lectura a la carpeta de **secretaría**. Un permiso que **no está en la matriz**.
>
> Y hazlo bien hecho: con su herencia y todo, como si te lo hubiera pedido alguien por el pasillo y no te hubieras parado a mirar la tabla.

> [!question] 🤔 Predice antes de ejecutar
> 1. ¿Se quejará el sistema al dar un permiso que no está en la política?
> 2. ¿Notará algo `pilar.quiles`, que trabaja en secretaría?
> 3. ¿Lo detectará el verificador? **¿Cómo podría saber que ese permiso sobra?**

**Lo que tienes que hacer tú:** comprobar que efectivamente un profesor entra donde no debe, detectarlo, repararlo y —esto es lo importante— **contestar en el vídeo a esta pregunta**:

> [!important] ✍️ La pregunta de esta avería
> **¿Cómo detectarías este fallo en un servidor que no fuera tuyo, sin tener la matriz delante?**
>
> Piénsalo antes de contestar. *(Y si tu respuesta es "no podría", es la correcta: solo podrías listar quién accede a qué y preguntarle a alguien si eso es lo que tiene que ser.)*

> [!success] 🎯 Lo que se te evalúa aquí
> Que entiendas que **el sistema aplica permisos, no juzga políticas**. La herramienta hace exactamente lo que le pides, y lo que le pides puede ser un disparate.
>
> Y de ahí sale la idea más importante del proyecto: **una política de permisos tiene que estar escrita fuera del sistema** —en un documento como [[00_El_Cliente_Boochan_Academy]]— para poder comparar lo que hay contra lo que debería haber.
>
> Sin ese documento, la única respuesta honesta a *"¿están bien los permisos de este servidor?"* es **"no lo sé"**.

---

### **AVERÍA 2 · El permiso escrito que no se aplica**

> [!bug] 🔨 Qué tienes que romper
> En `material`, **baja el techo de la lista de permisos** hasta dejarlo en solo lectura. No borres el permiso del alumnado: déjalo escrito tal cual está.

> [!question] 🤔 Predice antes de ejecutar
> 1. ¿Seguirá apareciendo el permiso del colectivo cuando mires la lista?
> 2. ¿Podrá escribir alguien del profesorado?
> 3. ¿Qué crees que va a cambiar exactamente en la salida?

**Lo que tienes que hacer tú:** mirar la lista de permisos **hasta el final de cada línea**. Ahí está la respuesta, en una columna que casi nadie lee.

> [!important] ✍️ Copia esa línea completa y enséñala en el vídeo
> Y contesta: si un compañero te enseña esa salida diciendo *"el permiso está puesto y no funciona"*, **¿qué le dices en diez segundos?**

> [!success] 🎯 Lo que se te evalúa aquí
> **Lo que está escrito y lo que se aplica pueden ser cosas distintas.** Es la versión más pura de una idea que arrastras desde la Fase 2, y aquí ni siquiera hace falta equivocarse al escribir: basta con **leer mal una salida**.
>
> La regla práctica que te llevas: **cuando una salida trae una columna que no entiendes, entiéndela.** Lleva ahí todo el curso esperando a que alguien la mire.

---

## **5 · PUNTO DE CONTROL**

Instantánea: **`AC1 · Fase 5 terminada`**, VM apagada de verdad.

```
SOR/Bloque_2/Proyecto_Academia/Fase 5/  B2-AC1-F5-la-politica-de-acceso.ova
```

> [!important] 🔴 Comprueba la exportación ANTES de seguir leyendo
> Que el fichero está en el disco externo. Que pesa lo que tiene que pesar. Que no se quedó a medias porque cerraste la tapa del portátil.
>
> **Hoy hace falta que sea verdad.**

---

### **5.5 · 💥 LA CATÁSTROFE**

> [!danger] 🛑 Lee este bloque entero antes de hacer nada. Se graba en el vídeo de averías
> Es sábado. En la academia han estado moviendo mesas, alguien ha desenchufado cosas y el equipo que alojaba tu servidor **se ha formateado**. Cuando llegas el lunes, en VirtualBox **no hay ninguna máquina**: ni el servidor, ni sus instantáneas, ni nada.
>
> Lo que tienes en la mano es **lo que te llevaste fuera**.

> [!danger] 🛑 ANTES DE NADA: comprueba que tienes el `.ova` y que pesa lo que debe
> ```
> ls -lh <tu_disco>/SOR/Academia/Fase 5/
> ```
> **Si ese fichero no está o pesa 0, PARA AQUÍ y no borres nada.** Estás a punto de destruir la única copia que te queda.
>
> Esto no es una formalidad: es el paso que separa una prueba de recuperación de una pérdida de datos real.

**Lo que tienes que hacer, en este orden:**

1. **Enseña en pantalla lo que tienes:** la VM y su árbol de instantáneas completo.
2. **Apaga la máquina** y **elimínala de VirtualBox eligiendo `Eliminar todos los archivos`.**
3. **Enseña VirtualBox otra vez:** sin la máquina. **No hay nada que restaurar.**
4. **Recupera el servidor importando tu copia `.ova`** del disco externo.
5. **Comprueba que estás donde dices estar.** El dominio, las once personas, las carpetas, la matriz. **Pasa el verificador.**
6. **Toma una instantánea nueva** en la máquina recuperada y déjala como punto de partida de la Fase 6.

> [!danger] 🛑 Por qué se elimina la MÁQUINA y no solo las instantáneas
> Podrías pensar que basta con borrar las instantáneas. **No sirve, y conviene que entiendas por qué:**
>
> **Al eliminar una instantánea, VirtualBox no tira su contenido: lo FUSIONA con el estado actual.** La máquina sigue encendiéndose exactamente igual. Lo único que pierdes es la **posibilidad de volver atrás**.
>
> Si el ejercicio se quedara ahí, la respuesta a *"¿qué has perdido?"* sería **"nada"** — y no habrías probado tu copia de seguridad, que es de lo que va esto.
>
> **Por eso la catástrofe es de verdad:** se va la máquina entera. Y entonces el `.ova` no es una comodidad, es **lo único que hay**.

> [!question] 🤔 Antes de borrar nada, contesta en voz alta
> 1. Si solo borraras las instantáneas y dejaras la máquina, **¿qué habrías perdido exactamente?**
> 2. Y eliminando la máquina entera, **¿qué pierdes que el `.ova` NO te devuelve?** *(Piensa en todo lo que hiciste después de exportar.)*
> 3. La máquina importada, **¿es la misma máquina?** ¿Qué le puede haber cambiado?
> 4. ¿Va a tener la dirección `172.20.10.5`? ¿Y las tarjetas de red conectadas a lo mismo?
> 5. Cuando importes, ¿qué crees que va a pasar con el reloj de esa máquina?

> [!warning] ⚠️ Cosas que se rompen al importar y que tienes que mirar, no suponer
> - **La configuración de red de la VM importada** puede no apuntar a la misma red del laboratorio. Compruébalo antes de arrancar.
> - **El reloj** vendrá de cuando exportaste. Con Kerberos en la máquina, un desfase de más de cinco minutos **tumba la autenticación entera** y el error no te habla del reloj.
> - **Si dejas la VM vieja y la nueva encendidas a la vez**, tienes dos máquinas con la misma dirección en la misma red. Piensa qué pasa. *(Y piensa si quieres verlo.)*

> [!success] 🎯 Por qué te hago esto
> Porque llevas cinco apartados exportando ficheros `.ova` a un disco externo **sin haber comprobado ni una vez que sirven para algo**. Una copia de seguridad que nunca se ha restaurado no es una copia de seguridad: **es una carpeta que ocupa sitio**.
>
> Y porque hay una diferencia que solo se entiende pasando por aquí:
>
> | | **Instantánea** | **Copia exportada** |
> | :--- | :--- | :--- |
> | Dónde vive | **Dentro** de VirtualBox | **Fuera**, en tu disco |
> | De qué te salva | De un cambio que salió mal | De perder el programa, el equipo o el disco |
> | Cuánto tardas en volver | Segundos | Bastante más |
> | Si el equipo del aula se formatea | **Se va con él** | **Sigue ahí** |
>
> **No son dos formas de lo mismo.** Son dos cosas distintas que protegen de dos desastres distintos, y por eso llevas haciendo las dos desde la Fase 1.

> [!important] ✍️ Al terminar, en el vídeo
> Di **cuánto has tardado** en volver a estar operativo, y contesta a esto: **si esto pasa de verdad en la academia un lunes a las 16:00, ¿aguanta tu plan de copias?** Si la respuesta es no, di qué cambiarías.

---

### ✅ Antes de pasar a la Fase 6

- [ ] Los tres vídeos subidos, **con identificación**.
- [ ] La matriz aplicada, **y las casillas vacías comprobadas como vacías**.
- [ ] Las cuatro pruebas pendientes **anotadas** para la Fase 6.
- [ ] Bloques `A` a `F` del verificador en verde.
- [ ] 🔴 **La catástrofe grabada entera**: `.ova` comprobado → VM eliminada con sus ficheros → VirtualBox vacío → importación → verificación.
- [ ] Una instantánea nueva sobre la máquina recuperada, para arrancar la Fase 6.
- [ ] Y la copia `.ova` de la Fase 5 **sigue en el disco externo** *(no la muevas: te ha salvado hoy y puede volver a hacerlo)*.

---

> [!summary] 🎓 Qué has demostrado en este apartado
> Que sabes convertir cuatro frases de un cliente en una **política de acceso** con mecanismos distintos para cada una: lectura cruzada, buzón, isla e invisibilidad. Y que sabes comprobar **lo que sobra**, no solo lo que falta.
>
> Que **lo escrito y lo aplicado pueden no coincidir**, y dónde se mira.
>
> Y lo más importante del día, que no va de permisos: **que tus copias de seguridad funcionan.** Ahora lo sabes porque lo has hecho, no porque lo suponías.
>
> **Siguiente:** [[Fase_6_AC1_Los_Equipos_de_las_Aulas]] — el servidor está listo. Es hora de que alguien se siente en un aula.
