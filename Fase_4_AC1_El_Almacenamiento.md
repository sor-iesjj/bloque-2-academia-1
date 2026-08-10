## Fase 4 · El almacenamiento

> **[Módulo: SOR — Sistemas Operativos en Red]** · **Proyecto Final del Bloque 2 · Boochan Academy**
> 🧭 Índice del proyecto: [[02_Indice_Proyecto]] · 🏫 El cliente: [[00_El_Cliente_Boochan_Academy]]
>
> **📦 Entrega:** tres vídeos · instantánea `AC1 · Fase 4 terminada` · copia `.ova`

---

> [!important] ✍️ Este apartado son TRES vídeos y lo que produzcas va a tu repositorio
> | | |
> | :--- | :--- |
> | 📹 **3 vídeos** | `B2 · AC1 · F4 · Implementación` / `· Verificación` / `· Averías`, en la playlist `B2_Academia_1` |
> | 📝 **1 entrada de apuntes** | `b2-ac1.4-el-almacenamiento.md` en `00_Apuntes/Trimestre_N/B2_Ubuntu_Local/`, con la estructura del **Bloque 0 · Fase 0.1.b** |
> | 💿 **Copias `.ova`** | A tu **disco externo**. Nunca a GitHub |
>
> **Identifícate al empezar cada vídeo** y pon **timestamps** en la descripción (`00:00 Presentación` y uno por paso). Los dos son corte duro en la rúbrica. Si algo de esto no lo tienes montado: **[[01_ANTES_DE_EMPEZAR]]**.

## **1 · EL ENCARGO**

> [!quote] 🗣️ Lo que te dice el cliente
> *"Ahora hace falta dónde guardar las cosas. Los apuntes, los exámenes, lo de secretaría, las prácticas que entregan y la carpeta de cada alumno. Y te aviso de una: los chavales se bajan de todo. El disco del aula 2 se llenó en un mes con vídeos que no eran ni de clase. Lo que no puede pasar es que por culpa de eso me quede sin sitio para los recibos de secretaría, que eso sí que es serio."*

> [!info] 🎯 Lo que ha pedido de verdad, traducido
> - **Cinco espacios** con dueños distintos: material, entregas, exámenes, secretaría y la carpeta personal de cada alumno.
> - Que **lo que se descontrola no arrastre a lo que importa.** Esa es la frase clave del encargo y no habla de permisos: habla de **dónde pones cada cosa**.
> - Y algo implícito: si el sitio de los alumnos se llena, **tiene que llenarse solo él**.

> [!danger] 🛑 Este apartado NO va de permisos. Ese es la Fase 5
> Aquí decides **dónde vive cada cosa y de quién es**. La política de quién entra dónde viene después.
>
> Se hacen en este orden y no al revés por un motivo muy práctico: **no puedes dar permisos sobre una carpeta que no existe**, y si montas un disco encima de una carpeta a la que ya diste permisos, **te los tapa**. Eso lo vas a ver hoy en una avería.

> [!question] 🤔 La decisión de diseño de este apartado
> El cliente te ha dado el problema y no la solución: *"que los vídeos de los chavales no me dejen sin sitio para los recibos"*.
>
> **¿Cómo consigues que un espacio que se descontrola no se lleve por delante a los demás?** Piénsalo antes de leer nada. La respuesta la tienes en la Fase 6 del Bloque 2 y no es "poner una cuota por usuario": es más sencillo y más contundente.

---

## **2 · IMPLEMENTACIÓN**

> [!example] 🎬 Antes de empezar
> 1. Léete el apartado entero, **incluido el punto 2.5**.
> 2. Ten delante el punto 5 de [[00_El_Cliente_Boochan_Academy]].
> 3. **Arranca la grabación e identifícate.**

**Lo que tiene que existir al final de este apartado:**

- [ ] **Dos espacios de almacenamiento independientes**, de forma que llenar uno **no** afecte al otro:
  - uno para lo de la academia: `material`, `entregas`, `examenes` y `secretaria`;
  - otro **solo** para las carpetas personales del alumnado.
- [ ] Los dos **se montan solos al arrancar**. Sin que tú entres a montarlos.
- [ ] Las **cuatro carpetas de la academia** creadas, **cada una a nombre del colectivo al que pertenece** según la ficha del cliente.
- [ ] Una **carpeta personal por cada alumno**, con su nombre de usuario, **y que sea suya**.
- [ ] Lo que se cree dentro de una carpeta de la academia **hereda a qué colectivo pertenece**, en vez de quedarse a nombre de quien lo creó.
- [ ] En `entregas`, **nadie puede borrar lo que ha dejado otro**.

> [!warning] ⚠️ Los dos últimos puntos son mecanismos concretos, no buenas intenciones
> No se consiguen "teniendo cuidado". Hay **dos bits de permisos** que hacen exactamente esas dos cosas, los usaste los dos en la Fase 6 del Bloque 2 y hoy tienes que decidir tú **cuál va en cada sitio**.
>
> Si no te acuerdas de cómo se llaman: uno hace que el grupo se herede, el otro hace que solo el dueño pueda borrar. **Los dos son el cuarto dígito.**

> [!danger] 🛑 El error nº1 de este apartado: dar permisos y montar después
> Si creas una carpeta, la configuras, y **después** montas un disco encima, todo tu trabajo desaparece de la vista. No se borra: se queda **debajo**, tapado, esperando a que alguien desmonte.
>
> Es el fallo más desconcertante de la Fase 6 del Bloque 2 y aquí lo tienes servido, porque las carpetas personales de los alumnos van dentro de un punto de montaje.
>
> **Piensa el orden antes de empezar.** Primero se monta, luego se llena.

> [!warning] ⚠️ Cuidado con el tamaño de los discos
> Tu servidor tiene el disco que le pusiste en la Fase 1. Si te pasas pidiendo, la creación fallará **a mitad**, dejándote un fichero incompleto que además ocupa sitio.
>
> **Mira cuánto tienes libre antes de crear nada.** Y decide los tamaños con criterio: en el punto 2.5 vas a comprobar de dónde salen.

> [!question] 🤔 Para decir en voz alta en el vídeo
> 1. **¿Por qué dos espacios y no cinco?** Uno por carpeta sería más aislado todavía. Defiende tu número.
> 2. La carpeta personal de un alumno es **suya**. Pero los profesores tienen que entrar en todas. **¿Eso lo resuelves hoy o en la Fase 5?** Justifícalo.
> 3. **¿Qué pasa el día que se llene el espacio de los alumnos?** Descríbelo: qué deja de funcionar, qué sigue funcionando y a quién llaman.

---

## **2.5 · 🕰️ VUELVE A MIRAR CÓMO ESTABA LA MÁQUINA ANTES**

> [!info] 🎯 Qué vas a hacer, y por qué no es un capricho
> Antes de decidir el tamaño de los discos, quieres saber **cuánto espacio tenía el servidor recién instalado**, antes de que el dominio ocupara lo suyo. Eso no lo puedes ver ahora: la máquina de hoy ya no es aquella.
>
> **Pero la tienes guardada.** Y saber ir a buscarla, mirar, y volver, es exactamente lo que separa a alguien que crea instantáneas de alguien que las usa.

**Los cuatro pasos, y van grabados en el vídeo de implementación:**

1. **Mira el árbol** de instantáneas de la VM y enséñalo en pantalla. Localiza `AC1 · Fase 1 terminada`.
2. **Restaura `AC1 · Fase 1 terminada`.** No la última: **esa**.
3. **Trabaja sobre ella:** arranca, mira cuánto espacio libre tenía el sistema en ese momento y anótalo en pantalla. Y **toma ahí una instantánea nueva** llamada `Medicion de espacio`.
4. **Vuelve a `AC1 · Fase 3 terminada`** y sigue con el apartado.

> [!question] 🤔 Antes de tocar nada, contesta en voz alta
> 1. Al restaurar `AC1 · Fase 1 terminada`, ¿desaparecen `AC1 · Fase 2 terminada` y `AC1 · Fase 3 terminada`?
> 2. Cuando tomes `Medicion de espacio` colgando de `Fase 1`, **¿qué forma va a tener el árbol?**
> 3. ¿Podrás volver a `AC1 · Fase 3 terminada` después? ¿Por qué?

> [!important] ✍️ Al volver, enseña el árbol otra vez
> Tiene que verse **una rama nueva**:
> ```
> Sistema base
>  └── AC1 · Fase 1 terminada
>       ├── AC1 · Fase 2 terminada
>       │    └── AC1 · Fase 3 terminada        ← aquí estás
>       └── Medicion de espacio        ← la rama que acabas de crear
> ```
> Y ahora **decide qué haces con esa rama**: la conservas o la borras. En el vídeo, di cuál eliges y **por qué**.
>
> *(No hay respuesta única. Hay respuestas justificadas y respuestas dichas a boleo.)*

> [!success] 🎯 Por qué te hago esto
> Porque un árbol de instantáneas **no es una pila**. No solo se va hacia atrás y hacia delante: **se puede ir a un punto concreto, trabajar allí y volver**, dejando dos historias paralelas de la misma máquina.
>
> Eso es lo que hace un técnico cuando quiere probar algo peligroso sin tocar la línea buena. Y el día que lo necesites de verdad, **no es el día de aprender a hacerlo.**

---

## **3 · VERIFICACIÓN**

> [!danger] 🛑 Las pruebas las decides tú

| # | Tiene que quedar demostrado | La trampa |
| :--- | :--- | :--- |
| 1 | Que hay **dos espacios independientes** y que están montados donde toca | Que la carpeta exista no significa que haya un disco detrás |
| 2 | Que **se montan solos al arrancar** | Y esta prueba solo se hace de una manera |
| 3 | Que cada carpeta de la academia **pertenece a quien debe** | Un comando puede no protestar y no haber hecho lo que querías |
| 4 | Que cada alumno tiene **su** carpeta y es suya | Seis carpetas, seis dueños distintos. Compruébalas de una vez |
| 5 | Que la herencia de colectivo **funciona de verdad** | No mires la configuración: crea un fichero y mira qué sale |
| 6 | Que en `entregas` **nadie borra lo de otro** | Esto se demuestra intentándolo, no leyendo permisos |
| 7 | Que llenar el espacio de alumnos **no toca al otro** | Se puede demostrar sin llenarlo del todo. Piensa cómo |

> [!danger] 🛑 La 2 tiene un riesgo real y por eso se hace ahora
> El fichero que hace que los discos se monten solos es **de los poquísimos de Linux donde una errata impide arrancar el sistema**. Si te has equivocado, la máquina no arranca y se queda en modo emergencia.
>
> Hay una forma de **ensayar el arranque sin arrancar**. La usaste en la Fase 6 del Bloque 2 y hoy es tuya acordarte. **Si no la usas y reinicias a ciegas, es cuestión de suerte** — y tienes una instantánea que probablemente no cubra este trozo.

> [!tip] 💡 Las pruebas 5 y 6 son las buenas
> Las cuatro primeras miran **cómo está configurado**. Estas dos miran **qué hace**. Un permiso escrito y un permiso que funciona no son lo mismo — es la idea que arrastras desde la Fase 7 del Bloque 2.
>
> Para la 6 necesitas actuar **como dos personas distintas**. Se puede hacer desde el servidor sin tocar Windows: en la Fase 6 del Bloque 2 lo hiciste.

> [!example] 🤖 Y después, el verificador
> ```bash
> sudo ./verificar_ac1_proyecto.sh
> ```
> Hoy tienen que estar en verde los bloques **`A`**, **`B`** y **`C`**.

---

## **4 · LABORATORIO DE AVERÍAS**

> [!danger] 🛑 Requisito: instantánea `AC1 · Fase 4 terminada` tomada
> Y hoy va en serio: **la avería 2 puede dejar la máquina sin arrancar** si la manejas mal. Ese es justamente el ejercicio.

---

### **AVERÍA 1 · La carpeta que pierde a su dueño**

> [!bug] 🔨 Qué tienes que romper
> Antes de nada, **anota en pantalla a quién pertenece ahora** la carpeta `secretaria`.
>
> Y ahora haz que **deje de pertenecer a su colectivo** y pase a ser de `root`. Solo eso: no toques los permisos ni el contenido.

> [!question] 🤔 Predice antes de ejecutar
> 1. ¿Dará algún error el cambio?
> 2. ¿Cambiará algo en la pantalla si listas la carpeta con prisa?
> 3. ¿Podrá `pilar.quiles` seguir trabajando ahí?

**Lo que tienes que hacer tú:** diagnosticarlo **partiendo del síntoma que reportaría el usuario**, no de lo que acabas de teclear. Enseña en el vídeo qué comprobación te lo destapa y **por qué el listado normal casi no cambia**.

> [!success] 🎯 Lo que se te evalúa aquí
> Que sepas que **un comando que no protesta no ha hecho necesariamente lo que querías**, y que en este proyecto el dueño de una carpeta no es un adorno: es la mitad de la protección.
>
> Y una cosa más, que es la que hace peligrosa esta avería: **también ocurre sola**. Si el dominio no está en pie cuando asignas el dueño, el sistema no encuentra el colectivo y la carpeta se queda a nombre de `root` **sin que nadie te avise**.

---

### **AVERÍA 2 · El fichero que impide arrancar**

> [!bug] 🔨 Qué tienes que romper
> Haz una copia del fichero que monta los discos al arrancar. **En serio: la copia primero.**
>
> Y ahora **quítale a una de las dos líneas la palabra que le dice al sistema que ahí no hay un disco físico, sino un fichero haciendo de disco.** Una palabra. Nada más.

> [!question] 🤔 Predice antes de ejecutar
> 1. ¿Se dará cuenta el sistema en el momento?
> 2. Si reiniciaras ahora mismo, ¿qué pasaría?
> 3. ¿Hay alguna forma de saberlo **sin** reiniciar?

> [!danger] 🛑 NO reinicies con el fichero roto. El ejercicio es el contrario
> Lo que tienes que demostrar es que **sabes detectarlo antes**. Hay un comando que ensaya el montaje entero sin arrancar la máquina, y ese es todo el aprendizaje de esta avería.
>
> Si reinicias y te quedas en modo emergencia, el vídeo se convierte en otra cosa: en cómo salir de ahí. **Que también es aprendizaje**, pero no es este, y te va a costar media tarde.

**Lo que tienes que hacer tú:** provocar el fallo, **detectarlo con el ensayo**, interpretar el mensaje exacto que sale y repararlo. En el vídeo tiene que oírse la diferencia entre un aviso y un error: **el fichero produce los dos tipos** según qué le hagas.

> [!success] 🎯 Lo que se te evalúa aquí
> El reflejo del validador. **Antes de reiniciar un servicio o una máquina por un fichero que acabas de tocar, se valida.** Lo viste con el montaje en la Fase 6 del Bloque 2 y con la configuración de Samba en la Fase 7 del Bloque 2, y lo vas a ver toda tu vida profesional con otros nombres.
>
> **Un sistema que arranca bien hoy no demuestra que su configuración de arranque sea válida.** Solo que todavía no la ha vuelto a leer.

---

## **5 · PUNTO DE CONTROL**

> [!danger] 🛑 Antes de apagar: el ensayo de montaje en silencio
> Si el fichero de arranque tiene una errata, **apagar la máquina no guarda un fallo: guarda una máquina que no vuelve a encender**.

Instantánea: **`AC1 · Fase 4 terminada`**, VM apagada de verdad.

> [!important] 🔴 Y después de tomarla, enciende y comprueba que arranca
> Con los dos discos montados **sin que hayas tocado nada**. Esa es la prueba real del apartado, y ahora la puedes hacer sin miedo: tienes la instantánea justo antes.

```
SOR/Bloque_2/Proyecto_Academia/Fase 4/  B2-AC1-F4-el-almacenamiento.ova
```

> [!warning] ⏱️ Esta exportación tarda más que las anteriores
> Acabas de meter varios gigas de discos virtuales dentro de la máquina. Aunque estén casi vacíos, hay más que empaquetar.
>
> Arranca la exportación grabando, pausa mientras trabaja y reanuda para enseñar **el fichero ya creado en el disco externo, con su tamaño**.

### ✅ Antes de pasar a la Fase 5

- [ ] Los tres vídeos subidos, **con identificación**.
- [ ] 🔴 **El viaje a `AC1 · Fase 1 terminada` grabado**, con el árbol antes y después y tu decisión sobre la rama.
- [ ] Los dos espacios montados **solos** tras un arranque real.
- [ ] Las cuatro carpetas de la academia y las seis personales, cada una de quien debe.
- [ ] Bloques `A`, `B` y `C` del verificador en verde.
- [ ] Instantánea **`AC1 · Fase 4 terminada`** y **`B2-AC1-F4-el-almacenamiento.ova`** comprobados.

---

> [!summary] 🎓 Qué has demostrado en este apartado
> Que sabes traducir *"que los vídeos de los chavales no me dejen sin sitio para los recibos"* en una decisión de diseño —**aislar lo que se puede descontrolar**— y no en una regla de buena conducta.
>
> Que dominas los dos bits que hacen el trabajo silencioso: **el que hereda el colectivo y el que impide borrar lo ajeno.**
>
> Y que sabes moverte por el árbol de instantáneas: ir a un punto concreto, trabajar allí y volver, **sin perder la línea buena**.
>
> **Siguiente:** [[Fase_5_AC1_La_Politica_de_Acceso]] — las carpetas existen. Ahora toca decidir quién entra dónde, que es lo que el cliente compró de verdad.
