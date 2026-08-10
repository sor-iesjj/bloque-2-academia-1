# 🛠️ Antes de empezar

> **Módulo:** SOR — Sistemas Operativos en Red · **Bloque 2 · Proyecto Final**
>
> **📍 Cuándo se lee:** después de conocer al cliente y **antes** del índice.
>
> **⏱️ Te lleva:** unos 20 minutos, sin contar las descargas.

---

## **VAS A MONTAR UNA INFRAESTRUCTURA ENTERA, DESDE CERO**

Un **servidor** y **dos puestos de aula** para Boochan Academy.

**Desde cero significa desde cero:** no reutilizas el servidor de Boochan. Empiezas con **una ISO y una máquina virtual vacía**, igual que si te llamaran de una empresa mañana.

```
          Lo que vas a construir

   ┌──────────────────────┐
   │  ServidorAcademia    │   Ubuntu Server, instalado por ti
   │  172.20.10.5         │   dominio ACADEMIA.LOCAL
   └──────────┬───────────┘
              │
      ┌───────┴────────┐
      │                │
┌─────▼──────┐  ┌──────▼─────┐
│ Puesto de  │  │ Puesto del │   Windows 11, unidos al dominio
│ aula   .20 │  │ profe  .21 │
└────────────┘  └────────────┘
```

> [!danger] 🛑 Tu servidor de Boochan NO se toca
> Las máquinas del Bloque 2 se quedan **exactamente como están**. No las reconfigures, no les cambies la red y no las reutilices.
>
> Las vas a necesitar: **son tu material de consulta** cuando aquí te atasques.

---

## **1 · LO QUE NECESITAS TENER DELANTE**

- [ ] **La ISO de Ubuntu Server** *(la misma versión del Bloque 2)*
- [ ] **La ISO de Windows 11**
- [ ] **Tu SSD externo** de 1-2 TB, con espacio libre
- [ ] **Tus apuntes del Bloque 2**, las ocho fases, a mano
- [ ] **Este material**, descargado *(paso 2)*

> [!info] 💾 Sobre el disco y las máquinas
> Vas a acabar con **cinco máquinas virtuales**: las dos de Boochan y las tres de la academia. En total rondan los **160 GB**.
>
> **Es el motivo por el que se te pidió un SSD de 1 o 2 TB** en el material del **Bloque 0**, en *Herramientas, cuentas y material*. Si lo tienes, no hay problema.
>
> **Nunca vas a necesitar más de dos encendidas a la vez** — ni siquiera en la Fase 6, donde trabajas con el servidor y **un** cliente. Enciende solo lo que uses: cada máquina apagada son 4 GB de RAM que te devuelve tu ordenador.

> [!warning] ⚠️ Las ISO en pendrives, no descargándolas cada vez
> Se te pidieron **tres pendrives** en el Bloque 0 precisamente para esto: **un medio por sistema**. Tenerlos preparados te ahorra media hora de descarga cada vez que montes una máquina.
>
> Y si en clase se cae la red, tú sigues montando. Los demás, no.

---

## **2 · TRAE EL MATERIAL**

Este proyecto **tiene repositorio propio**, separado del Bloque 2. Sácate tu copia igual que hiciste en el **Bloque 0 · Fase 0.4**:

1. Entra en **https://github.com/sor-iesjj/bloque-2-academia-1** y pulsa el botón verde **"Use this template" → "Create a new repository"**.
2. Clónalo **junto al resto de tus prácticas**:

```bash
cd ~/Boveda_SOR/01_Practicas
git clone https://github.com/TU_USUARIO/bloque-2-academia-1.git B2_Academia_1
cd B2_Academia_1
ls
```

> [!danger] 🛑 El segundo argumento del `clone` no es opcional
> Sin ese `B2_Academia_1` del final, Git nombra la carpeta como el repositorio y **la misma cosa acaba con dos nombres**. La carpeta, la playlist y tus apuntes se llaman **igual**: `B2_Academia_1`.

- **✅ Bien:** ves `Fase_1_AC1_…` hasta `Fase_7_AC1_…`, el índice y `99_Recursos/`.
- **❌ Mal:** *"No such file or directory"* → **avísame en clase.** No intentes arreglarlo tú.

---

## **3 · DÓNDE VA LO QUE PRODUZCAS**

**Una entrada por apartado**, siete en total, con el resto de tu Bloque 2:

```
00_Apuntes/Trimestre_N/B2_Ubuntu_Local/
   ├── b2-1.1-….md  …  b2-8-….md              ← tus ocho fases, ya están
   ├── b2-ac1.1-las-aulas-y-el-servidor.md
   ├── b2-ac1.2-el-dominio.md
   ├── …
   └── b2-ac1.7-la-entrega.md            ← aquí va la documentación al cliente
```

**La estructura es la de siempre**, la del **Bloque 0 · Fase 0.1.b**. Cada entrada recoge los **tres vídeos** de su apartado y lo que has decidido tú: por qué elegiste cada cosa, qué pruebas montaste y qué te falló.

> [!info] 📌 Por qué van ahí y no en una carpeta nueva
> Porque **este proyecto es del Bloque 2**, y tus carpetas de apuntes se llaman como mis bloques. Es la regla del **Bloque 0 · Fase 0.1.a** y no cambia ahora.
>
> Y por qué hay entrada aunque el peso esté en los vídeos: **donde hay vídeo, hay entrada.** Esa regla no tiene excepciones, y menos en el proyecto que más decisiones tuyas contiene. Aquí es donde justificas **por qué** hiciste las cosas de una manera y no de otra — que es exactamente lo que se te evalúa.

> [!danger] 🛑 Los `.ova` van al SSD. NUNCA a GitHub
> Son varios gigas cada uno. Si consigues colar uno, **dejas el repositorio inservible para siempre**: el historial de Git no olvida.
>
> Compruébalo antes de tocar nada:
> ```bash
> cd ~/Boveda_SOR/00_Apuntes/Trimestre_N
> grep ova .gitignore
> ```
> Si no aparece, añádelo. Lo viste en el **Bloque 0 · Fase 0.3.b**; hoy es cuando importa.

---

## **4 · COMPRUEBA QUE PUEDES ENTREGAR**

Hazlo **ahora**, con un fichero que no importa:

```bash
cd ~/Boveda_SOR/00_Apuntes/Trimestre_N
echo "# prueba" > B2_Ubuntu_Local/prueba.md
git add B2_Ubuntu_Local/ && git commit -m "Academia: prueba de entrega" && git push
```

Abre tu repositorio en GitHub y **míralo con tus ojos**. Después bórralo:

```bash
rm B2_Ubuntu_Local/prueba.md
git add B2_Ubuntu_Local/ && git commit -m "Academia: quito la prueba" && git push
```

> [!success] 🎯 Dos minutos que te ahorran un disgusto
> Un proyecto impecable que no llega a GitHub **es un proyecto no entregado**. Mejor descubrir hoy que algo no va, con un fichero vacío, que dentro de tres semanas con el trabajo hecho.

---

## **5 · LA PLAYLIST**

Créala hoy, vacía, con este nombre exacto:

```
B2_Academia_1
```

**No listado**, como todas.

Vas a subir **21 vídeos**: tres por cada uno de los siete apartados — implementación, verificación y averías.

> [!danger] 🛑 Identifícate al empezar cada uno
> Tu perfil de GitHub, tu Teams o tu correo `@alu.edu.gva.es`. **Es corte duro en la rúbrica:** un vídeo sin identificación no cuenta, aunque el trabajo esté perfecto.

---

## ✅ **CHECKLIST — no abras la Fase 1 sin esto**

- [ ] Las **ocho fases del Bloque 2** y la **Auditoría Final**, terminadas.
- [ ] Las **dos ISO** preparadas *(Ubuntu Server y Windows 11)*.
- [ ] El **SSD externo** conectado y con sitio.
- [ ] Mi copia de `bloque-2-academia-1` **clonada como `B2_Academia_1`**.
- [ ] Mis apuntes de las ocho fases, **a mano**.
- [ ] El `.gitignore` **excluye los `.ova`**.
- [ ] **Prueba de entrega hecha** y comprobada en GitHub.
- [ ] Playlist **`B2_Academia_1`** creada.
- [ ] Sé que cada apartado lleva **una entrada de apuntes** (`b2-ac1.<n>-<titulo>.md`) además de sus tres vídeos.

---

> [!summary] 🎓 Lo que empieza aquí
> Hasta ahora te he dicho **qué teclear**. A partir de la Fase 1, te digo **qué necesita el cliente** — y cómo se resuelve lo decides tú.
>
> Tienes ocho fases de trabajo hecho y unos apuntes que escribiste tú. **Hoy se ve si sirven de algo.**
>
> **Siguiente:** [[02_Indice_Proyecto]] — cómo está organizado el encargo.
