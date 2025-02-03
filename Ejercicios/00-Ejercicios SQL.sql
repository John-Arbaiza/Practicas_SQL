-- Ejercicios 

-- 1.Seleccione todos datos de la tabla de clientes.
SELECT * FROM clientes;

-- 2.Lista los productos disponibles con su precio.
Select nombre, precio FROM productos;

-- 3.Muestra todos los pedidos realizados.
SELECT * FROM pedidos;

-- 4.Muestra los nombres de los clientes y sus pedidos (usando un JOIN).
Select cli.nombre, pro.nombre AS producto, Pedidos.cantidad
FROM Pedidos
JOIN clientes cli ON Pedidos.cliente_id = cli.cliente_id
JOIN productos pro ON Pedidos.producto_id = pro.producto_id;

-- 5.Listar los productos cuyo stock sea menor a 20 unidades.
SELECT * FROM productos where stock < 20;

-- 6.Actualizar el stock de un producto después de un pedido.
Update productos set stock = stock - 1
where producto_id = 1;


