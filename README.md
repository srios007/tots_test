# Prueba Técnica Para Desarrollador Flutter

* Desarrollada por: Santiago Ríos Valero.

### Descripción del Proyecto

Esta aplicación en Flutter permite la gestión de clientes, incluyendo funcionalidades de búsqueda, visualización en lista con carga incremental de a 5 clientes, y un sistema de ABM (Alta, Baja, Modificación) de clientes. La autenticación se realiza a través de una pantalla de inicio de sesión que se conecta con una API para obtener el token requerido para la gestión de clientes. El diseño de las pantallas sigue las especificaciones proporcionadas en Figma. Adicional a esto, se implementó una pantalla de registro, logout y la posibilidad de eliminar usuarios.

### Tecnologías usadas

* Flutter
* Dart
* Dio
* Firebase storage
* Stacked

### Justificación de la prueba

La elección de Stacked como arquitectura para esta aplicación de gestión de clientes en Flutter se basa en varios factores clave que aseguran una estructura de código limpia, mantenible y escalable. Stacked promueve una clara separación de responsabilidades mediante la implementación del patrón MVVM (Model-View-ViewModel), lo que permite que la lógica de negocio y la lógica de presentación estén desacopladas, facilitando el mantenimiento y la evolución del código. La gestión del estado es un aspecto crucial en aplicaciones modernas, y Stacked proporciona una forma reactiva de manejar el estado a través de ViewModels, permitiendo que las vistas se actualicen automáticamente cuando cambian los datos subyacentes. Además, Stacked facilita la inyección de dependencias mediante el uso de GetIt y locator, promoviendo la reutilización de código y facilitando las pruebas unitarias. La navegación y la gestión de diálogos son componentes esenciales en cualquier aplicación, y Stacked proporciona servicios integrados para manejar la navegación y los diálogos de manera consistente y sencilla. La estructura modular de Stacked permite que la aplicación crezca y se escale de manera eficiente, y la separación de la lógica de negocio y la lógica de presentación facilita la escritura de pruebas unitarias y de integración. Finalmente, Stacked cuenta con una comunidad activa y una buena documentación, lo que facilita la resolución de problemas y la implementación de nuevas funcionalidades, asegurando una experiencia de desarrollo fluida.
 
### Horas trabajadas 

* Viernes 1 de noviembre: 5 horas
* Sábado 2 de noviembre: 2 horas
* Lunes 4 de noviembre: 6 horas

### Instalación 

1. Clonar el siguiente repositorio:

```bash
git https://github.com/srios007/tots_test.git
```

2. Agregar el archivo .env en la raíz del proyecto, este está adjunto en el entregable de la prueba técnica como un .txt

3. Agregar el archivo key.properties en la carpeta android, este está adjunto en el entregable de la prueba técnica como un .txt. Debe ajustar la ruta del storeFile, este está ubicado en la carpeta key del proyecto.

4. Descargar las librerías necesarias: 

```
flutter pub get
```
5. Correr la aplicación:

```
flutter run
```