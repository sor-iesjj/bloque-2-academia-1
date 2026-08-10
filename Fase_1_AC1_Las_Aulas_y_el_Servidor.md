## Fase 1 · Las aulas y el servidor

> **[Módulo: SOR — Sistemas Operativos en Red]** · **Proyecto Final del Bloque 2 · Boochan Academy**
> 🧭 Índice del proyecto: [[02_Indice_Proyecto]] · 🏫 El cliente: [[00_El_Cliente_Boochan_Academy]]
>
> **📦 Entrega:** tres vídeos · instantánea `AC1 · Fase 1 terminada` · copia `.ova`

---

> [!important] ✍️ Este apartado son TRES vídeos y lo que produzcas va a tu repositorio
> | | |
> | :--- | :--- |
> | 📹 **3 vídeos** | `B2 · AC1 · F1 · Implementación` / `· Verificación` / `· Averías`, en la playlist `B2_Academia_1` |
> | 📝 **1 entrada de apuntes** | `b2-ac1.1-las-aulas-y-el-servidor.md` en `00_Apuntes/Trimestre_N/B2_Ubuntu_Local/`, con la estructura del **Bloque 0 · Fase 0.1.b** |
> | 💿 **Copias `.ova`** | A tu **disco externo**. Nunca a GitHub |
>
> **Identifícate al empezar cada vídeo** y pon **timestamps** en la descripción (`00:00 Presentación` y uno por paso). Los dos son corte duro en la rúbrica. Si algo de esto no lo tienes montado: **[[01_ANTES_DE_EMPEZAR]]**.

## **1 · EL ENCARGO**

> [!quote] 🗣️ Lo que te dice el cliente
> *"Nos han dicho que para esto hace falta un ordenador que esté siempre encendido y que sea el que manda. Tenemos uno en el cuartito de la limpieza, con su regleta. Lo que necesitamos es que desde cualquier aula se llegue a esa máquina, y que no cambie de sitio: el año pasado un técnico nos montó algo parecido y cada vez que se iba la luz la dirección era otra y dejaba de funcionar la impresora. Eso no nos puede volver a pasar."*

> [!info] 🎯 Lo que ha pedido de verdad, traducido
> Cuatro cosas, y las cuatro tienen nombre técnico:
> 1. **Una máquina servidora encendida** con un sistema operativo de servidor.
> 2. **Una dirección que no cambie.** Eso es lo que significa *"cada vez que se iba la luz la dirección era otra"*: tenía DHCP y le tocaba una distinta.
> 3. **Que se llegue desde las aulas**, o sea, que las aulas y el servidor estén en la misma red y se vean.
> 4. **Que se pueda administrar sin bajar al cuartito**, porque tú no vas a estar ahí todos los días.

> [!danger] 🛑 El requisito 2 es el que más se suspende, y no da ningún error
> Una máquina puede tener la dirección correcta **hoy** y otra distinta **mañana**. Se comporta exactamente igual hasta que reinicias.
>
> **"Lo he cambiado" no es lo mismo que "se quedará cambiado".** Piensa cómo vas a demostrar la segunda cosa, porque es la que compró el cliente.

---

## **2 · IMPLEMENTACIÓN**

> [!example] 🎬 Antes de empezar
> 1. Léete el apartado entero, hasta el final. **Incluidas las averías**: saber qué vas a romper luego cambia cómo lo montas ahora.
> 2. Ten a mano [[00_El_Cliente_Boochan_Academy]] con los datos técnicos del punto 9.
> 3. OBS listo, pantalla y micro comprobados.
> 4. **Arranca la grabación e identifícate** — GitHub, Teams o tu correo `@alu.edu.gva.es` en pantalla.

**Lo que tiene que existir al final de este apartado:**

- [ ] Una **máquina virtual servidora** con Ubuntu Server instalado, dimensionada para lo que le viene encima: va a ser controlador de dominio y servidor de ficheros de una academia.
- [ ] La máquina responde al nombre **`srv-academia`**.
- [ ] Tiene la dirección **`172.20.10.5/24`** en la red del laboratorio, **y la conserva tras reiniciar**.
- [ ] Tiene **salida a internet** para instalar paquetes. *(Sí, las dos cosas a la vez. Piensa cómo.)*
- [ ] Se puede **administrar en remoto** desde tu equipo, sin abrir la ventana de la VM.
- [ ] El sistema está **al día** de paquetes antes de montar nada encima.

> [!warning] ⚠️ Dos decisiones que tienes que tomar TÚ y explicar en el vídeo
> **1. El tipo de red de las tarjetas virtuales.** La red `172.20.10.0/24` es del laboratorio y no existe fuera. Elige qué tipo de adaptador la sostiene y **di por qué descartas los otros**. Si te sale que necesitas dos tarjetas, explica qué hace cada una.
>
> **2. Los recursos de la máquina.** RAM, disco y CPU. Nadie te va a dar los números: sácalos de lo que sabes que va a correr ahí. **Un servidor mal dimensionado no falla el primer día: falla el día que hay gente usándolo.**

> [!tip] 💡 De dónde sacas esto sin que te lo cuenten
> Todo lo de este apartado lo hiciste en las **Fases 1 y 2**. Ve a tus apuntes de entonces: no a copiar los comandos —los valores son otros— sino a recordar **qué ficheros se tocan y qué comprueba cada cosa**.
>
> Si en la Fase 1 del Bloque 2 apuntaste por qué el fichero de red llevaba esa indentación y no otra, hoy tardas veinte minutos. Si no, hoy te toca volver a aprenderlo. **Así funciona un cuaderno de trabajo.**

> [!question] 🤔 Para decir en voz alta en el vídeo
> El cliente ha dicho *"un ordenador que sea el que manda"*. **¿Manda en qué, exactamente?** Todavía no has instalado nada que mande sobre nadie. Explica qué le falta a esta máquina para ser lo que él imagina — y en qué apartado se lo vas a poner.

---

## **3 · VERIFICACIÓN**

> [!danger] 🛑 Aquí no hay lista de comprobaciones. La haces tú
> Esto es lo que tiene que **quedar demostrado en el vídeo**. Las pruebas concretas —qué comandos, desde dónde y en qué orden— las eliges tú, y esa elección es parte de la nota.

**Lo que un cliente exigente te haría demostrar:**

| # | Tiene que quedar demostrado | La trampa |
| :--- | :--- | :--- |
| 1 | Que la máquina se llama como debe | Hay más de un sitio donde vive el nombre. ¿Coinciden todos? |
| 2 | Que tiene **exactamente** la dirección acordada | Que la tenga **hoy** no demuestra nada |
| 3 | Que **conserva** la dirección después de reiniciar | Esta es la prueba de verdad, y solo hay una forma de hacerla |
| 4 | Que llega a internet **y** a la red del laboratorio | Son dos pruebas distintas, no una |
| 5 | Que se puede administrar en remoto | Demuéstralo **desde fuera**, no desde la propia máquina |
| 6 | Que las respuestas las está dando el servidor | Si administras en remoto, es fácil creer que hablas con quien no hablas |

> [!warning] ⚠️ La número 6 no es paranoia mía
> En la Fase 4 del Bloque 2 tenías un caso entero dedicado a esto: comandos que respondían perfectamente **y contestaba tu propio ordenador**. Si trabajas en remoto, la primera línea de cualquier comprobación es asegurarte de **dónde estás**.

> [!tip] 💡 Cómo se enseña una prueba en el vídeo
> Antes de teclear: *"voy a comprobar que la dirección sobrevive al reinicio, y para eso voy a…"*. Después: *"ha salido esto, y significa esto"*.
>
> **Una prueba que no se interpreta no es una prueba: es una captura de pantalla.**

> [!example] 🤖 Y cuando hayas terminado tú, pasa el verificador
> ```bash
> cd ~
> curl -O https://raw.githubusercontent.com/sor-iesjj/bloque-2-academia-1/main/99_Recursos/verificar_ac1_fase1.sh
> chmod +x verificar_ac1_fase1.sh
> less verificar_ac1_fase1.sh
> sudo ./verificar_ac1_fase1.sh
> ```
> *(Del `less` se sale con `q`.)*
>
> **Léelo antes de ejecutarlo.** Es un script descargado de internet que vas a lanzar como `root`: esa costumbre la cogiste en la Fase 4 del Bloque 2 y no se pierde porque hoy tengas prisa.
>
> Y ojo: **este verificador no te da el arreglo.** Te dice qué está mal. El cómo es tuyo.

---

## **4 · LABORATORIO DE AVERÍAS**

> [!danger] 🛑 Requisito: la instantánea del punto 5 tiene que estar tomada
> Sin punto de retorno no se rompe nada. **Comprueba que existe antes de seguir.**

> [!info] 🎓 Cómo funciona esto ahora
> En las fases te decía qué romper, qué mirar, qué significaba y cómo repararlo. **Aquí solo lo primero.**
>
> Tú tienes que: **predecir** qué va a pasar, **romper**, **diagnosticar** con tus propias comprobaciones y **reparar**. Los tres últimos pasos, sin ayuda.
>
> **Predecir en voz alta antes de ejecutar es obligatorio.** Acertar no puntúa; haber pensado, sí.

---

### **AVERÍA 1 · La dirección que desaparece**

> [!bug] 🔨 Qué tienes que romper
> Edita el fichero de configuración de red del servidor y **borra la línea que fija la dirección `172.20.10.5`**, dejando el resto del fichero exactamente igual. Aplica el cambio.
>
> *(Haz copia del fichero antes. Siempre.)*

> [!question] 🤔 Predice antes de ejecutar
> 1. ¿Se va a quejar el sistema al aplicar el cambio?
> 2. ¿Perderás la sesión remota en el momento, o más tarde?
> 3. ¿Qué verá alguien desde un equipo de aula que intente llegar al servidor?

**Lo que tienes que hacer tú:** diagnosticarla **desde cero**, como si te la hubieras encontrado. Sin mirar qué acabas de tocar. En el vídeo hay que ver **cómo llegas** al fichero culpable, no que ya sabías cuál era.

> [!success] 🎯 Lo que se te evalúa aquí
> Que sepas ir **de un síntoma a una causa**. Empieza por lo que ve el usuario y ve estrechando: la máquina, la tarjeta, la configuración, el fichero. **El orden en que buscas es la habilidad.**

---

### **AVERÍA 2 · El servidor al que no se puede entrar**

> [!bug] 🔨 Qué tienes que romper
> **Para el servicio que te permite administrar el servidor en remoto.** No lo desinstales: párale.
>
> Y antes de arreglarlo, quédate con esta pregunta: **¿el puerto sigue abierto?**

> [!question] 🤔 Predice antes de ejecutar
> 1. Si estás conectado en remoto en este momento, ¿se te corta la sesión?
> 2. ¿Responderá la máquina a un `ping`?
> 3. Un escaneo del puerto desde fuera, ¿qué crees que va a decir?

**Lo que tienes que hacer tú:** comprobar la diferencia entre **"la máquina está viva"** y **"el servicio está vivo"**, y explicarla en el vídeo con lo que has visto en pantalla.

> [!success] 🎯 Lo que se te evalúa aquí
> Que no confundas capas. Una máquina que responde al `ping` puede tener todos sus servicios caídos. Y —esto es lo que sorprende— **un puerto puede seguir figurando como accesible sin que haya nadie escuchando detrás.**
>
> Es el mismo aprendizaje de la Fase 1 del Bloque 2, y aquí lo tienes que reconocer **sin que nadie te lo señale**.

---

## **5 · PUNTO DE CONTROL**

> [!danger] 🛑 Primero la verificación en verde. Después esto
> Y con la grabación del vídeo de verificación todavía en marcha.

### **5A — La instantánea**

**La VM tiene que estar APAGADA de verdad**, no en "estado guardado".

> [!warning] ⚠️ Por qué apagada, otra vez
> Una instantánea con la máquina encendida guarda **la RAM**, y con ella **el reloj congelado**. Cuando la restaures dentro de tres semanas, el servidor despertará creyendo que sigue siendo hoy. En la Fase 2 empieza a haber Kerberos por medio, y **Kerberos rechaza cualquier autenticación con más de cinco minutos de desfase**.
>
> Tendrías un dominio intacto en el que no puede entrar nadie. **Y no lo relacionarías con esto.**

Nombre de la instantánea: **`AC1 · Fase 1 terminada`**.

### **5B — La copia al disco externo**

Exporta la máquina apagada a `.ova`, con manifiesto.

```
SOR/
└── Bloque_2/
    └── Proyecto_Academia/
        └── Fase 1/  B2-AC1-F1-aulas-y-servidor.ova
```

> [!danger] 🛑 Una copia que vive en el mismo sitio que el original no es una copia
> Las instantáneas **viven dentro de VirtualBox**. Si el programa se corrompe, si formatean el equipo del aula o si el disco falla, **se van todas con él**.
>
> En la Fase 5 vas a comprobar si te has creído esto o solo lo has leído.

### ✅ Antes de pasar a la Fase 2

- [ ] Vídeo `B2 · AC1 · F1 · Implementación` subido, **con identificación al principio**.
- [ ] Vídeo `B2 · AC1 · F1 · Verificación` subido, con **tus** pruebas y su interpretación.
- [ ] Vídeo `B2 · AC1 · F1 · Averías` subido, con las dos averías y **la predicción dicha antes** de cada una.
- [ ] Instantánea **`AC1 · Fase 1 terminada`**, con la VM apagada.
- [ ] **`B2-AC1-F1-aulas-y-servidor.ova`** en el disco externo, y **comprobado que existe y cuánto pesa**.
- [ ] El servidor **reiniciado después de las averías** y todo en su sitio.

---

> [!summary] 🎓 Qué has demostrado en este apartado
> Que sabes montar la máquina sobre la que va todo lo demás **a partir de una conversación**, no de un guion: traducir *"que no cambie la dirección"* a una configuración persistente, y *"que se llegue desde las aulas"* a un diseño de red.
>
> Y dos cosas que se te van a repetir todo el proyecto: que **una configuración que no sobrevive a un reinicio no está hecha**, y que **estar vivo y estar funcionando no son lo mismo**.
>
> **Siguiente:** [[Fase_2_AC1_El_Dominio]] — el cliente quiere que las cuentas dejen de vivir en cada equipo.
