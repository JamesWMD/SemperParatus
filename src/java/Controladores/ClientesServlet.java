package Controladores;

import DAO.ClientesDAO;
import Modelos.Clientes;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ClientesServlet extends HttpServlet {

    private ClientesDAO clieDao = new ClientesDAO();
    private final String pagListar = "clientesLista.jsp"; // pagina donde se va mostrar la lista de productos.
    private final String formClientes = "clientes.jsp"; // pagina donde se ver el formulario de gestion de Productos.
    private final String pagPrinc = "panelPrincipal.jsp";

    private static final long serialVersionUID = 1L;
    private ClientesDAO clienteDAO;

    public void init() {
        clienteDAO = new ClientesDAO();
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

            default:
                throw new AssertionError();
        }
    }

    /* =================== LIMPIAR FORMULARIO CLIENTE ==========================*/
    protected void limpiarFormulario(HttpServletRequest request, HttpServletResponse response)//FUNCIONA
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Crear objeto CLIENTE
        Clientes obj = new Clientes();
        obj.setIdCliente("");
        obj.setTipoDocumento("");
        obj.setNombreCliente("");
        obj.setApellidoCliente("");
        obj.setTelefonoCliente("");
        obj.setDireccionCliente(""); 
        

        request.getRequestDispatcher(formClientes).forward(request, response);

    }

    /* =================== CERRAR FORMULARIO CLIENTE ==========================*/
    protected void cerrar(HttpServletRequest request, HttpServletResponse response)//FUNCIONA
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.getRequestDispatcher(pagPrinc).forward(request, response);

    }

    /* ============================= LISTAR CLIENTE ==========================*/
    protected void listar(HttpServletRequest request, HttpServletResponse response)// FUNCIONA
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("clientes", clieDao.ListarTodosClientes());
        request.getRequestDispatcher(pagListar).forward(request, response);

    }

    /*=============================== NUEVO CLIENTE ==============================*/
    protected void nuevo(HttpServletRequest request, HttpServletResponse response) //FUNCIONA
            throws ServletException, IOException {

        request.setAttribute("clientes", new Clientes());
        request.getRequestDispatcher(formClientes).forward(request, response);

    }

    /* ============================= GUARDAR CLIENTE ==========================*/
    private void guardar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener valores del formulario
        String idCliente = request.getParameter("idCliente");
        String tipoDocumento = request.getParameter("tipoDocumento");
        String nombreCliente = request.getParameter("nombreCliente");
        String apellidoCliente = request.getParameter("apellidoCliente"); 
        String telefonoCliente = request.getParameter("telefonoCliente");
        String direccionCliente  = request.getParameter("direccionCliente");
       

        // Validar que los campos no sean nulos o vacíos
        if (idCliente == null || idCliente.trim().isEmpty()
                || tipoDocumento == null || tipoDocumento.trim().isEmpty()
                || nombreCliente == null || nombreCliente.trim().isEmpty()
                || apellidoCliente == null || apellidoCliente.trim().isEmpty()
                || telefonoCliente == null || telefonoCliente.trim().isEmpty()
                || direccionCliente == null || direccionCliente.trim().isEmpty()) {

            request.setAttribute("error", "Todos los campos son obligatorios");
            request.getRequestDispatcher(pagListar).forward(request, response);
            return; // Detener ejecución
        }

       
        // Crear objeto cliente
        Clientes obj = new Clientes();
        obj.setIdCliente(idCliente.trim());
        obj.setTipoDocumento(tipoDocumento.trim());
        obj.setNombreCliente(nombreCliente.trim());
        obj.setApellidoCliente(apellidoCliente.trim());
        obj.setTelefonoCliente(telefonoCliente.trim());
        obj.setDireccionCliente(direccionCliente.trim());

        // Guardar producto
        int result = clieDao.registrarCliente(obj);
        
        if (result == -1) {
            request.setAttribute("mensaje", "ERROR: EL CLIENTE YA EXISTE");
        } else if (result > 0) {
            request.setAttribute("mensaje", "CLIENTE REGISTRADO CORRECTAMENTE");
            request.getRequestDispatcher(formClientes).forward(request, response);
        } else {
            request.setAttribute("mensaje", "ERROR: CLIENTE NO REGISTRADO");
            request.setAttribute("cliente", obj); // Devolver datos en caso de error
            request.getRequestDispatcher(formClientes).forward(request, response);
        }
        //request.setAttribute("clientes", clieDao.ListarTodosClientes());
        request.getRequestDispatcher(formClientes).forward(request, response);
    }

    /* ============================= SELECCIONAR CLIENTE ==========================*/
    private void seleccionar(HttpServletRequest request, HttpServletResponse response) //FUNCIONA
            throws ServletException, IOException {

        String idCliente = request.getParameter("idCliente");

        Clientes obj = clieDao.buscarCliente(idCliente);

        if (obj != null) {
            request.setAttribute("cliente", obj); // Clave correcta en el JSP
            request.getRequestDispatcher(formClientes).forward(request, response);
        } else {
            request.getSession().setAttribute("error", "No se encontro cliente con ID " + idCliente);
            response.sendRedirect("ClientesServlet?action=listar");
        }

    }

    /* ============================= BUSCAR CLIENTES ==========================*/
    private void buscar(HttpServletRequest request, HttpServletResponse response)// FUNCIONA
            throws ServletException, IOException {
        String idCliente = request.getParameter("idCliente");

        if (idCliente == null || idCliente.trim().isEmpty()) {
            request.setAttribute("mensaje", "Debe ingresar el ID del Cliente.");
            request.getRequestDispatcher(formClientes).forward(request, response);
            return;
        }

        Clientes cliente = clieDao.buscarCliente(idCliente);

        if (cliente != null) {
            request.setAttribute("cliente", cliente);
            request.setAttribute("mensaje", "Cliente encontrado.");
        } else {
            request.setAttribute("mensaje", "Cliente no encontrado.");
        }

        request.getRequestDispatcher(formClientes).forward(request, response);
    }

    /* ============================= MODIFICAR PRODUCTOS ==========================*/
    private void modificar(HttpServletRequest request, HttpServletResponse response)  //FUNCIONES
            throws ServletException, IOException {

        // Obtener valores del formulario
        String idCliente = request.getParameter("idCliente");
        String tipoDocumento = request.getParameter("tipoDocumento");
        String nombreCliente = request.getParameter("nombreCliente");
        String apellidoCliente = request.getParameter("apellidoCliente"); 
        String telefonoCliente = request.getParameter("telefonoCliente");
        String direccionCliente  = request.getParameter("direccionCliente");

        // Validar que los campos no sean nulos o vacíos
        if (idCliente == null || idCliente.trim().isEmpty()
                || tipoDocumento == null || tipoDocumento.trim().isEmpty()
                || nombreCliente == null || nombreCliente.trim().isEmpty()
                || apellidoCliente == null || apellidoCliente.trim().isEmpty()
                || telefonoCliente == null || telefonoCliente.trim().isEmpty()
                || direccionCliente == null || direccionCliente.trim().isEmpty()
                ) {

            request.setAttribute("error", "Todos los campos son obligatorios");
            request.getRequestDispatcher(pagListar).forward(request, response);
            return; // Detener ejecución
        }

        //Crear objeto cliente
        Clientes obj = new Clientes();
        obj.setIdCliente(idCliente.trim());
        obj.setTipoDocumento(tipoDocumento.trim());
        obj.setNombreCliente(nombreCliente.trim());
        obj.setApellidoCliente(apellidoCliente.trim());
        obj.setTelefonoCliente(telefonoCliente.trim());
        obj.setDireccionCliente(direccionCliente.trim());

        // Modificar el producto
        int result = clieDao.editarCliente(obj);

        if (result > 0) {
            request.getSession().setAttribute("success", "El cliente con el ID " + "'" + idCliente + "'" + " fue modificado exitosamente.");
        } else {
            request.getSession().setAttribute("error", "El cliente con el ID " + "'" + idCliente + "'" + " NO EXISTE");
            request.setAttribute("cliente", obj); // Devolver datos en caso de error
        }
        
        request.setAttribute("clientes", clieDao.ListarTodosClientes());
        request.getRequestDispatcher(pagListar).forward(request, response);
    }

    /* ============================= ELIMINAR PRODUCTOS ==========================*/
    private void eliminar(HttpServletRequest request, HttpServletResponse response) //FUNCIONA
            throws ServletException, IOException {

        // Obtener valores del formulario
        String idCliente = request.getParameter("idCliente");

        // Validar que no sean nulos o vacíos
        if (idCliente == null || idCliente.trim().isEmpty()) {

            request.setAttribute("mensaje", "Todos los campos son obligatorios");
            request.getRequestDispatcher(pagListar).forward(request, response);
            return; // Detener ejecución
        }

        // Crear objeto Cliente
        Clientes obj = new Clientes();
        obj.setIdCliente(idCliente.trim());
        // elimina cliente
        int result = clieDao.eliminarCliente(idCliente);

        if (result > 0) {
            request.getSession().setAttribute("success", "El cliente con el ID " + "'" + idCliente + "'" + " fue eliminado Exitosamente");
        } else {
            request.getSession().setAttribute("error", "No se pudo eliminar El cliente con el ID" + idCliente);
        }

        request.setAttribute("clientes", clieDao.ListarTodosClientes());
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
