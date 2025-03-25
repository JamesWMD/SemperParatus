package Controladores;

import DAO.ProductosDAO;
import Modelos.Productos;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ProductosServlet extends HttpServlet {

    private ProductosDAO prodDao = new ProductosDAO();
    private final String pagListar = "productosLista.jsp"; // pagina donde se va mostrar la lista de productos.
    private final String formProductos = "productos.jsp"; // pagina donde se ver el formulario de gestion de Productos.
    private final String pagPrinc = "panelPrincipal.jsp";
    
    
    private static final long serialVersionUID = 1L;
    private ProductosDAO productoDAO;

    public void init() {
        productoDAO = new ProductosDAO();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
String action = request.getParameter("action");
                
        switch (action) {
            case "listar":
                listar(request, response);
                break;
            case "nuevo":
                nuevo(request, response);
                break;
            case "guardar":
                guardar(request, response);
                break;
            case "buscar":
                buscar(request, response);
                break;
            case "seleccionar":
                seleccionar(request, response);
                break;
            case "modificar":
                modificar(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
            case "cerrar":
                cerrar(request, response);
                break;
            case "limpiar":
                limpiarFormulario(request, response);
                break;
            case "filtrar":
                filtrar(request, response);
                break;
            
            default:
                throw new AssertionError();
        }
    }
    /* =================== LIMPIAR FORMULARIO PRODUCTOS ==========================*/
    protected void limpiarFormulario(HttpServletRequest request, HttpServletResponse response)//FUNCIONA
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Crear objeto producto
        Productos obj = new Productos();
        obj.setCodigoProducto("");
        obj.setNombreProducto("");
        obj.setCategoria("");
        obj.setPrecio(BigDecimal.ZERO);
        obj.setStock(0);
        obj.setEstado(""); // Estado ya se obtiene del select
        obj.setDescripcion("");
        
        request.getRequestDispatcher(formProductos).forward(request, response);

    }

    /* =================== CERRAR FORMULARIO PRODUCTOS ==========================*/
    protected void cerrar(HttpServletRequest request, HttpServletResponse response)//FUNCIONA
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.getRequestDispatcher(pagPrinc).forward(request, response);

    }
    
    
    /* ============================= LISTAR PRODUCTOS ==========================*/
    protected void listar(HttpServletRequest request, HttpServletResponse response)// FUNCIONA
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("productos", prodDao.ListarTodosProductos());
        request.getRequestDispatcher(pagListar).forward(request, response);

    }
    
    /*=============================== NUEVO PRODUCTO ==============================*/
    protected void nuevo(HttpServletRequest request, HttpServletResponse response) //FUNCIONA
            throws ServletException, IOException {

        request.setAttribute("productos", new Productos());
        request.getRequestDispatcher(formProductos).forward(request, response);

    }
    
    /* ============================= GUARDAR PRODUCTOS ==========================*/ 
    private void guardar(HttpServletRequest request, HttpServletResponse response) // FUNCIONA
        throws ServletException, IOException {

    // Obtener valores del formulario
    String codigoProducto = request.getParameter("codigoProducto");
    String nombreProducto = request.getParameter("nombreProducto");
    String categoria = request.getParameter("categoria");
    String precioStr = request.getParameter("precio"); // Obtener el precio como String
    String stockStr = request.getParameter("stock");
    String estado = request.getParameter("estado");
    String descripcion = request.getParameter("descripcion");

    // Validar que los campos no sean nulos o vacíos
    if (codigoProducto == null || codigoProducto.trim().isEmpty()
            || nombreProducto == null || nombreProducto.trim().isEmpty()
            || categoria == null || categoria.trim().isEmpty()
            || precioStr == null || precioStr.trim().isEmpty()
            || stockStr == null || stockStr.trim().isEmpty()
            || estado == null || estado.trim().isEmpty()
            || descripcion == null || descripcion.trim().isEmpty()) {

        request.setAttribute("mensaje", "Todos los campos son obligatorios");
        request.getRequestDispatcher(formProductos).forward(request, response);
        return; // Detener ejecución
    }

    // Procesar precio eliminando comas y convirtiéndolo en BigDecimal
    BigDecimal precio;
    try {
        precioStr = precioStr.replace(",", ""); // Eliminar separadores de miles
        precio = new BigDecimal(precioStr);
        if (precio.compareTo(BigDecimal.ZERO) <= 0) {
            throw new NumberFormatException(); // Asegurar que el precio sea positivo
        }
    } catch (NumberFormatException e) {
        request.setAttribute("mensaje", "El precio debe ser un número válido y mayor a 0.");
        request.getRequestDispatcher(formProductos).forward(request, response);
        return;
    }

    // Procesar stock asegurando que es un número entero válido y positivo
    int stock;
    try {
        stock = Integer.parseInt(stockStr);
        if (stock <= 0) {
            throw new NumberFormatException();
        }
    } catch (NumberFormatException e) {
        request.setAttribute("error", "El stock debe ser un número entero mayor a 0.");
        request.getRequestDispatcher(pagListar).forward(request, response);
        return;
    }

    // Crear objeto producto
    Productos obj = new Productos();
    obj.setCodigoProducto(codigoProducto.trim());
    obj.setNombreProducto(nombreProducto.trim());
    obj.setCategoria(categoria.trim());
    obj.setPrecio(precio);
    obj.setStock(stock);
    obj.setEstado(estado.trim());
    obj.setDescripcion(descripcion.trim());

    // Guardar producto
    int result = prodDao.registrarProducto(obj);

    if (result == -1) {
        request.setAttribute("mensaje", "ERROR: EL PRODUCTO YA EXISTE");
    } else if (result > 0) {
        request.setAttribute("mensaje", "PRODUCTO REGISTRADO CORRECTAMENTE");
        request.getRequestDispatcher(formProductos).forward(request, response);
    } else {
        request.setAttribute("mensaje", "ERROR: PRODUCTO NO REGISTRADO");
        request.setAttribute("cliente", obj); // Devolver datos en caso de error
        request.getRequestDispatcher(formProductos).forward(request, response);
    }
    //request.setAttribute("productos", prodDao.ListarTodosProductos());
    request.getRequestDispatcher(formProductos).forward(request, response);
}

    
    /* ============================= SELECCIONAR PRODUCTOS ==========================*/
    private void seleccionar(HttpServletRequest request, HttpServletResponse response) //FUNCIONA
            throws ServletException, IOException {

        String codigoProducto = request.getParameter("codigoProducto");

        Productos obj = prodDao.buscarProducto(codigoProducto);

        if (obj != null) {
            request.setAttribute("producto", obj); // Clave correcta en el JSP
            request.getRequestDispatcher(formProductos).forward(request, response);
        } else {
            request.getSession().setAttribute("error", "No se encontro producto con codigo " + codigoProducto);
            response.sendRedirect("ProductosServlet?action=listar");
        }

    }
    
    /* ============================= BUSCAR PRODUCTOS ==========================*/
    private void buscar(HttpServletRequest request, HttpServletResponse response)// FUNCIONA
            throws ServletException, IOException {
        String codigoProducto = request.getParameter("codigoProducto");

        if (codigoProducto == null || codigoProducto.trim().isEmpty()) {
            request.setAttribute("mensaje", "DEBE INGRESAR EL CODIGO DEL PRODUCTO.");
            request.getRequestDispatcher(formProductos).forward(request, response);
            return;
        }

        Productos producto = prodDao.buscarProducto(codigoProducto);

        if (producto != null) {
            request.setAttribute("producto", producto);
            request.setAttribute("mensaje", "PRODUCTO ENCONTRADO.");
        } else {
            request.setAttribute("mensaje", "PRODUCTO NO ENCONTRADO.");
        }

        request.getRequestDispatcher(formProductos).forward(request, response);
    }
    
    /* ============================= MODIFICAR PRODUCTOS ==========================*/
            
    private void modificar(HttpServletRequest request, HttpServletResponse response)// MODIFICA EL PRODUCTOEN LA BASE DE DATOS. PERO NO MUESTRA LA LISTA DE PRODUCTOS NE LA INTERFAZ
            throws ServletException, IOException {

        // Obtener valores del formulario
        String codigoProducto = request.getParameter("codigoProducto");
        String nombreProducto = request.getParameter("nombreProducto");
        String categoria = request.getParameter("categoria");
        String precioStr = request.getParameter("precio");
        String stockStr = request.getParameter("stock");
        String estado = request.getParameter("estado");
        String descripcion = request.getParameter("descripcion");

        // Validar campos nulos o vacíos antes de la conversión
        if (codigoProducto == null || codigoProducto.trim().isEmpty()
                || nombreProducto == null || nombreProducto.trim().isEmpty()
                || categoria == null || categoria.trim().isEmpty()
                //|| precioStr == null || precioStr.trim().isEmpty()
                //|| stockStr == null || stockStr.trim().isEmpty()
                || estado == null || estado.trim().isEmpty()
                || descripcion == null || descripcion.trim().isEmpty()) {

            request.setAttribute("error", "Todos los campos son obligatorios");
            request.getRequestDispatcher(pagListar).forward(request, response);
            return; // Detener ejecución
        }

        // Convertir precio y stock con manejo de excepciones
        BigDecimal precio;
        int stock;
        try {
            precio = new BigDecimal(precioStr);
            stock = Integer.parseInt(stockStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "El precio y el stock deben ser valores numéricos válidos.");
            request.getRequestDispatcher(pagListar).forward(request, response);
            return;
        }

        // Validar valores de precio y stock
        if (precio.compareTo(BigDecimal.ZERO) <= 0 || stock < 0) {
            request.setAttribute("error", "El precio debe ser mayor a 0 y el stock no puede ser negativo.");
            request.getRequestDispatcher(pagListar).forward(request, response);
            return;
        }

        // Crear objeto producto
        Productos obj = new Productos();
        obj.setCodigoProducto(codigoProducto.trim());
        obj.setNombreProducto(nombreProducto.trim());
        obj.setCategoria(categoria.trim());
        obj.setPrecio(precio);
        obj.setStock(stock);
        obj.setEstado(estado.trim());
        obj.setDescripcion(descripcion.trim());

        // Modificar el producto
        int result = prodDao.editarProducto(obj);

        if (result > 0) {
            request.getSession().setAttribute("mensaje", "El producto con el código " +"'" + codigoProducto + "'" +" fue modificado exitosamente.");
        } else {
            request.getSession().setAttribute("mensaje", "El producto con el codigo " + "'" + codigoProducto + "'" + " NO EXISTE");
            request.setAttribute("producto", obj); // Devolver datos en caso de error
        }
        //request.setAttribute("productos", prodDao.ListarTodosProductos());
        request.getRequestDispatcher(formProductos).forward(request, response);
    }

    
    /* ============================= ELIMINAR PRODUCTOS ==========================*/
    private void eliminar(HttpServletRequest request, HttpServletResponse response) //FUNCIONA
            throws ServletException, IOException {

        // Obtener valores del formulario
        String codigoProducto = request.getParameter("codigoProducto");

        // Validar que no sean nulos o vacíos
        if (codigoProducto == null || codigoProducto.trim().isEmpty()) {

            request.setAttribute("mensaje", "Todos los campos son obligatorios");
            request.getRequestDispatcher(pagListar).forward(request, response);
            return; // Detener ejecución
        }

        // Crear objeto Producto
        Productos obj = new Productos();
        obj.setCodigoProducto(codigoProducto.trim());
        // elimina producto
        int result = prodDao.eliminarProducto(codigoProducto);

        if (result > 0) {
            request.getSession().setAttribute("success", "El producto con el codigo " + "'" + codigoProducto + "'" + " fue eliminado Exitosamente");
        } else {
            request.getSession().setAttribute("error", "No se pudo eliminar el producto con el codigo" + codigoProducto);
        }
        
        request.setAttribute("productos", prodDao.ListarTodosProductos());
        request.getRequestDispatcher(pagListar).forward(request, response);
        
    }
    
    /* ============================= FILTRAR PRODUCTOS ==========================*/
    private void filtrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener valores de los filtros
        String nombre = request.getParameter("nombreProducto");
        String categoria = request.getParameter("categoria");
        String estado = request.getParameter("estado");

        // Llamar al método de filtrado en el DAO
        request.setAttribute("productos", prodDao.filtrarProductos(nombre, categoria, estado));

        // Redirigir a la página de lista de productos
        request.getRequestDispatcher(pagListar).forward(request, response);
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
