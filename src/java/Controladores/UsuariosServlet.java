/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import DAO.UsuariosDAO;
import Modelos.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UsuariosServlet extends HttpServlet {

    private UsuariosDAO userDao = new UsuariosDAO();
    private final String pagListar = "UsuarioLista.jsp"; // pagina donde se va mostrar la lista de usuarios.
    private final String formUser = "Usuarios.jsp"; // pagina donde se va mostrar el formulario de gestion de usuarios.
    private final String pagPrinc = "panelPrincipal.jsp";
    
    private static final long serialVersionUID = 1L;
    private UsuariosDAO usuariosDAO;

    public void init() {
        usuariosDAO = new UsuariosDAO();
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
            
            default:
                throw new AssertionError();
        }
    }
    
    /* ===================== CERRAR FORMULARIO DE USUARIOS =====================*/
    protected void cerrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.getRequestDispatcher(pagPrinc).forward(request, response);

    }
    
    /* ============================= LISTAR USUARIOS ==========================*/
    protected void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("usuarios", userDao.ListarTodosUsuario());
        request.getRequestDispatcher(pagListar).forward(request, response);

    }
    
    /*===============================NUEVO USUARIOS==============================*/
    protected void nuevo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("usuarios", new Usuarios());
        request.getRequestDispatcher(formUser).forward(request, response);

    }
    
    /* ============================= GUARDAR USUARIOS ==========================*/
    private void guardar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener valores del formulario
        String noIdentificacion = request.getParameter("noIdentificacion");
        String nombreUsuario = request.getParameter("nombreUsuario");
        String password = request.getParameter("password");
        String estado = request.getParameter("estado");

        // Validar que no sean nulos o vacíos
        if (noIdentificacion == null || noIdentificacion.trim().isEmpty()
                || nombreUsuario == null || nombreUsuario.trim().isEmpty()
                || password == null || password.trim().isEmpty()
                || estado == null || estado.trim().isEmpty()) {

            request.setAttribute("mensaje", "Todos los campos son obligatorios");
            request.getRequestDispatcher(pagListar).forward(request, response);
            return; // Detener ejecución
        }

        // Crear objeto usuario
        Usuarios obj = new Usuarios();
        obj.setNoIdentificacion(noIdentificacion.trim());
        obj.setNombreUsuario(nombreUsuario.trim());
        obj.setPassword(password.trim());
        obj.setEstado(estado.trim()); // Estado ya se obtiene del select

        // Guardar usuario
        int result = userDao.registrarUsuario(obj);

        if (result > 0) {
            request.setAttribute("mensaje", "USUARIO REGISTRADO CORRECTAMENTE");
        } else {
            request.setAttribute("mensaje", "ERROR: USUARIO NO REGISTRADO");
            request.setAttribute("usuarios", obj); // Devolver datos en caso de error
        }
        request.setAttribute("usuarios", userDao.ListarTodosUsuario());
        request.getRequestDispatcher(pagListar).forward(request, response);
    }
    
    /* ============================= EDITAR USUARIOS ==========================*/
    private void seleccionar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String noIdentificacion = request.getParameter("noIdentificacion");

        Usuarios obj = userDao.buscarUsuario(noIdentificacion);

        if (obj != null) {
            request.setAttribute("usuario", obj); // Clave correcta en el JSP
            request.getRequestDispatcher(formUser).forward(request, response);
        } else {
            request.getSession().setAttribute("error", "No se encontro usuario con No. Identificacion " + noIdentificacion);
            response.sendRedirect("UsuariosServlet?action=listar");
        }

    }
    
    /* ============================= BUSCAR USUARIOS ==========================*/
    private void buscar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String noIdentificacion = request.getParameter("noIdentificacion");

        if (noIdentificacion == null || noIdentificacion.trim().isEmpty()) {
            request.setAttribute("mensaje", "Debe ingresar un número de identificación.");
            request.getRequestDispatcher(formUser).forward(request, response);
            return;
        }

        Usuarios usuario = userDao.buscarUsuario(noIdentificacion);

        if (usuario != null) {
            request.setAttribute("usuario", usuario);
            request.setAttribute("mensaje", "Usuario encontrado.");
        } else {
            request.setAttribute("mensaje", "Usuario no encontrado.");
        }

        request.getRequestDispatcher(formUser).forward(request, response);
    }
    
    /* ============================= MODIFICAR USUARIOS ==========================*/
    
    private void modificar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener valores del formulario
        String noIdentificacion = request.getParameter("noIdentificacion");
        String nombreUsuario = request.getParameter("nombreUsuario");
        String password = request.getParameter("password");
        String estado = request.getParameter("estado");

        // Validar que no sean nulos o vacíos
        if (noIdentificacion == null || noIdentificacion.trim().isEmpty()
                || nombreUsuario == null || nombreUsuario.trim().isEmpty()
                || password == null || password.trim().isEmpty()
                || estado == null || estado.trim().isEmpty()) {

            request.setAttribute("mensaje", "Todos los campos son obligatorios");
            request.getRequestDispatcher(pagListar).forward(request, response);
            return; // Detener ejecución
        }

        // Crear objeto usuario
        Usuarios obj = new Usuarios();
        obj.setNoIdentificacion(noIdentificacion.trim());
        obj.setNombreUsuario(nombreUsuario.trim());
        obj.setPassword(password.trim());
        obj.setEstado(estado.trim()); // Estado ya se obtiene del select

        // Modifica el usuario
        int result = userDao.editarUsuario(obj);

        if (result > 0) {
            request.getSession().setAttribute("success", "El usuario con No. Identificacion " + noIdentificacion + " fue modificado Exitosamente");
        } else {
            request.getSession().setAttribute("error", "No se encontro usuario con No. Identificacion " + noIdentificacion);
            request.setAttribute("usuarios", obj); // Devolver datos en caso de error
        }
        request.setAttribute("usuarios", userDao.ListarTodosUsuario());
        request.getRequestDispatcher(pagListar).forward(request, response);
    }
    
    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener valores del formulario
        String noIdentificacion = request.getParameter("noIdentificacion");

        // Validar que no sean nulos o vacíos
        if (noIdentificacion == null || noIdentificacion.trim().isEmpty()) {

            request.setAttribute("mensaje", "Todos los campos son obligatorios");
            request.getRequestDispatcher(pagListar).forward(request, response);
            return; // Detener ejecución
        }

        // Crear objeto usuario
        Usuarios obj = new Usuarios();
        obj.setNoIdentificacion(noIdentificacion.trim());
        
        // Elimina el usuario
        int result = userDao.eliminarUsuario(noIdentificacion);

        if (result > 0) {
            request.getSession().setAttribute("success", "El usuario con No. Identificacion " + noIdentificacion + " fue eliminado Exitosamente");
        } else {
            request.getSession().setAttribute("error", "No se pudo eliminar el usuario con No. Identificacion " + noIdentificacion);
        }
        request.setAttribute("usuarios", userDao.ListarTodosUsuario());
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
