package Controladores;

import DAO.AccesoRegistroDAO;
import DAO.UsuariosDAO;
import Modelos.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AccesoRegistroServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;
    private AccesoRegistroDAO accesoRegistroDAO;
    private UsuariosDAO userDao;

    public void init() {
        accesoRegistroDAO = new AccesoRegistroDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AccesoRegistroServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccesoRegistroServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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

        String action = request.getParameter("action");

        if (action == null) {
            // Si 'action' es null, redirige a la página de error o maneja el caso
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no proporcionada");
            return;
        }

        switch (action) {

            case "login":
                validarLogin(request, response);
                break;
            case "registro":
                registrarUsuario(request, response);
                break;
            /*case "buscar":
                buscarUsuario(request, response);  // Manejamos la búsqueda también en POST por si el formulario se envía con el mismo action
                break;*/
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
                break;

        }
    }
    private void validarLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        try {
            // Validar credenciales
            Usuarios user = accesoRegistroDAO.validar(usuario, password);

            // Verificar si los campos están vacíos
            if (usuario.trim().isEmpty() || password.trim().isEmpty()) {
                request.setAttribute("mensaje", "Ingrese Usuario y Contraseña");
                request.getRequestDispatcher("index.jsp").forward(request, response);

                // Verificar si el usuario existe y está activo
            } else if (user != null && "Activo".equals(user.getEstado().trim())) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", user);
                response.sendRedirect("panelPrincipal.jsp");

                // Verificar si el usuario está inactivo
            } else if (user != null && "Inactivo".equals(user.getEstado())) {
                request.setAttribute("mensaje", "Usuario Inactivo");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                
                // Si el usuario no existe o no cumple ninguna condición anterior
            } else {
                request.setAttribute("mensaje", "Usuario no autorizado");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace(); // O loguear el error
            request.setAttribute("mensaje", "Error del servidor, por favor intenta más tarde");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
    
    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String noIdentificacion = request.getParameter("noIdentificacion");
        String nombre = request.getParameter("nombreUsuario");
        String password = request.getParameter("passwordRegistro");
        String confirmPassword = request.getParameter("repetPassword");

        // Validación: Verificar que las contraseñas coinciden
        if (!password.equals(confirmPassword)) {
            request.setAttribute("mensaje", "Error: Las contraseñas no coinciden.");
            request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
            return;
        }

        // Validación: Verificar que no haya campos vacíos
        if (noIdentificacion == null || noIdentificacion.isEmpty()
                || nombre == null || nombre.isEmpty()
                || password == null || password.isEmpty()) {

            request.setAttribute("mensaje", "Error: Todos los campos son obligatorios.");
            request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
            return;
        }

        // Validación: Verificar el formato de la identificación
        if (noIdentificacion.length() < 5) {
            request.setAttribute("mensaje", "Error: La identificación debe tener al menos 5 caracteres.");
            request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
            return;
        }

        try {
            // Crear el nuevo usuario con la contraseña encriptada (deberías encriptarla)
            Usuarios nuevoUsuario = new Usuarios(noIdentificacion, nombre, password, "Activo");

            // Intentar registrar al usuario
            int resultado = accesoRegistroDAO.guardar(nuevoUsuario);

            if (resultado == -1) {
                request.setAttribute("mensaje", "Error: El usuario ya está registrado.");
            } else if (resultado > 0) {
                request.setAttribute("mensaje", "Usuario registrado con éxito.");
            } else {
                request.setAttribute("mensaje", "Error: No se pudo registrar el usuario.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error interno al registrar el usuario.");
        }

        request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
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
