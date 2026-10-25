<div align="center">

# 🔩 FerreteriaWeb

### Sistema de gestión para una ferretería

Aplicación web orientada a la gestión de productos y al almacenamiento de información mediante una base de datos relacional.

![Java](https://img.shields.io/badge/Java-21-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-In_Development-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.4-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Maven](https://img.shields.io/badge/Maven-Build-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white)

*Estado del proyecto:* 🟡 En desarrollo

</div>

---

## 📌 Descripción

*FerreteriaWeb* es un proyecto de desarrollo de software cuyo objetivo es construir un sistema web para administrar la información y las operaciones de una ferretería.

La aplicación utilizará Java y Spring Boot para implementar la lógica del sistema, mientras que MySQL permitirá almacenar y gestionar los datos de forma estructurada.

El proyecto se desarrollará progresivamente, comenzando por el diseño de la base de datos y la conexión con la aplicación. Posteriormente, se incorporarán funcionalidades para administrar productos, categorías, proveedores, compras, ventas e inventario.

## 🎯 Objetivos

### Objetivo general

Desarrollar una aplicación web para gestionar la información de una ferretería mediante Java, Spring Boot y MySQL.

### Objetivos específicos

- Diseñar e implementar una base de datos relacional.
- Desarrollar operaciones CRUD para la gestión de productos.
- Establecer la conexión entre Spring Boot y MySQL.
- Aplicar buenas prácticas de programación y organización del código.
- Implementar módulos para el control de inventario, compras y ventas.
- Garantizar la integridad y consistencia de la información almacenada.

## 🛠️ Tecnologías

| Tecnología | Descripción |
|---|---|
| Java 21 LTS | Lenguaje de programación principal. |
| Spring Boot | Framework para el desarrollo de la aplicación. |
| MySQL 8.4 LTS | Sistema gestor de bases de datos relacionales. |
| Spring Data JPA | Persistencia y acceso a los datos. |
| Maven | Gestión de dependencias y construcción del proyecto. |
| Git | Control de versiones. |
| GitHub | Alojamiento del repositorio. |
| Docker | Herramienta prevista para ejecutar MySQL en contenedores. |

## 📋 Funcionalidades

Las siguientes funcionalidades están previstas para el desarrollo progresivo del sistema.

- [ ] Configuración inicial del proyecto Spring Boot.
- [ ] Diseño e implementación de la base de datos MySQL.
- [ ] Conexión entre Spring Boot y MySQL.
- [ ] Registro y consulta de productos.
- [ ] Actualización y eliminación de productos.
- [ ] Administración de categorías.
- [ ] Gestión de proveedores.
- [ ] Control de inventario.
- [ ] Registro de compras.
- [ ] Registro de ventas.
- [ ] Validación de datos y manejo de errores.
- [ ] Pruebas de funcionamiento.

> Las funcionalidades se marcarán como completadas conforme se implementen y se verifique su funcionamiento.

## 🗄️ Diseño de la base de datos

MySQL será el sistema gestor encargado de almacenar la información de la aplicación.

El modelo inicial contempla las siguientes entidades:

| Entidad | Descripción |
|---|---|
| Productos | Información, códigos y precios de los artículos. |
| Categorías | Clasificación de los productos. |
| Proveedores | Información de los proveedores. |
| Compras | Registro de adquisiciones de mercancía. |
| Detalles de compra | Productos y cantidades adquiridas. |
| Ventas | Registro de operaciones comerciales. |
| Detalles de venta | Productos, cantidades y precios vendidos. |
| Movimientos de inventario | Registro de entradas, salidas y ajustes de existencias. |

El modelo definitivo establecerá las claves primarias, claves foráneas, restricciones y relaciones necesarias para mantener la integridad de los datos.

## 📁 Estructura del proyecto

text
FerreteriaWeb/
├── .mvn/
│   └── wrapper/
├── src/
│   ├── main/
│   │   ├── java/
│   │   └── resources/
│   └── test/
├── .gitattributes
├── .gitignore
├── mvnw
├── mvnw.cmd
├── pom.xml
└── README.md


### Descripción de los directorios y archivos

- src/main/java/: contiene el código fuente de la aplicación.
- src/main/resources/: contiene los recursos y archivos de configuración.
- src/test/: contiene las pruebas automatizadas.
- .mvn/wrapper/: contiene la configuración del Maven Wrapper.
- mvnw: permite ejecutar Maven en Linux y otros sistemas Unix.
- mvnw.cmd: permite ejecutar Maven en Windows.
- pom.xml: define las dependencias y la configuración de Maven.
- .gitignore: especifica los archivos que Git debe ignorar.
- README.md: contiene la documentación del proyecto.

## ⚙️ Requisitos

Para preparar el entorno de desarrollo se necesitará:

- Java JDK 21 o una versión compatible con el proyecto.
- Git.
- IntelliJ IDEA u otro IDE compatible con Java.
- MySQL 8.4 LTS o una versión compatible.
- Maven Wrapper.
- Docker, si se utiliza para ejecutar MySQL en un contenedor.

## 🚀 Instalación y ejecución

### 1. Clonar el repositorio

bash
git clone git@github.com:js-valencia/FerreteriaWeb.git


También puedes clonar el repositorio mediante HTTPS.

### 2. Acceder al proyecto

bash
cd FerreteriaWeb


### 3. Verificar Java

bash
java -version


Comprueba que la versión instalada sea compatible con la configuración del proyecto.

### 4. Construir el proyecto

En Linux:

bash
chmod +x mvnw
./mvnw clean package


En Windows:

powershell
.\mvnw.cmd clean package


### 5. Ejecutar la aplicación

En Linux:

bash
./mvnw spring-boot:run


En Windows:

powershell
.\mvnw.cmd spring-boot:run


> La ejecución completa dependerá de que las dependencias, la clase principal y la configuración de la aplicación estén correctamente definidas. Si se requiere conexión con MySQL, también será necesario configurar las credenciales y los parámetros de conexión.

## 🔐 Seguridad

Durante el desarrollo se tendrán en cuenta las siguientes prácticas:

- Gestionar las credenciales mediante variables de entorno.
- Evitar publicar contraseñas y otros datos sensibles en GitHub.
- Mantener las dependencias actualizadas.
- Validar los datos recibidos por la aplicación.
- Aplicar restricciones e integridad referencial en MySQL.
- Gestionar adecuadamente las transacciones de la base de datos.

## 📚 Propósito académico

Este proyecto permite aplicar y reforzar conocimientos relacionados con:

- Programación orientada a objetos con Java.
- Desarrollo de aplicaciones web con Spring Boot.
- Diseño y normalización de bases de datos relacionales.
- Lenguaje SQL y consultas de datos.
- Persistencia mediante JPA.
- Relaciones entre entidades.
- Manejo de transacciones.
- Control de versiones con Git y GitHub.

## 🗺️ Etapas de desarrollo

1. Configuración inicial del proyecto.
2. Diseño de la base de datos relacional.
3. Integración de Spring Boot con MySQL.
4. Implementación del módulo de productos.
5. Desarrollo del control de inventario.
6. Incorporación de compras y ventas.
7. Implementación de validaciones y pruebas.

El desarrollo seguirá un enfoque incremental, priorizando una estructura sólida y una correcta gestión de los datos antes de ampliar las funcionalidades del sistema.

## 👨‍💻 Autor

*José David Valencia Condoy*

Estudiante de Computación | Desarrollo de software y bases de datos.

- GitHub: [@js-valencia](https://github.com/js-valencia)
- Repositorio: [FerreteriaWeb](https://github.com/js-valencia/FerreteriaWeb)

---

<div align="center">

Desarrollado con ☕ Java y el objetivo de construir un sistema organizado, funcional y escalable.

*FerreteriaWeb · Proyecto en desarrollo*

</div>