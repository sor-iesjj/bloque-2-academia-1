## 🏁 Proyecto Final del Bloque 2 — Boochan Academy

### El encargo completo: de la reunión con el cliente a la entrega

> **[Módulo: SOR — Sistemas Operativos en Red]**
> **Profesor:** Pedro Navarro Miralles · IES Jorge Juan (ALICANTE)
>
> **⏱️ Tiempo estimado:** ~8 horas de máquina, repartidas en varias sesiones
> **Requisitos:** las ocho fases del Bloque 2 terminadas y la Auditoría Final hecha
> **📦 Entrega:** **21 vídeos** + **7 entradas de apuntes** (una por apartado) + las instantáneas + las copias `.ova`

---

> [!important] 👈 ¿Has hecho ya los dos pasos previos?
> Si has llegado aquí directamente, **vuelve atrás**. Van en este orden y por algo:
>
> | # | Página | Para qué |
> | :--- | :--- | :--- |
> | 1 | **[[00_El_Cliente_Boochan_Academy]]** | Quién es el cliente y qué necesita |
> | 2 | **[[01_ANTES_DE_EMPEZAR]]** | Traer el material, preparar la entrega y la playlist |
>
> Sin el 1 no sabes qué resolver. **Sin el 2 no tienes dónde guardar el trabajo ni cómo entregarlo.**
>
> Ahí está **quién es Boochan Academy, qué tiene y qué necesita** — y sin eso, lo que viene a continuación no significa gran cosa. Son diez minutos y es la fuente de verdad de todo el proyecto.

> [!danger] 🛑 Y ahora sí: esto no funciona como las fases
> En las ocho fases del bloque te decía **qué teclear**. Aquí no.
>
> Aquí tienes **lo que quiere un cliente**, y tú decides cómo resolverlo, en qué orden y con qué herramientas. No hay procedimiento, no hay comandos, no hay teoría: eso ya lo diste.
>
> **Este proyecto no comprueba si sabes seguir instrucciones. Comprueba si sabes trabajar sin ellas.**
>
> Y sí, vas a atascarte. Esa es la parte del ejercicio que no se puede simular.

> [!info] 📖 Lo que sí tienes a mano, y no es poco
> - **Las ocho fases enteras.** Vuelve a ellas todas las veces que haga falta: para eso las escribiste tú también, en tus entradas de apuntes.
> - El [[Diccionario_Comandos_Sistema]], la [[Guía_Errores_y_Resolución]] y la [[Guía_Editor_Nano]].
> - [[Fase_0.S_Instantaneas_Puntos_de_Control]], que te va a hacer falta más de lo que crees.
> - Tus propias entradas de apuntes del bloque. **Si las escribiste bien, hoy valen su peso en oro. Si las rellenaste al final, hoy lo vas a notar.**
>
> **Consultar el material no es hacer trampa: es exactamente lo que hace un técnico.** Copiar los valores de Boochan S.L. sin darte cuenta de que aquí son otros, eso sí es un problema — y no te va a funcionar nada.

---

## 🧭 Los apartados del encargo

> [!warning] 📖 Siete documentos, y se hacen en orden
> Cada apartado es un fichero. **Se recorren en orden**, porque cada uno se apoya en el anterior: no puedes dar permisos a un grupo que todavía no existe.

| # | Apartado | Qué le has prometido al cliente |
| :--- | :--- | :--- |
| **Fase 1** | [[Fase_1_AC1_Las_Aulas_y_el_Servidor]] | Que haya una máquina servidora encendida, con nombre y dirección fijos, a la que se llegue desde las aulas |
| **Fase 2** | [[Fase_2_AC1_El_Dominio]] | Que las cuentas dejen de vivir en cada equipo y pasen a estar en un sitio central |
| **Fase 3** | [[Fase_3_AC1_Las_Personas]] | Que cada persona de la academia tenga su cuenta, en su colectivo |
| **Fase 4** | [[Fase_4_AC1_El_Almacenamiento]] | Que haya un sitio donde guardar las cosas, y que lo que se descontrole no se lleve por delante lo importante |
| **Fase 5** | [[Fase_5_AC1_La_Politica_de_Acceso]] | Que se cumpla la matriz: quién ve qué, quién escribe dónde y qué no debe ni aparecer |
| **Fase 6** | [[Fase_6_AC1_Los_Equipos_de_las_Aulas]] | Que un alumno se siente en cualquier aula, entre con su nombre y encuentre sus cosas |
| **Fase 7** | [[Fase_7_AC1_La_Entrega]] | Que le puedas enseñar al cliente que funciona, y dejarlo cerrado |

> [!abstract] 🏫 Antes de abrir la Fase 1: léete la ficha del cliente entera
> **[[00_El_Cliente_Boochan_Academy]]** — quién es la academia, quién trabaja allí, la matriz de permisos y su justificación.
>
> **No es material de apoyo: es el contrato.** Los siete apartados se corrigen contra esa página.

---

## 📐 Cómo está montado cada apartado

Los siete llevan **siempre la misma estructura**, para que sepas dónde mirar:

| Parte | Qué encuentras | Quién trabaja |
| :--- | :--- | :--- |
| **1 · El encargo** | Lo que pide el cliente, con sus palabras | Lo lees |
| **2 · Implementación** | Lo que tienes que conseguir. **Sin comandos** | 🔴 **Tú** |
| **3 · Verificación** | Lo que tiene que quedar demostrado. **Las pruebas las eliges tú** | 🔴 **Tú** |
| **4 · Laboratorio de averías** | Dos cosas que romper. **La reparación no viene** | 🔴 **Tú** |
| **5 · Punto de control** | Instantánea con la VM apagada + copia `.ova` al disco externo | Lo haces |

> [!danger] 🛑 El orden 3 → 5 no se toca, y aquí menos que nunca
> **Primero se verifica. Después se guarda.** Una instantánea de un trabajo sin comprobar convierte el fallo en tu punto de retorno: cada vez que restaures, vuelve.
>
> En las fases te lo recordaba en cada apartado. **Aquí lo recuerdo una vez, y es esta.**

---

## 🎬 La entrega: veintiún vídeos y siete entradas

> [!important] 📹 El peso está en los vídeos, pero la entrada sigue siendo obligatoria
> **Lo que se evalúa aquí es el criterio, y el criterio se oye.** Un documento se puede escribir después, con calma y mirando la solución; un vídeo explicando por qué elegiste una cosa y no otra, no. Por eso los vídeos mandan.
>
> Pero **donde hay vídeo, hay entrada** — la regla del **Bloque 0 · Fase 0.1.b** no tiene excepciones. Cada apartado lleva **una** entrada, `b2-ac1.<n>-<titulo>.md`, que recoge sus tres vídeos y tus decisiones por escrito.
>
> **Siete entradas para tres semanas de proyecto.** Es donde queda registrado por qué hiciste las cosas como las hiciste.

**Playlist:** `B2_Academia_1`
**Patrón del nombre:** `B2 · AC1 · F<n> · <tipo>`

| Por apartado | Nombre del vídeo | Qué tiene que contener |
| :--- | :--- | :--- |
| 1 | `B2 · AC1 · F1 · Implementación` | **Cómo lo resuelves y por qué eliges cada cosa.** Pensar en voz alta es parte de la nota |
| 2 | `B2 · AC1 · F1 · Verificación` | **Las pruebas que TÚ has decidido**, y sus resultados |
| 3 | `B2 · AC1 · F1 · Averías` | Las dos averías: romper, diagnosticar, reparar |

Y lo mismo con `Fase 2`, `Fase 3`, `Fase 4`, `Fase 5`, `Fase 6` y `Fase 7`: **siete apartados × tres vídeos = 21 entregas.**

> [!warning] ⚠️ El punto de control NO tiene vídeo propio
> Va **dentro del vídeo de verificación**, al final: apagas, tomas la instantánea y exportas el `.ova` con la grabación en marcha. En las fases eran entregas separadas; aquí no, porque **guardar es parte de haber terminado**, no un trámite aparte.

> [!important] 🔴 En TODOS los vídeos, al empezar: identifícate
> Lo primero que se ve, antes de tocar nada:
> - Tu **perfil de GitHub** en pantalla, **o** tu ficha de **Teams**, **o** tu correo **`@alu.edu.gva.es`**.
> - Y lo dices en voz alta: nombre y qué apartado vas a hacer.
>
> **Un vídeo sin identificación no se corrige.** No es burocracia: es lo que hace que ese vídeo sea tuyo y no de otro. Va recordado en los siete apartados porque es lo que más se olvida.

> [!tip] 💡 Qué se espera que digas en el vídeo de implementación
> No narres los comandos: **eso ya se ve en pantalla**. Lo que no se ve es lo que estás pensando.
>
> - *"Voy a hacerlo así porque en la Fase 6 del Bloque 2 aprendí que…"*
> - *"Podría hacerlo de esta otra forma, pero descarto porque…"*
> - *"Esto me ha fallado, y creo que es por…"*
>
> **Un vídeo donde solo se oye el teclado es un vídeo que no demuestra criterio.** Y equivocarte en voz alta y corregirte puntúa más que acertar en silencio.

---

## 📋 Qué se te evalúa

> [!abstract] 📋 Los RA del proyecto
> Este proyecto **no introduce criterios nuevos**: recorre los del bloque entero, pero exigiéndolos **sin guion**.
>
> | Apartado | Se evalúa lo mismo que en… | RA |
> | :--- | :--- | :--- |
> | Fase 1 | [[Fase_1.1_Que_Se_Evalua]] · [[Fase_2.1_Que_Se_Evalua]] | `RA.01` · `RA.05` |
> | Fase 2 | [[Fase_4.1_Que_Se_Evalua]] | `RA.03` |
> | Fase 3 | [[Fase_5.1_Que_Se_Evalua]] | `RA.02` · `RA.03` |
> | Fase 4 | [[Fase_6.1_Que_Se_Evalua]] | `RA.01` · `RA.04` · `RA.05` |
> | Fase 5 | [[Fase_7.1_Que_Se_Evalua]] | `RA.04` |
> | Fase 6 | [[Fase_8.1_Que_Se_Evalua]] | `RA.02` · `RA.04` · `RA.06` |
> | Fase 7 | [[Auditoria_Final.1_Que_Se_Evalua]] | `RA.05` · `RA.06` |
>
> **El detalle de cada criterio está en la fase enlazada.** Aquí no se repite: si quieres saber qué te miran en la Fase 5, se mira lo mismo que en la Fase 7 del Bloque 2 — con la diferencia de que ahora nadie te dice cómo.

---

## 🤖 Los verificadores del proyecto

En `99_Recursos/` tienes **dos scripts** hechos para la academia:

| Script | Qué comprueba | Cuándo se usa |
| :--- | :--- | :--- |
| `verificar_ac1_fase1.sh` | Red, nombre, dirección y acceso remoto | Al cerrar el **Fase 1** |
| `verificar_ac1_proyecto.sh` | Dominio, personas, almacenamiento y **la matriz entera** | Del **Fase 2** al **Fase 7** |

> [!warning] 🛑 Estos verificadores NO te dan el arreglo
> Los del bloque te decían el comando exacto para reparar cada fallo. **Estos no.** Te dicen qué está mal y por qué importa. **El cómo es tu trabajo** — es un proyecto evaluable, no una práctica guiada.
>
> Y el orden tampoco cambia: **primero compruebas tú, después pasas el script.** Si lo lanzas antes de mirar nada, lo estás usando como muleta y se nota en el vídeo.

---

## 🗓️ Cómo repartirlo

> [!tip] 💡 Esto no se hace en una tarde, y no debe hacerse en una tarde
> | Sesión | Apartados | Por qué van juntos |
> | :--- | :--- | :--- |
> | **1.ª** | Fase 1 · Fase 2 | Infraestructura: no hay academia hasta que hay dominio |
> | **2.ª** | Fase 3 · Fase 4 | Las personas y su sitio |
> | **3.ª** | Fase 5 | La política. Es el apartado más denso del proyecto |
> | **4.ª** | Fase 6 | Los equipos de aula, y las pruebas de verdad |
> | **5.ª** | Fase 7 | Cierre y entrega |
>
> **Cada sesión acaba con su punto de control.** Nunca dejes una sesión sin instantánea: la próxima vez que enciendas, querrás tener a dónde volver.

---

> [!summary] 🎓 Qué demuestras al terminar esto
> Que puedes coger **el problema de un cliente** —no un enunciado, un problema— y devolverle una infraestructura que funciona, que cumple lo que pidió y que **puedes demostrar que lo cumple**.
>
> Y una cosa más, que es la que de verdad separa a un técnico de alguien que sigue tutoriales: **que sabes volver atrás.** Vas a tener que restaurar, recuperar y rehacer. Ese día descubrirás si tus copias servían para algo.
>
> **Siguiente:** [[00_El_Cliente_Boochan_Academy]] — léete al cliente antes de tocar nada.
