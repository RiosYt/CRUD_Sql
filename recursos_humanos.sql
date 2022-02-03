-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-02-2022 a las 14:58:24
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `recursos_humanos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`` PROCEDURE `sp_ActualizarDepartamento` (IN `id` INT, IN `nombre` VARCHAR(45) CHARSET utf8, IN `sucursal_id` INT)  update departamento
	set Nombre=nombre,
    	Sucursal_Id=sucursal_id
    where Departamento_Id=id$$

CREATE DEFINER=`` PROCEDURE `sp_ActualizarDistrito` (IN `id` INT, IN `nombre` VARCHAR(45) CHARSET utf8)  update distrito
	set Nombre=nombre
    where Distrito_Id=id$$

CREATE DEFINER=`` PROCEDURE `sp_ActualizarEmpleado` (IN `id` INT, IN `tipo_doc` VARCHAR(30) CHARSET utf8, IN `nro_doc` VARCHAR(15) CHARSET utf8, IN `nombre` VARCHAR(50) CHARSET utf8, IN `apellido` VARCHAR(50) CHARSET utf8, IN `email` VARCHAR(100) CHARSET utf8, IN `telefono` VARCHAR(9) CHARSET utf8)  update empleado
	set Tipo_Documento=tipo_doc,
    	N_Coumento=nro_doc,
        Nombre=nombre,
        Apellido=apellido,
        Email=email,
        Telefono=telefono
    where Empleado_Id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizarPuestos` (IN `id` INT, IN `nombre` VARCHAR(50), IN `salarioMax` FLOAT, IN `salarioMin` FLOAT)  UPDATE Puesto 
	SET Nombre = nombre,
    	Salario_Maximo = salarioMax,
        Salario_Minimo = salarioMin
    WHERE Puesto_Id = id$$

CREATE DEFINER=`` PROCEDURE `sp_ActualizarSucursal` (IN `id` INT, IN `direccion` VARCHAR(45) CHARSET utf8, IN `distrito_id` INT)  update sucursal
	set Direccion=direccion,
    	Distrito_Id=distrito_id
    where Sucursal_Id=id$$

CREATE DEFINER=`` PROCEDURE `sp_ActualizarUsuario` (IN `id` INT, IN `nombre` VARCHAR(45) CHARSET utf8, IN `password` VARBINARY(8000))  update usuario
	set Nombre_usuario=nombre,
    	Password=password
    where Usuario_Id=id$$

CREATE DEFINER=`` PROCEDURE `sp_EliminarContrato` (IN `id` INT)  delete from empleado_contrato where Contrato_Id=id$$

CREATE DEFINER=`` PROCEDURE `sp_EliminarDepartamento` (IN `id` INT)  delete from departamento where Departamento_Id=id$$

CREATE DEFINER=`` PROCEDURE `sp_EliminarDistrito` (IN `id` INT)  delete from distrito where Distrito_Id=id$$

CREATE DEFINER=`` PROCEDURE `sp_EliminarEmpleado` (IN `id` INT)  delete from empleado where Empleado_Id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminarPuestos` (IN `id` INT)  DELETE FROM PUESTO WHERE Puesto_Id=id$$

CREATE DEFINER=`` PROCEDURE `sp_EliminarSucursal` (IN `id` INT)  delete from sucursal where Sucursal_Id=id$$

CREATE DEFINER=`` PROCEDURE `sp_EliminarUsuario` (IN `id` INT)  delete from usuario where Usuario_Id=id$$

CREATE DEFINER=`` PROCEDURE `sp_InsertarContrato` (IN `empleado_id` INT, IN `fecha_inicio` DATE, IN `fecha_fin` DATE, IN `sueldo` FLOAT, IN `puesto_id` INT, IN `depa_id` INT)  insert into empleado_contrato(Empleado_Id, Fecha_Inicio, Fecha_Termino, Sueldo, Puesto_Id, Departamento_Id) values(empleado_id, fecha_inicio, fecha_fin, sueldo, puesto_id, depa_id)$$

CREATE DEFINER=`` PROCEDURE `sp_InsertarDepartamento` (IN `nombre` VARCHAR(45) CHARSET utf8, IN `sucursal_id` INT)  insert into departamento(Nombre, Sucursal_Id) values(nombre, sucursal_id)$$

CREATE DEFINER=`` PROCEDURE `sp_InsertarDistrito` (IN `nombre` VARCHAR(45) CHARSET utf8)  insert into distrito(Nombre) VALUES(nombre)$$

CREATE DEFINER=`` PROCEDURE `sp_InsertarEmpleado` (IN `tipo_doc` VARCHAR(30) CHARSET utf8, IN `nro_doc` VARCHAR(15) CHARSET utf8, IN `nombre` VARCHAR(50) CHARSET utf8, IN `apellido` VARCHAR(50) CHARSET utf8, IN `email` VARCHAR(100) CHARSET utf8, IN `telefono` VARCHAR(9) CHARSET utf8)  INSERT INTO empleado(Tipo_Documento, N_Documento, Nombre, Apellido, Email, Telefono) VALUES(tipo_doc, nro_doc, nombre, apellido, email, telefono)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertarPuestos` (IN `nombre` VARCHAR(50) CHARSET utf8, IN `salarioMax` FLOAT, IN `salarioMin` FLOAT)  INSERT INTO puesto(Nombre, Salario_Maximo, Salario_Minimo)
VALUES(nombre, salarioMax, salarioMin)$$

CREATE DEFINER=`` PROCEDURE `sp_InsertarSucursal` (IN `direccion` VARCHAR(45) CHARSET utf8, IN `distrito_id` INT)  insert into sucursal(Direccion, Distrito_Id) values(direccion, distrito_id)$$

CREATE DEFINER=`` PROCEDURE `sp_InsertarUsuario` (IN `nombre` VARCHAR(45) CHARSET utf8, IN `password` VARBINARY(8000), IN `empleado_id` INT)  insert into usuario(Nombre_Usuario, Password, Empleado_Id) values(nombre, password, empleado_id)$$

CREATE DEFINER=`` PROCEDURE `sp_VerContrato` (IN `empleado_id` INT)  select * from empleado_contrato where Empleado_Id=id$$

CREATE DEFINER=`` PROCEDURE `sp_VerDepartamento` (IN `id` INT)  select * from departamento where Departamento_Id=id or id=0$$

CREATE DEFINER=`` PROCEDURE `sp_VerDistrito` (IN `id` INT)  select * from distrito where Distrito_Id=id or id=0$$

CREATE DEFINER=`` PROCEDURE `sp_VerEmpleado` (IN `id` INT)  select * from empleado where Empleado_Id=id or id=0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_VerPuestos` (IN `id` INT(0))  SELECT * FROM puesto WHERE Puesto_Id = id or id = 0$$

CREATE DEFINER=`` PROCEDURE `sp_VerSucursal` (IN `id` INT)  select * from sucursal where Sucursal_Id=id or id=0$$

CREATE DEFINER=`` PROCEDURE `sp_VerUsuario` (IN `id` INT)  select * from usuario where Usuario_Id=id or id=0$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `Departamento_Id` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Sucursal_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`Departamento_Id`, `Nombre`, `Sucursal_Id`) VALUES
(13, 'Ventas', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `Distrito_Id` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`Distrito_Id`, `Nombre`) VALUES
(1, 'La Molina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `Empleado_Id` int(11) NOT NULL,
  `Tipo_Documento` varchar(30) NOT NULL,
  `N_Documento` varchar(15) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telefono` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Empleado_Id`, `Tipo_Documento`, `N_Documento`, `Nombre`, `Apellido`, `Email`, `Telefono`) VALUES
(1, 'DNI', '75095122', 'Hugo', 'Rios', 'hugorios405@gmail.com', '987970324');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_contrato`
--

CREATE TABLE `empleado_contrato` (
  `Contrato_Id` int(11) NOT NULL,
  `Empleado_Id` int(11) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Termino` date NOT NULL,
  `Sueldo` float NOT NULL,
  `Puesto_Id` int(11) NOT NULL,
  `Departamento_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado_contrato`
--

INSERT INTO `empleado_contrato` (`Contrato_Id`, `Empleado_Id`, `Fecha_Inicio`, `Fecha_Termino`, `Sueldo`, `Puesto_Id`, `Departamento_Id`) VALUES
(3, 1, '0000-00-00', '0000-00-00', 5000, 1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `Puesto_Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Salario_Maximo` float NOT NULL,
  `Salario_Minimo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`Puesto_Id`, `Nombre`, `Salario_Maximo`, `Salario_Minimo`) VALUES
(1, 'Asistente', 125, 50),
(2, 'Jefe de Negocios', 500.25, 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `Sucursal_Id` int(11) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Distrito_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`Sucursal_Id`, `Direccion`, `Distrito_Id`) VALUES
(3, 'San Miguel 505', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Usuario_Id` int(11) NOT NULL,
  `Nombre_usuario` varchar(45) NOT NULL,
  `Password` varbinary(8000) NOT NULL,
  `Empleado_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Usuario_Id`, `Nombre_usuario`, `Password`, `Empleado_Id`) VALUES
(0, 'Rios26', 0x77726573746c656d616e6961, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`Departamento_Id`,`Sucursal_Id`),
  ADD UNIQUE KEY `Nombre_UNIQUE` (`Nombre`),
  ADD KEY `fk_DEPARTAMENTO_SUCURSAL1_idx` (`Sucursal_Id`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`Distrito_Id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Empleado_Id`);

--
-- Indices de la tabla `empleado_contrato`
--
ALTER TABLE `empleado_contrato`
  ADD PRIMARY KEY (`Contrato_Id`,`Empleado_Id`,`Puesto_Id`,`Departamento_Id`),
  ADD KEY `fk_EMPLEADO_CONTRATO_Empleado_idx` (`Empleado_Id`),
  ADD KEY `fk_EMPLEADO_CONTRATO_PUESTO1_idx` (`Puesto_Id`),
  ADD KEY `fk_EMPLEADO_CONTRATO_DEPARTAMENTO1_idx` (`Departamento_Id`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`Puesto_Id`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`Sucursal_Id`,`Distrito_Id`),
  ADD KEY `fk_sucursal_distrito1_idx` (`Distrito_Id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Usuario_Id`,`Empleado_Id`),
  ADD KEY `fk_USUARIO_EMPLEADO1_idx` (`Empleado_Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `Departamento_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `Distrito_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `Empleado_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleado_contrato`
--
ALTER TABLE `empleado_contrato`
  MODIFY `Contrato_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `puesto`
--
ALTER TABLE `puesto`
  MODIFY `Puesto_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `Sucursal_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `fk_DEPARTAMENTO_SUCURSAL1` FOREIGN KEY (`Sucursal_Id`) REFERENCES `sucursal` (`Sucursal_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado_contrato`
--
ALTER TABLE `empleado_contrato`
  ADD CONSTRAINT `fk_EMPLEADO_CONTRATO_DEPARTAMENTO1` FOREIGN KEY (`Departamento_Id`) REFERENCES `departamento` (`Departamento_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_EMPLEADO_CONTRATO_Empleado` FOREIGN KEY (`Empleado_Id`) REFERENCES `empleado` (`Empleado_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_EMPLEADO_CONTRATO_PUESTO1` FOREIGN KEY (`Puesto_Id`) REFERENCES `puesto` (`Puesto_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `fk_sucursal_distrito1` FOREIGN KEY (`Distrito_Id`) REFERENCES `distrito` (`Distrito_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_USUARIO_EMPLEADO1` FOREIGN KEY (`Empleado_Id`) REFERENCES `empleado` (`Empleado_Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
