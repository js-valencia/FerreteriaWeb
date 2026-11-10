<div align="center">

# 🛠️ FerreteriaWeb

### 🗄️ Diseño y Gestión de Base de Datos

**Sistema de Gestión para una Ferretería**

[![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![SQL](https://img.shields.io/badge/SQL-Queries-orange?logo=databricks&logoColor=white)](https://www.mysql.com/)
[![Draw.io](https://img.shields.io/badge/Diagrams-Draw.io-F08705?logo=diagrams.net&logoColor=white)](https://www.drawio.com/)
[![Git](https://img.shields.io/badge/Version_Control-Git-F05032?logo=git&logoColor=white)](https://git-scm.com/)

</div>

---

## 📖 Descripción

**FerreteriaWeb** es un proyecto académico orientado al diseño y desarrollo de un sistema informático para la gestión de una ferretería.

Esta rama contiene los recursos correspondientes al diseño, modelado e implementación de la base de datos, incluyendo los diagramas, las consultas de álgebra relacional y sus respectivas implementaciones en SQL.

## 🎯 Objetivo

Diseñar y estructurar una base de datos relacional que permita gestionar la información de una ferretería, estableciendo las entidades, relaciones, atributos y restricciones necesarias para representar adecuadamente los procesos del sistema.

## 🗄️ Diseño de la Base de Datos

El diseño de la base de datos comprende las siguientes etapas:

- **Modelo Entidad-Relación:** representación conceptual de las entidades, atributos y relaciones del sistema.
- **Modelo Relacional:** transformación del modelo conceptual en relaciones, identificando claves primarias y foráneas.
- **Álgebra Relacional:** formulación de consultas mediante operaciones del álgebra relacional.
- **SQL:** implementación de consultas y scripts para la creación y manipulación de la base de datos.

## 📁 Estructura del Repositorio

```text
FerreteriaWeb/
│
├── database/
│   │
│   ├── diagrams/
│   │   │
│   │   ├── entity-relation-model/
│   │   │   ├── Entidad-Relacion_ferreteria.png
│   │   │   └── FerreteriaER.drawio
│   │   │
│   │   └── relational-model/
│   │       ├── Ferreteria_MRelacional.drawio
│   │       └── Relacional_Ferreteria.png
│   │
│   ├── queries/
│   │   │
│   │   ├── relational/
│   │   │   └── consultas.md
│   │   │
│   │   └── sql/
│   │       ├── consulta1.sql
│   │       ├── consulta2.sql
│   │       ├── consulta3.sql
│   │       ├── consulta4.sql
│   │       └── consulta5.sql
│   │
│   └── sql-code/
│       ├── ferreteria.sql
│       └── ferreteria-datos.sql
│
├── .gitignore
└── README.md
```

## 📚 Documentación

### 🔷 1. Modelo Entidad-Relación

Contiene la representación conceptual de la base de datos, identificando las entidades, atributos y relaciones que intervienen en el sistema.

**Archivos:**

- [📄 Visualizar diagrama (PNG)](database/diagrams/entity-relation-model/Entidad-Relacion_ferreteria.png)
- [✏️ Archivo editable (Draw.io)](database/diagrams/entity-relation-model/FerreteriaER.drawio)

### 🔗 2. Modelo Relacional

Presenta la transformación del modelo Entidad-Relación a un esquema relacional, estableciendo las tablas, atributos, claves primarias (PK) y claves foráneas (FK).

**Archivos:**

- [📄 Visualizar diagrama (PNG)](database/diagrams/relational-model/Relacional_Ferreteria.png)
- [✏️ Archivo editable (Draw.io)](database/diagrams/relational-model/Ferreteria_MRelacional.drawio)

### 📐 3. Consultas de Álgebra Relacional

Contiene las expresiones de álgebra relacional desarrolladas sobre el modelo de datos, aplicando operaciones como selección, proyección, unión, diferencia, producto cartesiano, renombramiento y combinación.

**Archivo:**

- [📘 Consultas de Álgebra Relacional](database/queries/relational/consultas.md)

### 💻 4. Consultas SQL

Incluye las consultas SQL correspondientes a los ejercicios desarrollados, permitiendo aplicar operaciones de recuperación y manipulación de información sobre la base de datos.

**Archivos:**

- [Consulta 1](database/queries/sql/consulta1.sql)
- [Consulta 2](database/queries/sql/consulta2.sql)
- [Consulta 3](database/queries/sql/consulta3.sql)
- [Consulta 4](database/queries/sql/consulta4.sql)
- [Consulta 5](database/queries/sql/consulta5.sql)

### ⚙️ 5. Código SQL

Contiene los scripts SQL utilizados para definir la estructura de la base de datos y trabajar con sus registros.

| Archivo | Descripción |
|---|---|
| `ferreteria.sql` | Script SQL de la base de datos. |
| `ferreteria-datos.sql` | Script relacionado con los datos de la base de datos. |

## 🛠️ Herramientas utilizadas

| Herramienta | Aplicación |
|---|---|
| 🐬 MySQL | Sistema de gestión de bases de datos. |
| 📐 Draw.io | Elaboración y edición de diagramas. |
| 💻 SQL | Definición y consulta de datos. |
| 🐙 Git | Control de versiones. |
| 🌐 GitHub | Almacenamiento y colaboración del proyecto. |

## 🌿 Rama de trabajo

| Rama | Descripción |
|---|---|
| `main` | Rama principal del proyecto. |
| `db-updates` | Documentación, diagramas, consultas y scripts relacionados con la base de datos. |

---

<div align="center">

### 👨‍💻 Autor

**José David Valencia Condoy**

Universidad Nacional de Loja
Carrera de Computación
Asignatura de Bases de Datos

---

**🛠️ FerreteriaWeb**

*Diseñando una estructura de datos organizada y consistente.*

</div>