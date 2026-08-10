# Proyecto Academia 1 · Boochan Academy — Proyecto final del Bloque 2 (SOR · 2.º SMR)

> **Autor y propietario:** © 2026 **Pedro Navarro Miralles** — IES Jorge Juan (Alicante)
> **Módulo:** Sistemas Operativos en Red (SOR) · 2.º Curso SMR
> **Licencia:** [CC BY-NC-SA 4.0](LICENSE) — atribución obligatoria al autor, uso no comercial.

Un cliente real —una academia— te encarga su infraestructura. **Tú decides cómo se resuelve.**

Siete fases, desde la reunión con el cliente hasta la entrega: servidor, dominio, personas, almacenamiento, política de acceso, equipos de las aulas y cierre.

**No es un guion.** En el Bloque 2 se te decía qué teclear; aquí se te dice **qué necesita el cliente**, y el cómo lo eliges tú y lo justificas.

---

## ⚠️ Antes de empezar

**Este proyecto exige el Bloque 2 terminado** — las ocho fases y la Auditoría Final. No es un repaso: es aplicar lo mismo a un escenario distinto, **desde cero y con otra máquina virtual**.

Léete **[01_ANTES_DE_EMPEZAR.md](01_ANTES_DE_EMPEZAR.md)** antes de tocar nada.

---

## 🚀 Cómo empezar

1. Pulsa el botón verde **"Use this template" → "Create a new repository"** para crear **tu propia copia** en tu cuenta de GitHub.
2. **Clónala** junto al resto de tus prácticas — **con el segundo argumento**:
   ```bash
   cd ~/Boveda_SOR/01_Practicas
   git clone https://github.com/TU_USUARIO/bloque-2-academia-1.git B2_Academia_1
   ```
   > Sin ese `B2_Academia_1`, Git nombra la carpeta como el repositorio y la misma cosa acaba con dos nombres. La carpeta, la playlist y tus apuntes se llaman **igual**.
3. Ábrela en **Obsidian** y empieza por **[00_El_Cliente_Boochan_Academy.md](00_El_Cliente_Boochan_Academy.md)** — primero se conoce al cliente, después se organiza el trabajo.
4. Sube tus avances a **tu** repositorio:
   ```bash
   git add .
   git commit -m "Mis avances en la Academia"
   git push
   ```

---

## 📂 Contenido

- **[00_El_Cliente_Boochan_Academy.md](00_El_Cliente_Boochan_Academy.md)** — quién es el cliente y qué necesita. **Se lee lo primero.**
- **[01_ANTES_DE_EMPEZAR.md](01_ANTES_DE_EMPEZAR.md)** — requisitos, material y checklist de arranque.
- **[02_Indice_Proyecto.md](02_Indice_Proyecto.md)** — las siete fases, la entrega y cómo se evalúa.
- **`Fase_1_AC1_…`** … **`Fase_7_AC1_…`** — las siete fases del encargo.
- **`99_Recursos/`** — los dos verificadores:
  - `verificar_ac1_fase1.sh` — red, nombre, dirección y acceso remoto *(al cerrar la Fase 1)*
  - `verificar_ac1_proyecto.sh` — dominio, personas, almacenamiento y la matriz entera *(de la Fase 2 en adelante)*

---

## 📹 La entrega

**Veintiún vídeos** —tres por fase: `Implementación`, `Verificación` y `Averías`— y **siete entradas de apuntes**.

| | Patrón |
| :--- | :--- |
| Vídeo | `B2 · AC1 · F<n> · <tipo>`, en la playlist **`B2_Academia_1`** |
| Entrada | `b2-ac1.<n>-<titulo>.md` |

---

*Material docente. Se distribuye sin los solucionarios. Cualquier uso debe reconocer la autoría de Pedro Navarro Miralles (IES Jorge Juan) según la licencia [CC BY-NC-SA 4.0](LICENSE).*
