(4H) MediSistema

El objetivo de este examen es diseñar una base de datos que permita almacenar y gestionar la información sobre médicos, empleados y pacientes de un centro de salud. La base de datos debe reflejar la estructura del personal médico, incluidos médicos titulares, interinos y sustitutos, junto con sus horarios y períodos de sustitución. Además, se debe llevar un registro detallado de las vacaciones planificadas y disfrutadas, tanto para médicos como para empleados. Finalmente, se gestionará la relación entre pacientes y los médicos asignados.



Problema


El centro de salud necesita una solución para organizar y consultar la información del personal médico, los empleados y los pacientes de manera eficiente. Actualmente, la falta de un sistema centralizado genera dificultades a la hora de saber quién está activo, quién está de vacaciones o en sustitución, y quién tiene asignados a los pacientes. Además, el cálculo de las horas de consulta semanales y la gestión de las vacaciones planificadas son tareas que se realizan manualmente, lo que resulta en errores y pérdida de tiempo.



Características Principales


Gestión de médicos: Registro completo de médicos, incluyendo su tipo (titular, interino o sustituto), horarios de consulta y períodos de sustitución.
Gestión de empleados: Información detallada de los empleados no médicos, incluyendo ATS, auxiliares de enfermería, celadores y administrativos.
Gestión de pacientes: Relación entre pacientes y médicos asignados.
Control de vacaciones: Registro de las vacaciones planificadas y disfrutadas tanto para médicos como empleados.


Requisitos del Modelo Lógico y Físico


El modelo lógico debe reflejar correctamente las entidades, relaciones, atributos y cardinalidades.
El modelo físico debe ser implementable en una base de datos MySQL, reflejando correctamente las estructuras de tablas, claves primarias y foráneas.
Evidencia fotográfica o uso de plataformas como drawSQL o StarUML debe ser proporcionada, ya sea en forma de capturas de pantalla o enlaces a los diagramas.


Tecnologías y Herramientas


Base de Datos: MySQL para la gestión de la información.
Lenguaje de Consulta: SQL para realizar las consultas necesarias y gestionar los datos.
Herramientas de Diseño: Herramientas de modelado de bases de datos (por ejemplo, MySQL Workbench) para visualizar y diseñar la estructura de la base de datos.


Resultado esperado

Se debe crear u repositorio de GitHub (privado y compartido con las cuentas que el trailer indique) que contenga:



Archivo SQL de la Estructura: Este archivo contendrá la definición completa de la base de datos, incluyendo la creación de todas las tablas, así como las claves primarias y foráneas necesarias para mantener la integridad referencial. Se asegurará que la estructura sea implementable en un entorno MySQL.
Archivo SQL de los Datos: Este archivo incluirá los scripts para insertar datos de prueba en las tablas creadas previamente. Los datos deberán representar escenarios realistas que permitan validar el funcionamiento del sistema, incluyendo información sobre médicos, empleados y pacientes.
README: Este documento proporcionará una descripción general del proyecto, incluyendo instrucciones sobre cómo ejecutar los archivos SQL en un entorno MySQL. Además, incluirá soluciones a las consultas SQL planteadas   en el proyecto, explicando la lógica detrás de cada consulta y cómo se relaciona con la estructura de la base de datos. Esto asegurará que los evaluadores comprendan la funcionalidad del sistema y puedan verificar la correcta implementación de las consultas.


Modelo de consultas para Readme:



# Consultas



1. **Número de pacientes atendidos por cada médico**



```sql



```



2. **Total de días de vacaciones planificadas y disfrutadas por cada empleado**



```sql



```



3. **Médicos con mayor cantidad de horas de consulta en la semana**



```sql



```



4.  **Número de sustituciones realizadas por cada médico sustituto**



```sql



```



5.  **Número de médicos que están actualmente en sustitución**



```sql



```



6. **Horas totales de consulta por médico por día de la semana**



```sql



```



7.  **Médico con mayor cantidad de pacientes asignados**



```sql



```



8. **Empleados con más de 10 días de vacaciones disfrutadas**



```sql



```



9.  **Médicos que actualmente están realizando una sustitución**



```sql



```



10.  **Promedio de horas de consulta por médico por día de la semana**



```sql



```



11.  **Empleados con mayor número de pacientes atendidos por los médicos bajo su supervisión**



```sql



```



12.  **Médicos con más de 5 pacientes y total de horas de consulta en la semana**



```sql



```



13.  **Total de días de vacaciones planificadas y disfrutadas por cada tipo de empleado**



```sql



```



14. **Total de pacientes por cada tipo de médico**



```sql



```



15. **Total de horas de consulta por médico y día de la semana**



```sql



```



16. **Número de sustituciones por tipo de médico**



```sql



```



17. **Total de pacientes por médico y por especialidad**



```sql



```



18. **Empleados y médicos con más de 20 días de vacaciones planificadas**



```sql



```



19. **Médicos con el mayor número de pacientes actualmente en sustitución**



```sql



```



20. **Total de horas de consulta por especialidad y día de la semana**



```sql



```



