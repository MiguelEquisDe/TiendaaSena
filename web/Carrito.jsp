<%-- 
    Document   : Carrito
    Created on : 13/01/2022, 09:35:10 PM
    Author     : varga
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <%@include file="commons/CDN(4).jsp"%>
        <link rel="stylesheet" href="css/Global_U.jsp" type="text/css">
    </head>
    <body>
        <%@include file="commons/Co_Usu/Cabecera_U.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 sidebar-col">
                    <%@include file="commons/Co_Usu/SideBar_U.jsp" %>
                </div>
                <div class="col-sm-9 main-col ">
                    <br>
                    <table style=" margin-top: 3%;width:  113%;" class="table table-bordered">
                        <thead>
                        <th  class="bg-dark text-white" colspan="9">
                            <h1>
                                <center>
                                    <b>Productos del Carrito</b>
                                </center>
                            </h1>
                        </th>
                        <tr class="bg-dark text-white">
                            <th>Imagen</th>
                            <th>Nombre</th>
                            <th>Costo</th>
                            <th>Descripcion</th>
                            <th>Opciones</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="carrito" items="${car}">
                                <tr>
                                    <td>
                                        <img src="ControladorImg?id=${carrito.getId_producto()}" style="width: 100px; height: 100px;">
                                    </td>
                                    <td>${carrito.getNombre() }</td>
                                    <td>${carrito.getPrecioFinal()}</td>
                                    <td>${carrito.getDescrip()}</td>
                                    <td>
                            <center>
                                <a href="ControladorCarrito?accion=Carr&menu=Eliminar&id=${carrito.getId_producto()}" class="btn btn-outline-danger">
                                    <b>Borrar</b>
                                </a>
                            </center>
                            </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <table style=" margin-top: 3%;width:  50%;" class="table table-bordered">
                        <thead>
                            <tr class="bg-dark text-white">
                                <th>Cantidad de Productos</th>
                                <th>Valor Total</th>
                                <th>Opciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="carrito" items="${car}">
                                <tr>
                                    <td>${carrito.getNombre() }</td>
                                    <td>${carrito.getPrecioFinal()}</td>
                                    <td>
                            <center>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                    <b>Comprar</b>
                                </button>

                                <!-- The Modal -->
                                <div class="modal fade" id="myModal">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Realizar Compra</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                ¿Desea finalizar la compra?
                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <a href="ControladorCarrito?accion=Carr&menu=Pagar&id=${carrito.getId_producto()}" class="btn btn-primary">Si</a>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </center>
                            </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div> 
        </div> 
    </body>
</html>

