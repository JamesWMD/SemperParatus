package Controladores;

import DAO.AccesoRegistroDAO;
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
            // Intentamos validar al usuario con las credenciales proporcionadas
            Usuarios user = accesoRegistroDAO.validar(usuario, password);

            // Verificamos que el usuario existe y su estado es 'Activo'
            if (user != null && "Activo".equals(user.getEstado())) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", user); // Guardamos el usuario en la sesión
                response.sendRedirect("panelPrincipal.jsp"); // Redirigimos al panel principal
            } else {
                // Si las credenciales son incorrectas o el estado no es 'Activo'
                request.setAttribute("mensaje", "Usuario no autorizado"); // Seteamos el mensaje de error
                request.getRequestDispatcher("index.jsp").forward(request, response); // Enviamos el request a la misma página
            }
        } catch (Exception e) {
            // Si ocurre algún error durante la validación (por ejemplo, un error de base de datos)
            e.printStackTrace(); // O registrar el error en un log
            request.setAttribute("mensaje", "Error del servidor, por favor intenta más tarde"); // Mensaje genérico de error
            request.getRequestDispatcher("index.jsp").forward(request, response); // Redirigimos con el mensaje
        }
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String noIdentificacion = request.getParameter("noIdentificacion");
        String nombre = request.getParameter("nombreUsuario");
        String password = request.getParameter("passwordRegistro");
        String confirmPassword = request.getParameter("repetPassword");

        // Validación: Verificar que las contraseñas coinciden
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("index.jsp?error=2"); // Contraseñas no coinciden
            return;
        }

        // Validación adicional: Asegurarse de que el usuario no esté vacío
        if (noIdentificacion == null || noIdentificacion.isEmpty() || nombre == null || nombre.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("index.jsp?error=3"); // Error si algún campo está vacío
            return;
        }

        // Validación del formato de la identificación (opcional)
        // Por ejemplo, asegurar que la identificación tenga una longitud mínima
        if (noIdentificacion.length() < 5) {
            response.sendRedirect("index.jsp?error=4"); // Error si la identificación es demasiado corta
            return;
        }

        try {
            // Crear el nuevo usuario con la contraseña encriptada
            Usuarios nuevoUsuario = new Usuarios(noIdentificacion, nombre, password, "Activo");
            accesoRegistroDAO.guardar(nuevoUsuario); // Guardar el nuevo usuario
            response.sendRedirect("index.jsp?registro=exitoso"); // Redirigir si el registro fue exitoso
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error en los logs
            response.sendRedirect("index.jsp?error=1"); // Redirigir con error si algo falla al registrar
        }
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
