<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <!-- Brand -->

    <!-- Toggler/collapsibe Button -->
    <%--<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">

    </div>--%> 

    <a class="navbar-brand h5" href="ControladorCarrito?accion=Carr&menu=Carrito">
        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="25" fill="currentColor" class="bi bi-cart4" viewBox="0 0 1 16">
            <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
        </svg>
        <i class="fas fa-cart-plus">( <label style="color: orange">${contador}</label> )</i>
    </a>
    <div class="dropdown dropright" style="margin-right: 8vh;">
        <a class="navbar-brand " data-toggle="dropdown">
            <img src="img/PFL.png" alt="Logo" style="width:30px;">
        </a>
        <div  style=" width:200px;" class="dropdown-menu">
            <center>
                <img src="img/PFL.png"  style="width:100px;">
            </center>
            <div class="dropdown-divider"></div>
            <center>
                <div>
                    <a>${Usu.getNombres()}</a>
                </div>
                <div>
                    <a class="dropdown-item" href="index.jsp">Cerrar Sesion</a>
                </div>
            </center>
        </div>
    </div>

</nav>