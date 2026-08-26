## Fase 7 · La entrega

> **[Módulo: SOR — Sistemas Operativos en Red]** · **Proyecto Final del Bloque 2 · Boochan Academy**
> 🧭 Índice del proyecto: [[02_Indice_Proyecto]] · 🏫 El cliente: [[00_El_Cliente_Boochan_Academy]]
>
> **📦 Entrega:** tres vídeos · instantánea `AC1 · Proyecto terminado` · copia `.ova` final

---

> [!important] ✍️ Este apartado son TRES vídeos y lo que produzcas va a tu repositorio
> | | |
> | :--- | :--- |
> | 📹 **3 vídeos** | `B2 · AC1 · F7 · Implementación` / `· Verificación` / `· Averías`, en la playlist `B2_Academia_1` |
> | 📝 **1 entrada de apuntes** | `b2-ac1.7-la-entrega.md` en `00_Apuntes/Trimestre_N/B2_Ubuntu_Local/`, con la estructura del **Bloque 0 · Fase 0.1.b** |
> | 💿 **Copias `.ova`** | A tu **disco externo**. Nunca a GitHub |
>
> **Identifícate al empezar cada vídeo** y pon **timestamps** en la descripción (`00:00 Presentación` y uno por paso). Los dos son corte duro en la rúbrica. Si algo de esto no lo tienes montado: **[[01_ANTES_DE_EMPEZAR]]**.

## **1 · EL ENCARGO**

> [!quote] 🗣️ Lo que te dice el cliente
> *"Pues si funciona, ya está, ¿no? Bueno, dos cosas. Una: yo esto no lo sé tocar, así que déjame algo escrito por si algún día tengo que llamar a otro. Y dos: el de la gestoría me dijo que con lo de los datos de las familias tengamos cuidado, que ahora te pueden meter un puro. Tú mira lo que haya que mirar y me dices."*

> [!info] 🎯 Lo que ha pedido de verdad, traducido
> Dos cosas que se parecen poco entre sí y las dos son trabajo tuyo:
> - **Documentación de entrega.** Lo que le dejas al cliente para que otro técnico pueda continuar.
> - **Un cierre de seguridad.** *"Que no te metan un puro"* es, en cristiano: **que el servidor no ofrezca más de lo que tiene que ofrecer.**

> [!info] 🎓 Por qué el endurecimiento se hace AHORA y no al principio
> Porque **un servidor se cierra cuando está terminado, no a mitad de obra**. Si cierras puertos mientras todavía estás montando, te pasas el proyecto peleándote con tu propio cortafuegos y sin saber si el problema es él o tú.
>
> Es exactamente el orden de la [Auditoría Final del Bloque 2](https://github.com/sor-iesjj/bloque-2-ubuntu-local/blob/main/Fases/Auditoria_Final.md) del bloque: primero *"todo funciona"*, después *"solo funciona lo que debe"*.

---

## **2 · IMPLEMENTACIÓN**

> [!example] 🎬 Antes de empezar
> 1. Ten a mano el informe del verificador **de la Fase 2** —el primero que guardaste— y el de hoy.
> 2. **Arranca la grabación e identifícate.**

**Lo que tiene que existir al final de este apartado:**

### 2A · El cierre de seguridad

- [ ] Un **cortafuegos activo** en el servidor, con política de **denegar por defecto** y una lista de lo que sí se permite.
- [ ] **Sabes justificar cada puerto abierto**: qué servicio es, quién lo necesita y qué dejaría de funcionar si lo cierras.
- [ ] Una **auditoría de qué está escuchando** en la máquina: si hay algo abierto que ningún requisito del cliente pide, sobra.
- [ ] Después de cerrar: **las nueve pruebas del cliente siguen funcionando**. Si has roto algo, lo has roto tú hoy.

> [!danger] 🛑 Antes de activar el cortafuegos, piensa por dónde estás conectado
> Si administras el servidor en remoto y activas una política de "denegar todo" sin permitir antes tu propia vía de acceso, **te quedas fuera de tu propio servidor en el mismo comando**. La máquina sigue encendida y tú no puedes entrar.
>
> No es una anécdota: le pasa a todo el mundo una vez. **Que te pase en el laboratorio, con una instantánea al lado, y no en la academia.**

> [!warning] ⚠️ Un dominio necesita más puertos de los que te imaginas
> No es un servidor web con su puerto y ya está: hay nombres, autenticación, directorio y ficheros compartidos, y **cada cosa escucha por su sitio**.
>
> **Averigua cuáles son mirando tu propia máquina**, no copiando una lista de internet. Tienes las herramientas para preguntarle al servidor qué está escuchando y quién lo ha abierto. Esa es la parte del ejercicio.

### 2B · La documentación de entrega

Un solo documento, en tu repositorio, que le puedas dar al cliente. **Escrito para alguien que no ha hecho el proyecto.**

Tiene que llevar, como mínimo:

| Apartado | Qué va dentro |
| :--- | :--- |
| **Qué se ha montado** | En dos párrafos y sin jerga. Lo leería el dueño de la academia |
| **Los datos** | Dominio, red, direcciones, nombres de máquina. Lo que necesita el que venga detrás |
| **Quién es quién** | Los tres colectivos y qué puede cada uno |
| **La matriz de permisos** | Tal cual, con su justificación. **Sin esto, el sistema no se puede auditar** |
| **Qué hacer si pasa X** | Tres o cuatro incidencias probables y qué mirar primero |
| **Las copias de seguridad** | Qué hay, dónde está y **cada cuánto habría que renovarlo** |

> [!danger] 🛑 El apartado que parece de relleno y es el más importante: la matriz
> Lo aprendiste rompiéndolo en la Fase 5. **Una política de permisos que no está escrita fuera del sistema no se puede auditar**, y si no se puede auditar, la única respuesta honesta a *"¿esto está bien configurado?"* es **"no lo sé"**.
>
> El día que otro técnico se siente delante de este servidor, ese documento es la diferencia entre revisarlo en una hora o no poder revisarlo nunca.

> [!question] 🤔 Para decir en voz alta en el vídeo
> 1. Compara el informe del verificador **de la Fase 2** con el de hoy. **¿Qué ha cambiado?** Ese diff es el proyecto entero.
> 2. **¿Qué le pasa a este montaje el día que la academia tenga 120 alumnos?** Di una cosa que aguanta y una que habría que revisar.
> 3. **¿Qué NO has hecho** que en una academia de verdad haría falta? *(Hay bastante: copias automáticas, más de un controlador, contraseñas individuales, antivirus, actualizaciones... Elige dos y explícalas.)* **Saber qué falta también es criterio.**

---

## **3 · VERIFICACIÓN**

> [!danger] 🛑 Hoy verificas dos cosas distintas
> Que el cierre de seguridad **no ha roto nada**, y que el cierre de seguridad **sirve para algo**. Son dos pruebas contrarias y las dos hacen falta.

| # | Tiene que quedar demostrado | La trampa |
| :--- | :--- | :--- |
| 1 | Que el cortafuegos está activo **y lo estará tras un reinicio** | Ya sabes por qué |
| 2 | Que **lo permitido funciona**: las nueve pruebas del cliente, otra vez | Si algo se rompió hoy, hoy se arregla |
| 3 | Que **lo no permitido no funciona** | Compruébalo intentándolo, no leyendo la lista de reglas |
| 4 | Que no queda nada escuchando **que nadie haya pedido** | Y para cada cosa que quede, ten la frase que la justifica |
| 5 | Que el verificador completo sigue en verde | Del `A` al `G` |

> [!tip] 💡 La prueba 3 es la que casi nadie hace
> Enseñar una lista de reglas de cortafuegos **no demuestra nada**: demuestra que has escrito reglas. Lo que demuestra que funcionan es **intentar algo que debería estar bloqueado y ver que se bloquea**.
>
> Y hazlo **desde otra máquina**. Un cortafuegos probado desde la propia máquina no está probado.

---

## **4 · LABORATORIO DE AVERÍAS**

> [!info] 🎓 Las dos de hoy son distintas: son llamadas de soporte
> Ya no rompes para aprender un mecanismo. **Rompes para ensayar lo que va a pasar la semana que viene**, cuando el cliente te llame porque "no va nada".
>
> En las dos, empieza el vídeo **como si acabaras de coger el teléfono**: no sabes qué han tocado.

---

### **AVERÍA 1 · "No va nada"**

> [!bug] 🔨 Qué tienes que romper
> **Apaga el servidor.** Sin avisar a nadie.
>
> Y ahora, en el **equipo de aula**, cierra sesión e intenta entrar con un alumno.

> [!question] 🤔 Predice antes de ejecutar
> 1. ¿Podrá iniciar sesión?
> 2. ¿Y si ya estaba con la sesión abierta antes de apagar el servidor? ¿Qué pierde y qué conserva?
> 3. ¿Qué le dirá exactamente Windows al usuario?

**Lo que tienes que hacer tú:** diagnosticarlo **desde el cliente**, sin ir corriendo al servidor. Enseña **cómo descubres desde el equipo del aula** que el problema no está en el equipo del aula. Eso es el ejercicio entero.

> [!important] ✍️ Y la parte que se corrige de verdad
> **¿Qué le contestas al cliente por teléfono?** Dilo en el vídeo, con las palabras que usarías con él, que no sabe lo que es un controlador de dominio.
>
> Y contesta a la pregunta que te va a hacer él: ***"¿y esto va a pasar cada vez que se vaya la luz?"***

> [!success] 🎯 Lo que se te evalúa aquí
> Que entiendas la **dependencia** que has creado: un dominio centraliza las cuentas, y eso es lo bueno **y** lo malo. Ganas administración; pierdes independencia.
>
> Un técnico honesto se lo dice al cliente el día que se lo monta, no el día que se cae.

---

### **AVERÍA 2 · El equipo que se sale del dominio**

> [!bug] 🔨 Qué tienes que romper
> Saca el **equipo de aula** del dominio y devuélvelo a un grupo de trabajo. Con su reinicio y todo.

> [!danger] 🛑 Antes de hacerlo: ¿te sabes la contraseña del usuario LOCAL de ese Windows?
> Al salir del dominio, **las cuentas del dominio dejan de servir para entrar**. Vas a necesitar el usuario local que creaste al instalar Windows.
>
> Si no lo recuerdas, **no hagas esta avería**: restaura la instantánea del cliente y anota la contraseña antes de intentarlo otra vez. *(Y fíjate en que acabas de aprender algo sobre por qué esa cuenta local existe.)*

> [!question] 🤔 Predice antes de ejecutar
> 1. ¿Se borran del servidor las cuentas de los alumnos?
> 2. ¿Seguirá el equipo llegando al servidor por red?
> 3. ¿Podrá alguien abrir su carpeta personal desde ahí?

**Lo que tienes que hacer tú:** volver a unirlo y **comprobar que todo sigue en su sitio**. Y contestar en el vídeo a esto: **¿qué se ha roto exactamente, si el servidor no se ha tocado?**

> [!success] 🎯 Lo que se te evalúa aquí
> Que la pertenencia a un dominio **no es una casilla en el cliente**: es una relación entre dos máquinas, con su cuenta de equipo en el servidor. Se puede romper por un lado y estar intacta por el otro.
>
> Y es la avería más real de todas: pasa **cada vez que alguien restaura una imagen vieja de un equipo de aula**. Que es algo que en una academia se hace todos los veranos.

---

## **5 · PUNTO DE CONTROL FINAL**

Instantánea: **`AC1 · Proyecto terminado`**, en las tres máquinas, apagadas de verdad.

```
SOR/Bloque_2/Proyecto_Academia/FINAL/
    ├── B2-AC1-F7-servidor-final.ova
    ├── B2-AC1-F7-aula1-pc01-final.ova
    └── B2-AC1-F7-aula4-prof-final.ova
```

> [!important] 🔴 Esta es la copia que le dejarías al cliente
> Compruébala como si fuera a hacer falta, porque en tu vida profesional alguna lo va a ser: **que existe, que pesa lo que debe y que la ruta es la que dice tu documentación de entrega.**
>
> Una copia que no aparece donde dice el documento es una copia que no existe.

---

## ✅ CHECKLIST FINAL DEL PROYECTO

**Los 21 vídeos**, todos con identificación al principio, en la playlist `B2_Academia_1`:

- [ ] `B2 · AC1 · F1 · Implementación` · `Verificación` · `Averías`
- [ ] `B2 · AC1 · F2 · Implementación` · `Verificación` · `Averías`
- [ ] `B2 · AC1 · F3 · Implementación` · `Verificación` · `Averías`
- [ ] `B2 · AC1 · F4 · Implementación` · `Verificación` · `Averías`
- [ ] `B2 · AC1 · F5 · Implementación` · `Verificación` · `Averías`
- [ ] `B2 · AC1 · F6 · Implementación` · `Verificación` · `Averías`
- [ ] `B2 · AC1 · F7 · Implementación` · `Verificación` · `Averías`

**Las tres pruebas que no se pueden fingir:**

- [ ] 🔴 **La restauración de la Fase 3**: volviste a `AC1 · Fase 2 terminada`, comprobaste dónde estabas y rehiciste el apartado.
- [ ] 🔴 **El viaje de la Fase 4**: fuiste a `AC1 · Fase 1 terminada`, trabajaste allí, creaste una rama y volviste.
- [ ] 🔴 **La catástrofe de la Fase 5**: borraste todas las instantáneas y recuperaste importando el `.ova`.

**Lo demás:**

- [ ] Las **nueve pruebas del cliente**, demostradas desde los equipos de aula.
- [ ] El verificador completo, **del `A` al `G`**, en verde, con su informe subido.
- [ ] La **documentación de entrega** en el repositorio.
- [ ] Instantáneas y copias `.ova` de los siete apartados, en la estructura acordada.
- [ ] Las **14 averías** hechas, predichas antes y reparadas después.

---

> [!summary] 🎓 Qué has demostrado con este proyecto
> Que puedes coger **el problema de un cliente** —no un enunciado— y devolverle una infraestructura que funciona, que hace exactamente lo que pidió y **ni una cosa más**.
>
> Que sabes **decidir**: qué red, qué tamaños, qué mecanismo para cada regla, qué se prueba y cómo. Nadie te ha dicho ni un comando en siete apartados.
>
> Que sabes **volver atrás de tres formas distintas**, y que lo sabes porque lo has hecho, no porque lo suponías.
>
> Y que sabes **entregar**: cerrar lo que sobra, escribir lo que hace falta y ser capaz de decir qué falta todavía. Eso último es lo que separa a un técnico de alguien que ha seguido un tutorial muy largo.
>
> **Siguiente:** nada. Has terminado el Bloque 2 entero. 🎉
