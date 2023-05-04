-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3309
-- Tiempo de generación: 27-04-2023 a las 01:58:07
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `noysita_fin`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_CAI` (IN `codigo_cai` INT(8), IN `cai` VARCHAR(255), IN `tipo_documento` VARCHAR(255), IN `valor_fiscal` VARCHAR(255), IN `fecha_vencimiento` DATE)   BEGIN
   SET foreign_key_checks = 0;
 UPDATE tbl_cai SET 
                         CAI = cai,
						 TIPO_DOCUMENTO = tipo_documento,
						 VALOR_FISCAL = valor_fiscal,                          FECHA_VENCIMIENTO =fecha_vencimiento
                         WHERE COD_CAI= codigo_cai;
                           SET foreign_key_checks = 1;                                           END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_CLIENTES` (IN `codigo_cliente` INT(8), IN `identidad` INT(13), IN `rtn` INT(13), IN `nombre` VARCHAR(255), IN `direccion` VARCHAR(255), IN `tipo_pago` VARCHAR(255), IN `fecha_ingreso` DATETIME)   BEGIN
   SET foreign_key_checks = 0;
 UPDATE tbl_clientes SET 
                         IDENTIDAD_CLIENTE = identidad,
						 RTN_CLIENTE = rtn,
						 NOMBRE_CLIENTE = nombre,
						 DIRECCION = direccion,
						 TIPO_PAGO = tipo_pago,
						 FECHA_INGRESO_CLIENTE = fecha_ingreso
					WHERE COD_CLIENTE = codigo_cliente;
						
						    
							
		SET foreign_key_checks = 1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_COMPRA` (IN `PI_COD_COMPRA` INT(8), IN `PV_NOMBRE_PRODUCTO` VARCHAR(255), IN `PI_PRECIO_PRODUCTO` INT(255), IN `PV_CANTIDAD` INT(255), IN `PV_CATALOGO` VARCHAR(255), IN `PV_FECHA_COMPRA` DATETIME)   BEGIN
   SET foreign_key_checks = 0;
UPDATE tbl_compra SET 
                    NOMBRE_PRODUCTO = PV_NOMBRE_PRODUCTO
                    ,PRECIO_PRODUCTO = PI_PRECIO_PRODUCTO
                   ,CANTIDAD_PRODUCTO = PV_CANTIDAD
                    ,CATALOGO_PRODUCTO= PV_CATALOGO
                    ,FECHA_COMPRA = PV_FECHA_COMPRA
                    WHERE COD_COMPRA = PI_COD_COMPRA;
                	SET foreign_key_checks = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_EMPLEADOS` (IN `codigo_empleado` INT(8), IN `nombre_empleado` VARCHAR(255), IN `identidad_empleado` INT(18), IN `edad_empleado` INT(255), IN `correo_empleado` VARCHAR(255), IN `celular_empleado` INT(16), IN `estado_civil` VARCHAR(255), IN `inicio_contrato` DATE, IN `cargo_empleado` VARCHAR(255), IN `salario_empleado` INT(255), IN `fecha_ingreso` DATE)   BEGIN
   SET foreign_key_checks = 0;
 UPDATE tbl_empleados SET 
 						
                         NOMBRE_EMPLEADO = nombre_empleado,
						 IDENTIDAD_EMPLEADO = identidad_empleado,
						 EDAD_EMPLEADO = edad_empleado,
						 CORREO_EMPLEADO = correo_empleado,
						 NUMERO_CELULAR_EMPLEADO =celular_empleado,
						 ESTADO_CIVIL_EMPLEADO = estado_civil,
                         INICIO_CONTRATO= inicio_contrato,
                         CARGO_EMPLEADO= cargo_empleado,
                         SALARIO_EMPLEADO=salario_empleado,
                         FECHA_INGRESO=fecha_ingreso
					WHERE COD_EMPLEADO = codigo_empleado;
						
						    
							
		SET foreign_key_checks = 1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_FACTURA` (IN `codigo_factura` INT(8), IN `num_factura` INT(255), IN `nombre` VARCHAR(255), IN `rtn` INT(255), IN `fec_factura` DATETIME, IN `id_cai` VARCHAR(255), IN `platillo` VARCHAR(255), IN `can_platillo` INT(255), IN `pi_precio` INT(255), IN `pi_iva` INT(255), IN `pi_total` INT(255))   BEGIN
   SET foreign_key_checks = 0;
 UPDATE tbl_factura SET 
                 
                    NUMERO_FACTURA = num_factura
                    ,NOMBRE_CLIENTE=nombre
                    ,RTN_CLIENTE = rtn
                    ,FECHA_FACTURACION = fec_factura
                    ,CAI = id_cai
                    ,PLATILLO=platillo
                    ,CANTIDAD_PLATILLO = can_platillo
                    ,PRECIO = pi_precio
                    ,IVA = pi_iva
                    ,TOTAL_FACTURA = pi_total
                    WHERE COD_FACTURA = codigo_factura;
		SET foreign_key_checks = 1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_INVENTARIO` (IN `PI_COD_PRODUCTO` INT(8), IN `PV_NOMBRE_PRODUCTO` VARCHAR(255), IN `PC_PRECIO_PRODUCTO` INT(14), IN `PI_CANTIDAD_PRODUCTO` INT(255), IN `PV_CATEGORIA_PRODUCTO` VARCHAR(255), IN `PV_FECHA_VENCIMIENTO` DATE, IN `PI_MAXIMO_PRODUCTO` INT(255), IN `PI_MINIMO_PRODUCTO` INT(255))   BEGIN
   SET foreign_key_checks = 0;
 UPDATE tbl_inventario SET 
                    NOMBRE_PRODUCTO = PV_NOMBRE_PRODUCTO
                    ,PRECIO_PRODUCTO = PC_PRECIO_PRODUCTO
                    ,CANTIDAD_PRODUCTO = PI_CANTIDAD_PRODUCTO
                    ,CATEGORIA_PRODUCTO = PV_CATEGORIA_PRODUCTO
                    ,FECHA_VENCIMIENTO = PV_FECHA_VENCIMIENTO
                    ,MAXIMO_PRODUCTO = PI_MAXIMO_PRODUCTO
                    ,MINIMO_PRODUCTO = PI_MINIMO_PRODUCTO
                WHERE COD_PRODUCTO =PI_COD_PRODUCTO ;	
		SET foreign_key_checks = 1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PLATILLOS` (IN `codigo_platillo` INT(8), IN `nombre_platillo` VARCHAR(255), IN `precio_platillo` INT(255), IN `receta` VARCHAR(255))   BEGIN
   SET foreign_key_checks = 0;
 UPDATE tbl_platillo SET 
                         NOMBRE_PLATILLO = nombre_platillo,
						 PRECIO_PLATILLO = precio_platillo,
						 RECETA_PLATILLO = receta
                         WHERE COD_PLATILLO= codigo_platillo;
                       SET foreign_key_checks = 1;
                       
                  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PROVEEDORES` (IN `codigo_proveedor` INT(8), IN `nombre_proveedor` VARCHAR(255), IN `celular_proveedor` INT(16), IN `producto_venta` VARCHAR(255), IN `precio_producto` INT(255), IN `ciudad_proveedor` VARCHAR(255), IN `observacion` VARCHAR(255))   BEGIN
   SET foreign_key_checks = 0;
 UPDATE tbl_proveedor SET 
                         NOMBRE_PROVEEDOR = nombre_proveedor,
						 CELULAR_PROVEEDOR = celular_proveedor,
						 PRODUCTO_VENTA = producto_venta,
						 PRECIO_PRODUCTO = precio_producto,
						 CIUDAD_PROVEEDOR = ciudad_proveedor,
						 OBSERVACION = observacion
					WHERE COD_PROVEEDOR = codigo_proveedor;
                      SET foreign_key_checks = 1; 
                      END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_ROL` (IN `codigorol` INT(8), IN `rol` VARCHAR(255), IN `usuario` VARCHAR(255), IN `fecha` DATETIME)   BEGIN
   SET foreign_key_checks = 0;
 UPDATE tbl_roles SET 
                         ROL = rol,
						 USUARIO = usuario,
						 FECHA_REGISTRO = fecha
                         WHERE COD_ROL= codigorol;
                       SET foreign_key_checks = 1;
                       
                  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_CLIENTES` (IN `codigo_cliente` INT(8))   BEGIN
  
 DELETE FROM tbl_clientes WHERE COD_CLIENTE = codigo_cliente;
                        											
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_COMPRA` (IN `codigo_compra` INT(8))   BEGIN
  
 DELETE FROM tbl_compra WHERE COD_COMPRA = codigo_compra;
                        											
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_EMPLEADOS` (IN `codigo_empleado` INT(8))   BEGIN
  
 DELETE FROM tbl_empleados WHERE COD_EMPLEADO = codigo_empleado;
                        											
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_PLATILLO` (IN `codigo_platillo` INT(8))   BEGIN
  
 DELETE FROM tbl_platillo WHERE  COD_PLATILLO = codigo_platillo;
                        											
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_PRODUCTO` (IN `codigo_producto` INT(8))   BEGIN
  
 DELETE FROM tbl_inventario WHERE COD_PRODUCTO = codigo_producto;
                        											
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_PROVEEDOR` (IN `codigo_proveedor` INT(8))   BEGIN
  
 DELETE FROM tbl_proveedor WHERE COD_PROVEEDOR = codigo_proveedor;
                        											
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_ROL` (IN `codigorol` INT(8))   BEGIN
  
 DELETE FROM tbl_roles WHERE  COD_ROL = codigorol;
                        											
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_CAI` (IN `cai` VARCHAR(255), IN `tipo` VARCHAR(255), IN `fiscal` VARCHAR(255), IN `fecha` DATE)   BEGIN

SET foreign_key_checks = 0;
 INSERT INTO tbl_cai(
 CAI,
 TIPO_DOCUMENTO,
 VALOR_FISCAL,
 FECHA_VENCIMIENTO) VALUES (
 
 cai,
 tipo,
 fiscal,  
 fecha);
		SET foreign_key_checks = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_CLIENTES` (IN `identidad` INT(13), IN `rtn` INT(13), IN `nombre` VARCHAR(255), IN `direccion` VARCHAR(255), IN `tipo_pago` VARCHAR(255), IN `fecha_ingreso` DATETIME)   BEGIN
   SET foreign_key_checks = 0;
 INSERT INTO tbl_clientes(  
                            IDENTIDAD_CLIENTE,
                            RTN_CLIENTE,
                            NOMBRE_CLIENTE,
                            DIRECCION,
                            TIPO_PAGO,
                            FECHA_INGRESO_CLIENTE
						 )
						    VALUES(	
                                    identidad,
                                    rtn,
                                    nombre,
                                    direccion,
                                    tipo_pago,
                                    fecha_ingreso
                            );
							
		SET foreign_key_checks = 1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_COMPRA` (IN `PV_NOMBRE_PRODUCTO` VARCHAR(255), IN `PI_PRECIO_PRODUCTO` INT(14), IN `PI_CANTIDAD_PRODUCTO` INT(255), IN `PI_CATALOGO_PRODUCTO` VARCHAR(255), IN `PV_FECHA_COMPRA` DATETIME)   BEGIN
   SET foreign_key_checks = 0;
 INSERT INTO tbl_compra(  
NOMBRE_PRODUCTO 
,PRECIO_PRODUCTO 
,CANTIDAD_PRODUCTO 
,CATALOGO_PRODUCTO 
,FECHA_COMPRA
) VALUES (

PV_NOMBRE_PRODUCTO 
,PI_PRECIO_PRODUCTO 
,PI_CANTIDAD_PRODUCTO
,PI_CATALOGO_PRODUCTO
,PV_FECHA_COMPRA
                            );		
		SET foreign_key_checks = 1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_EMPLEADO` (IN `nombre_empleado` VARCHAR(255), IN `identidad_empleado` INT(18), IN `edad_empleado` INT(255), IN `correo_empleado` VARCHAR(255), IN `numero_celular_empleado` INT(8), IN `estado_civil_empleado` VARCHAR(255), IN `inicio_contrato` DATE, IN `cargo_empleado` VARCHAR(255), IN `salario_empleado` INT(255), IN `fecha_ingreso` DATE)   BEGIN

SET foreign_key_checks = 0;
 INSERT INTO tbl_empleados(
 

 NOMBRE_EMPLEADO,
 IDENTIDAD_EMPLEADO,
 EDAD_EMPLEADO,
 CORREO_EMPLEADO,
 NUMERO_CELULAR_EMPLEADO,
 ESTADO_CIVIL_EMPLEADO,
 INICIO_CONTRATO,
 CARGO_EMPLEADO,
 SALARIO_EMPLEADO,
 FECHA_INGRESO) VALUES (
 

 nombre_empleado,
 identidad_empleado,
 edad_empleado,
 correo_empleado,
 numero_celular_empleado,
 estado_civil_empleado,
 inicio_contrato,
 cargo_empleado,
 salario_empleado,
 fecha_ingreso);
		SET foreign_key_checks = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_FACTURA` (IN `PI_NUMERO_FACTURA` INT(255), IN `PV_NOMBRE_CLIENTE` VARCHAR(255), IN `PI_RTN_CLIENTE` INT(255), IN `PV_FECHA_FACTURACION` DATE, IN `PI_ID_CAI` VARCHAR(255), IN `PI_PLATILLO` VARCHAR(255), IN `PI_CANTIDAD_PLATILLO` INT(255), IN `PI_PRECIO` INT(255), IN `PI_IVA` INT(255), IN `PI_TOTAL` INT(255))   BEGIN
   SET foreign_key_checks = 0;
 INSERT INTO tbl_factura(  
  NUMERO_FACTURA
  ,NOMBRE_CLIENTE
  ,RTN_CLIENTE
  ,FECHA_FACTURACION
   ,CAI
   ,PLATILLO  
  ,CANTIDAD_PLATILLO
  ,PRECIO
  ,IVA
  ,TOTAL_FACTURA
) VALUES (
  PI_NUMERO_FACTURA
  ,PV_NOMBRE_CLIENTE
  ,PI_RTN_CLIENTE
   ,PV_FECHA_FACTURACION
  ,PI_ID_CAI
   ,PI_PLATILLO
  ,PI_CANTIDAD_PLATILLO
  ,PI_PRECIO
  ,PI_IVA
  ,PI_TOTAL
                            );		
		SET foreign_key_checks = 1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_INVENTARIOS` (IN `PV_NOMBRE_PRODUCTO` VARCHAR(255), IN `PC_PRECIO_PRODUCTO` INT(14), IN `PI_CANTIDAD_PRODUCTO` INT(255), IN `PV_CATEGORIA_PRODUCTO` VARCHAR(255), IN `PV_FECHA_VENCIMIENTO` DATE, IN `PI_MAXIMO_PRODUCTO` INT(255), IN `PI_MINIMO_PRODUCTO` INT(255))   BEGIN
   SET foreign_key_checks = 0;
 INSERT INTO tbl_inventario(  
   NOMBRE_PRODUCTO
  ,PRECIO_PRODUCTO
  ,CANTIDAD_PRODUCTO
  ,CATEGORIA_PRODUCTO 
  ,FECHA_VENCIMIENTO
  ,MAXIMO_PRODUCTO
  ,MINIMO_PRODUCTO
 
) VALUES (
  PV_NOMBRE_PRODUCTO
  ,PC_PRECIO_PRODUCTO
  ,PI_CANTIDAD_PRODUCTO
  ,PV_CATEGORIA_PRODUCTO 
   ,PV_FECHA_VENCIMIENTO
  ,PI_MAXIMO_PRODUCTO
  ,PI_MINIMO_PRODUCTO
                         );		
		SET foreign_key_checks = 1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_PLATILLOS` (IN `nombre_platillo` VARCHAR(255), IN `precio_platillo` INT(255), IN `receta_platillo` VARCHAR(255))   BEGIN

SET foreign_key_checks = 0;
 INSERT INTO tbl_platillo(
 
 NOMBRE_PLATILLO,
 PRECIO_PLATILLO,
 RECETA_PLATILLO) VALUES (
 
 nombre_platillo,
 precio_platillo,
 receta_platillo);
		SET foreign_key_checks = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_PROVEEDOR` (IN `Nombre_Proveedor` VARCHAR(255), IN `Celular_Proveedor` INT(8), IN `Producto_Venta` VARCHAR(255), IN `Precio_Producto` INT(255), IN `Ciudad_Proveedor` VARCHAR(255), IN `Observacion` VARCHAR(255))   BEGIN
   SET foreign_key_checks = 0;
 INSERT INTO tbl_proveedor(  
      
                            NOMBRE_PROVEEDOR ,
                            CELULAR_PROVEEDOR,
                            PRODUCTO_VENTA,
     						PRECIO_PRODUCTO,
                            CIUDAD_PROVEEDOR,
                           OBSERVACION
						 )
						    VALUES(	
                            Nombre_Proveedor ,
                            Celular_Proveedor,
                            Producto_Venta,
     						Precio_Producto,
                            Ciudad_Proveedor,
                           Observacion
                            );		
		SET foreign_key_checks = 1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_ROL` (IN `rol` VARCHAR(255), IN `usuario` VARCHAR(255), IN `fecha` DATE)   BEGIN

SET foreign_key_checks = 0;
 INSERT INTO tbl_roles(
 ROL,
 USUARIO,
 FECHA_REGISTRO) VALUES (
 
 rol,
 usuario,
 fecha);
		SET foreign_key_checks = 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022_12_14_044422_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ver-rol', 'web', '2022-12-14 21:09:52', '2022-12-14 21:09:52'),
(2, 'crear-rol', 'web', '2022-12-14 21:09:52', '2022-12-14 21:09:52'),
(3, 'editar-rol', 'web', '2022-12-14 21:09:52', '2022-12-14 21:09:52'),
(4, 'borrar-rol', 'web', '2022-12-14 21:09:52', '2022-12-14 21:09:52'),
(5, 'ver-cliente', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(6, 'crear-cliente', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(7, 'editar-cliente', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(8, 'borrar-cliente', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(9, 'ver-empleado', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(10, 'crear-empleado', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(11, 'editar-empleado', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(12, 'borrar-empleado', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(13, 'ver-proveedor', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(14, 'crear-proveedor', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(15, 'editar-proveedor', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(16, 'borrar-proveedor', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(17, 'ver-compra', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(18, 'crear-compra', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(19, 'editar-compra', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(20, 'borrar-compra', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(21, 'ver-catalogo', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(22, 'crear-catalogo', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(23, 'editar-catalogo', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(24, 'borrar-catalogo', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(25, 'ver-inventario', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(26, 'crear-inventario', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(27, 'editar-inventario', 'web', '2022-12-16 02:28:36', '2022-12-16 02:28:36'),
(28, 'borrar-inventario', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(29, 'ver-cai', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(30, 'crear-cai', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(31, 'editar-cai', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(32, 'borrar-cai', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(33, 'ver-logs', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(34, 'ver-usuario', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(35, 'crear-usuario', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(36, 'editar-usuario', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(37, 'borrar-usuario', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(38, 'ver-bitacora', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(39, 'ver-reporte', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(40, 'ver-respaldo', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(41, 'ver-factura', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(42, 'editar-factura', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(43, 'borrar-factura', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37'),
(44, 'crear-factura', 'web', '2022-12-16 02:28:37', '2022-12-16 02:28:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(3, 'Empleados', 'web', '2022-12-15 21:48:31', '2022-12-15 21:48:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_bitacora`
--

CREATE TABLE `tbl_bitacora` (
  `COD_BITACORA` int(8) NOT NULL,
  `NUM_BITACORA` int(8) NOT NULL,
  `USUARIO` varchar(255) NOT NULL,
  `ACCION_SISTEMA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_bitacora`
--

INSERT INTO `tbl_bitacora` (`COD_BITACORA`, `NUM_BITACORA`, `USUARIO`, `ACCION_SISTEMA`) VALUES
(23, 5, 'root@localhost', 'Registro nuevo CAI'),
(24, 9, 'root@localhost', 'Registro nuevo platillo'),
(25, 6, 'root@localhost', 'Platillo eliminado'),
(26, 10, 'root@localhost', 'Registro nuevo platillo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cai`
--

CREATE TABLE `tbl_cai` (
  `COD_CAI` int(8) NOT NULL,
  `CAI` varchar(255) NOT NULL,
  `TIPO_DOCUMENTO` varchar(255) NOT NULL,
  `VALOR_FISCAL` varchar(255) NOT NULL,
  `FECHA_VENCIMIENTO` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_cai`
--

INSERT INTO `tbl_cai` (`COD_CAI`, `CAI`, `TIPO_DOCUMENTO`, `VALOR_FISCAL`, `FECHA_VENCIMIENTO`) VALUES
(1, 'AAAAA', 'FACTURA', 'CAI', '2022-12-08 00:00:00'),
(2, 'BBB', 'FACTURA', 'CAI', '2022-12-15 00:00:00'),
(3, 'CCCCC', 'FACTURA', 'CAI', '2022-12-08 00:00:00'),
(4, 'ddd', 'dd', 'dd', '2022-12-13 00:00:00'),
(5, 'D', 'DD', 'DD', '2022-12-13 00:00:00');

--
-- Disparadores `tbl_cai`
--
DELIMITER $$
CREATE TRIGGER `caibi` AFTER INSERT ON `tbl_cai` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(NEW.COD_CAI,CURRENT_USER,"Registro nuevo CAI");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upcai` AFTER UPDATE ON `tbl_cai` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_CAI,CURRENT_USER,"CAI actualizado");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `COD_CLIENTE` int(8) NOT NULL,
  `IDENTIDAD_CLIENTE` int(13) NOT NULL,
  `RTN_CLIENTE` int(14) NOT NULL,
  `NOMBRE_CLIENTE` varchar(255) NOT NULL,
  `DIRECCION` varchar(255) NOT NULL,
  `TIPO_PAGO` varchar(255) NOT NULL,
  `FECHA_INGRESO_CLIENTE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_clientes`
--

INSERT INTO `tbl_clientes` (`COD_CLIENTE`, `IDENTIDAD_CLIENTE`, `RTN_CLIENTE`, `NOMBRE_CLIENTE`, `DIRECCION`, `TIPO_PAGO`, `FECHA_INGRESO_CLIENTE`) VALUES
(1, 234456, 23456, 'yamal flores', 'perpetuo socoro', 'efectivo', '2022-12-06 00:00:00'),
(2, 345677, 45677, 'karla', 'tegus', 'transferencia', '2022-12-13 00:00:00');

--
-- Disparadores `tbl_clientes`
--
DELIMITER $$
CREATE TRIGGER `clienbi` AFTER INSERT ON `tbl_clientes` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(NEW.COD_CLIENTE,CURRENT_USER,"Registro nuevo Cliente");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delcli` AFTER DELETE ON `tbl_clientes` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_CLIENTE,CURRENT_USER,"Cliente eliminado");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upcli` AFTER UPDATE ON `tbl_clientes` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_CLIENTE,CURRENT_USER,"Cliente actualizado");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_compra`
--

CREATE TABLE `tbl_compra` (
  `COD_COMPRA` int(8) NOT NULL,
  `NOMBRE_PRODUCTO` varchar(255) NOT NULL,
  `PRECIO_PRODUCTO` int(14) NOT NULL,
  `CANTIDAD_PRODUCTO` varchar(255) NOT NULL,
  `CATALOGO_PRODUCTO` varchar(255) NOT NULL,
  `FECHA_COMPRA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_compra`
--

INSERT INTO `tbl_compra` (`COD_COMPRA`, `NOMBRE_PRODUCTO`, `PRECIO_PRODUCTO`, `CANTIDAD_PRODUCTO`, `CATALOGO_PRODUCTO`, `FECHA_COMPRA`) VALUES
(1, 'LECHE', 34, '4', 'lacteos', '2022-12-13 00:00:00');

--
-- Disparadores `tbl_compra`
--
DELIMITER $$
CREATE TRIGGER `DELco` AFTER DELETE ON `tbl_compra` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_COMPRA,CURRENT_USER,"compra eliminado");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `comprabi` AFTER INSERT ON `tbl_compra` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(NEW.COD_COMPRA,CURRENT_USER,"Registro nueva compra");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `uptcomp` AFTER UPDATE ON `tbl_compra` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_COMPRA,CURRENT_USER,"Compra actualizada");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleados`
--

CREATE TABLE `tbl_empleados` (
  `COD_EMPLEADO` int(8) NOT NULL,
  `NOMBRE_EMPLEADO` varchar(255) NOT NULL,
  `IDENTIDAD_EMPLEADO` int(13) NOT NULL,
  `EDAD_EMPLEADO` int(2) NOT NULL,
  `CORREO_EMPLEADO` varchar(255) NOT NULL,
  `NUMERO_CELULAR_EMPLEADO` int(8) NOT NULL,
  `ESTADO_CIVIL_EMPLEADO` varchar(255) NOT NULL,
  `INICIO_CONTRATO` datetime NOT NULL,
  `CARGO_EMPLEADO` varchar(255) NOT NULL,
  `SALARIO_EMPLEADO` int(10) NOT NULL,
  `FECHA_INGRESO` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_empleados`
--

INSERT INTO `tbl_empleados` (`COD_EMPLEADO`, `NOMBRE_EMPLEADO`, `IDENTIDAD_EMPLEADO`, `EDAD_EMPLEADO`, `CORREO_EMPLEADO`, `NUMERO_CELULAR_EMPLEADO`, `ESTADO_CIVIL_EMPLEADO`, `INICIO_CONTRATO`, `CARGO_EMPLEADO`, `SALARIO_EMPLEADO`, `FECHA_INGRESO`) VALUES
(1, 'eduar', 1234566, 23, 'edu@gmail.com', 34577, 'soltero', '2022-12-07 00:00:00', 'cajero', 1000, '2022-12-13 00:00:00'),
(2, 'joahn', 22222, 34, 'joh@gmail.com', 23445, 'casado', '2022-12-06 00:00:00', 'empleado', 2000, '2022-12-06 00:00:00'),
(5, 'edwin', 22, 22, 'edwin@gmail.com', 222, 'casado', '2022-12-08 00:00:00', 'empleado', 22, '2022-12-27 00:00:00'),
(22, 'ee', 2332, 22, 'wdwij@gmail.com', 2334, 'sacaso', '2022-12-13 14:33:41', 'sss', 30303, '2022-12-13 14:33:41'),
(23, 'ww', 3333, 22, 'we@gmail.com', 222, 'casado', '2022-12-13 00:00:00', 'eee', 322, '2022-12-13 00:00:00');

--
-- Disparadores `tbl_empleados`
--
DELIMITER $$
CREATE TRIGGER `delemple` AFTER DELETE ON `tbl_empleados` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_EMPLEADO,CURRENT_USER,"Empleado eliminado");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `emplere` AFTER INSERT ON `tbl_empleados` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(NEW.COD_EMPLEADO,CURRENT_USER,"Registro nuevo empleado");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upempl` AFTER UPDATE ON `tbl_empleados` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_EMPLEADO,CURRENT_USER,"Empleado actualizado");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_factura`
--

CREATE TABLE `tbl_factura` (
  `COD_FACTURA` int(8) NOT NULL,
  `NUMERO_FACTURA` int(255) NOT NULL,
  `NOMBRE_CLIENTE` varchar(255) NOT NULL,
  `RTN_CLIENTE` int(255) NOT NULL,
  `FECHA_FACTURACION` datetime NOT NULL,
  `CAI` varchar(16) NOT NULL,
  `PLATILLO` varchar(255) NOT NULL,
  `CANTIDAD_PLATILLO` int(255) NOT NULL,
  `PRECIO` int(255) NOT NULL,
  `IVA` int(255) NOT NULL,
  `TOTAL_FACTURA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_factura`
--

INSERT INTO `tbl_factura` (`COD_FACTURA`, `NUMERO_FACTURA`, `NOMBRE_CLIENTE`, `RTN_CLIENTE`, `FECHA_FACTURACION`, `CAI`, `PLATILLO`, `CANTIDAD_PLATILLO`, `PRECIO`, `IVA`, `TOTAL_FACTURA`) VALUES
(1, 1, 'hhhh', 3333, '2022-12-08 00:00:00', 'b8998', 'jamon', 1, 22, 13, '33'),
(2, 2, 'ddddddddddddd', 44444, '2022-12-08 00:00:00', 'DF33rrcf4', 'carne con tajadas', 2, 300, 23, '2000'),
(3, 33, 'EDDED', 3333, '2022-12-13 00:00:00', '323123', 'CM', 2, 22, 2, '2');

--
-- Disparadores `tbl_factura`
--
DELIMITER $$
CREATE TRIGGER `factu` AFTER INSERT ON `tbl_factura` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(NEW.COD_FACTURA,CURRENT_USER,"Registro nueva factura");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upfa` AFTER UPDATE ON `tbl_factura` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_FACTURA,CURRENT_USER,"Factura Actualizada");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventario`
--

CREATE TABLE `tbl_inventario` (
  `COD_PRODUCTO` int(8) NOT NULL,
  `NOMBRE_PRODUCTO` varchar(255) NOT NULL,
  `PRECIO_PRODUCTO` int(14) NOT NULL,
  `CANTIDAD_PRODUCTO` int(255) NOT NULL,
  `CATEGORIA_PRODUCTO` varchar(255) NOT NULL,
  `FECHA_VENCIMIENTO` datetime NOT NULL,
  `MAXIMO_PRODUCTO` int(255) NOT NULL,
  `MINIMO_PRODUCTO` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_inventario`
--

INSERT INTO `tbl_inventario` (`COD_PRODUCTO`, `NOMBRE_PRODUCTO`, `PRECIO_PRODUCTO`, `CANTIDAD_PRODUCTO`, `CATEGORIA_PRODUCTO`, `FECHA_VENCIMIENTO`, `MAXIMO_PRODUCTO`, `MINIMO_PRODUCTO`) VALUES
(1, 'CAMARON', 44, 10, 'Marisco', '2022-12-29 00:00:00', 1000, 2000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_platillo`
--

CREATE TABLE `tbl_platillo` (
  `COD_PLATILLO` int(8) NOT NULL,
  `NOMBRE_PLATILLO` varchar(255) NOT NULL,
  `PRECIO_PLATILLO` int(255) NOT NULL,
  `RECETA_PLATILLO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_platillo`
--

INSERT INTO `tbl_platillo` (`COD_PLATILLO`, `NOMBRE_PLATILLO`, `PRECIO_PLATILLO`, `RECETA_PLATILLO`) VALUES
(3, 'macaron con carne', 444, 'DDDDS'),
(5, 'ddddd', 3, 'ddd'),
(7, 'mm', 344, 'sksks'),
(8, 'WEEE', 23, 'SS'),
(9, 'EEE', 22, 'SS'),
(10, 'jdjdj', 30, 'ssms');

--
-- Disparadores `tbl_platillo`
--
DELIMITER $$
CREATE TRIGGER `delpla` AFTER DELETE ON `tbl_platillo` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_PLATILLO,CURRENT_USER,"Platillo eliminado");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `plabi` AFTER INSERT ON `tbl_platillo` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(NEW.COD_PLATILLO,CURRENT_USER,"Registro nuevo platillo");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `uppla` AFTER UPDATE ON `tbl_platillo` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_PLATILLO,CURRENT_USER,"platillo actualizado");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proveedor`
--

CREATE TABLE `tbl_proveedor` (
  `COD_PROVEEDOR` bigint(8) NOT NULL,
  `NOMBRE_PROVEEDOR` varchar(255) NOT NULL,
  `CELULAR_PROVEEDOR` int(8) NOT NULL,
  `PRODUCTO_VENTA` varchar(255) NOT NULL,
  `PRECIO_PRODUCTO` int(255) NOT NULL,
  `CIUDAD_PROVEEDOR` varchar(255) NOT NULL,
  `OBSERVACION` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_proveedor`
--

INSERT INTO `tbl_proveedor` (`COD_PROVEEDOR`, `NOMBRE_PROVEEDOR`, `CELULAR_PROVEEDOR`, `PRODUCTO_VENTA`, `PRECIO_PRODUCTO`, `CIUDAD_PROVEEDOR`, `OBSERVACION`) VALUES
(1, 'COCA COLA', 33456, 'COCA', 34, 'tegucigalpa', 'vende mas');

--
-- Disparadores `tbl_proveedor`
--
DELIMITER $$
CREATE TRIGGER `Prodel` AFTER DELETE ON `tbl_proveedor` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_PROVEEDOR,CURRENT_USER,"Proveedor eliminado");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `proup` AFTER UPDATE ON `tbl_proveedor` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(OLD.COD_PROVEEDOR,CURRENT_USER,"Proveedor actualizado");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `provbi` AFTER INSERT ON `tbl_proveedor` FOR EACH ROW BEGIN
INSERT into tbl_bitacora(NUM_BITACORA,USUARIO,ACCION_SISTEMA)VALUES(NEW.COD_PROVEEDOR,CURRENT_USER,"Registro nuevo proveedor");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `COD_ROL` int(8) NOT NULL,
  `ROL` varchar(255) NOT NULL,
  `USUARIO` varchar(255) NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_roles`
--

INSERT INTO `tbl_roles` (`COD_ROL`, `ROL`, `USUARIO`, `FECHA_REGISTRO`) VALUES
(1, 'aa', 'aa', '2022-12-07 00:00:00'),
(2, 'bb', 'bb', '2022-12-09 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'comidas noysita', 'noysitascomidas@gmail.com', '0000-00-00 00:00:00', '$2y$10$jTRwagf8b0Y93THDmBEHAu7T04LcSZvtVjGL7PP3CaP42BStB2jRm', 'jOnpcrImd3fv9HDhI5EeOF5Ks4TouZ58QQWIc4bTxRn7b7e5vsqzVxPBzvwO', '2022-10-13 12:06:21', '2022-10-13 12:06:21'),
(2, 'Daniel', 'daniel.aguileta@gmail.com', '0000-00-00 00:00:00', '$2y$10$mkhMs3Kmpbf1Hrz1kxx5Xe2no9F.q/VcSZmoF05YL5G0Td0EShW6.', '', '2022-10-15 12:08:23', '2022-10-15 12:08:23'),
(3, 'prueba', 'prueba@gmail.com', '2022-10-27 03:37:22', '12345678', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'edwin', 'edwin@gmail.com', '0000-00-00 00:00:00', '$2y$10$OJDkZEZpYWsxmHtJb/.jnOVNPpGPuKzB4sMfT.d40ukIsdrP98XDa', '', '2022-11-29 23:20:25', '2022-11-29 23:20:25');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD PRIMARY KEY (`COD_BITACORA`);

--
-- Indices de la tabla `tbl_cai`
--
ALTER TABLE `tbl_cai`
  ADD PRIMARY KEY (`COD_CAI`);

--
-- Indices de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`COD_CLIENTE`);

--
-- Indices de la tabla `tbl_compra`
--
ALTER TABLE `tbl_compra`
  ADD PRIMARY KEY (`COD_COMPRA`);

--
-- Indices de la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  ADD PRIMARY KEY (`COD_EMPLEADO`);

--
-- Indices de la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD PRIMARY KEY (`COD_FACTURA`);

--
-- Indices de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD PRIMARY KEY (`COD_PRODUCTO`);

--
-- Indices de la tabla `tbl_platillo`
--
ALTER TABLE `tbl_platillo`
  ADD PRIMARY KEY (`COD_PLATILLO`);

--
-- Indices de la tabla `tbl_proveedor`
--
ALTER TABLE `tbl_proveedor`
  ADD PRIMARY KEY (`COD_PROVEEDOR`);

--
-- Indices de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`COD_ROL`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  MODIFY `COD_BITACORA` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `tbl_cai`
--
ALTER TABLE `tbl_cai`
  MODIFY `COD_CAI` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  MODIFY `COD_CLIENTE` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_compra`
--
ALTER TABLE `tbl_compra`
  MODIFY `COD_COMPRA` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  MODIFY `COD_EMPLEADO` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  MODIFY `COD_FACTURA` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  MODIFY `COD_PRODUCTO` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_platillo`
--
ALTER TABLE `tbl_platillo`
  MODIFY `COD_PLATILLO` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_proveedor`
--
ALTER TABLE `tbl_proveedor`
  MODIFY `COD_PROVEEDOR` bigint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `COD_ROL` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
