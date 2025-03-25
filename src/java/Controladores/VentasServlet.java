package Controladores;

import DAO.ClientesDAO;
import DAO.ProductosDAO;
import DAO.VentasDAO;
import Modelos.Clientes;
import Modelos.Productos;
import Modelos.Ventas;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class VentasServlet extends HttpServlet {
    private final String formVentas = "ventas.jsp";
    private VentasDAO ventDao = new VentasDAO();
    private ClientesDAO clieDao = new ClientesDAO();
    
    
    private final String pagListarcClie = "clientesLista.jsp"; // pagina donde se va mostrar la lista de productos.
    private final String formClientes = "clientes.jsp"; // pagina donde se ver el formulario de gestion de Productos.
    private final String pagPrinc = "panelPrincipal.jsp";
     private final String pagListar = "clientesLista.jsp"; // pagina donde se va mostrar la lista de productos.
    
    private ProductosDAO prodDao = new ProductosDAO();
    private final String pagListarProd = "productosLista.jsp"; // pagina donde se va mostrar la lista de productos.
    private final String formProductos = "productos.jsp"; // pagina donde se ver el formulario de gestion de Productos.
    
    private static final long serialVersionUID = 1L;
    private ClientesDAO clienteDAO;
    private ProductosDAO productoDAO;
    private VentasDAO ventasDAO;

    public void init() {
        clienteDAO = new ClientesDAO();
        productoDAO = new ProductosDAO();
        ventasDAO = new VentasDAO();
    }
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Validamos si el parámetro action es null
        String action = request.getParameter("action");
        
        if (action == null || action.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro 'action' es requerido.");
            return;
        }

        switch (action) {
            
            case "buscarCliente":
                buscarCliente(request, response);
                break;
            case "buscarProducto":
                buscarProducto(request, response);
                break;
            case "cerrar":
                cerrar(request, response);
                break;
            case "obtenerNumeroFactura":
                obtenerNumeroFactura(request, response);
                break;
            case "obtenerFecha":
                obtenerFechaEmision(request, response);
                break;
            case "listarClientes": 
                listarClientes(request, response);
                break;
            case "listarProductos": 
                listarProductos(request, response);
                break;
            case "insertarVenta":
                insertarVenta(request, response);
                break;
            case "filtrarProducto":
                filtrarProdusto(request, response);
                break;
            
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no reconocida: " + action);
                //throw new AssertionError();
        }
    }
    /* ============================= FILTRAR PRODUCTOS ==========================*/
    private void filtrarProdusto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener valores de los filtros
        String nombre = request.getParameter("nombreProducto");
        String categoria = request.getParameter("categoria");
        String estado = request.getParameter("estado");

        // Llamar al método de filtrado en el DAO
        request.setAttribute("productos", prodDao.filtrarProductos(nombre, categoria, estado));

        // Redirigir a la página de lista de productos
        request.getRequestDispatcher(formVentas).forward(request, response);
    }
    
     /* ============== GUARDAR FACTURA ==========================*/ // no funciono
    private void insertarVenta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Fecha de emisión: " + request.getParameter("emision"));
        System.out.println("Estado: " + request.getParameter("estado"));
        System.out.println("Condición de pago: " + request.getParameter("condicionPago"));
        System.out.println("Método de entrega: " + request.getParameter("metodoEntrega"));
        System.out.println("Método de pago: " + request.getParameter("metodoPago"));
        System.out.println("Entidad de pago: " + request.getParameter("entidadPago"));
        System.out.println("Total Subtotal: " + request.getParameter("totalSubtotal"));
        System.out.println("IVA: " + request.getParameter("iva"));
        System.out.println("Retención Fuente: " + request.getParameter("reteFuente"));
        System.out.println("Retención ICA: " + request.getParameter("reteIca"));
        System.out.println("Anticipo: " + request.getParameter("anticipo"));
        System.out.println("Total Venta: " + request.getParameter("totalVenta"));
        System.out.println("Total Descuento: " + request.getParameter("totalDescuento"));
        System.out.println("Total Pagar: " + request.getParameter("totalPagar"));
        System.out.println("Observaciones: " + request.getParameter("observaciones"));
        System.out.println("ID Cliente: " + request.getParameter("idCliente"));

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();

        try {
            // Crear objeto Ventas con los datos del formulario
            Ventas venta = new Ventas();
            venta.setEmisionVenta(parseDate(request.getParameter("emision")));
            venta.setEstado(request.getParameter("estado"));
            venta.setCondicionPago(request.getParameter("condicionPago"));
            venta.setMetodoEntrega(request.getParameter("metodoEntrega"));
            venta.setMetodoPago(request.getParameter("metodoPago"));
            venta.setEntidadPago(request.getParameter("entidadPago"));

            // Reemplazar comas por puntos en los valores numéricos
            venta.setTotalSubtotal(new BigDecimal(request.getParameter("totalSubtotal").replace(",", ".")));
            venta.setIva(new BigDecimal(request.getParameter("iva").replace(",", ".")));
            venta.setReteFuente(new BigDecimal(request.getParameter("reteFuente").replace(",", ".")));
            venta.setReteIca(new BigDecimal(request.getParameter("reteIca").replace(",", ".")));
            venta.setAnticipo(new BigDecimal(request.getParameter("anticipo").replace(",", ".")));
            venta.setTotalVenta(new BigDecimal(request.getParameter("totalVenta").replace(",", ".")));
            venta.setTotalDescuento(new BigDecimal(request.getParameter("totalDescuento").replace(",", ".")));
            venta.setTotalPagar(new BigDecimal(request.getParameter("totalPagar").replace(",", ".")));

            venta.setObservaciones(request.getParameter("observaciones"));
            venta.setIdCliente(request.getParameter("idCliente"));

            // Insertar la venta en la base de datos
            boolean exito = ventasDAO.insertarVenta(venta);

            if (exito) {
                out.print(gson.toJson(Collections.singletonMap("mensaje", "Venta registrada exitosamente.")));
            } else {
                out.print(gson.toJson(Collections.singletonMap("mensaje", "Error al registrar la venta.")));
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print(gson.toJson(Collections.singletonMap("mensaje", "Error en el servidor: " + e.getMessage())));
        }
        out.flush();
    }

    /* ============== MODAL LISTA DE PRODUCTOS ==========================*/ // no funciono
    private void listarProductos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Productos> listaProductos = prodDao.ListarTodosProductos(); // Método en ClientesDAO para obtener los PRODUCTOS
        request.setAttribute("productos", listaProductos);
        request.getRequestDispatcher("ventas.jsp").forward(request, response);
    }

    /* ============== MODAL LISTA DE CLIENTES ==========================*/
    private void listarClientes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Clientes> listaClientes = clieDao.ListarTodosClientes(); // Método en ClientesDAO para obtener los clientes
        request.setAttribute("clientes", listaClientes);
        request.getRequestDispatcher("ventas.jsp").forward(request, response);
    }

    /* ============== FECHA AUTOMATICA DE LA FACTURA - JSON ==========================*/
    private void obtenerFechaEmision(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDate fechaActual = LocalDate.now();
        request.setAttribute("fechaEmision", fechaActual.toString());
        request.getRequestDispatcher("ventas.jsp").forward(request, response);
    }

    /* ============== NUMERO DE FACTURA - JSON ==========================*/
    private void obtenerNumeroFactura(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int siguienteId = ventasDAO.obtenerSiguienteIdVentas();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"noFactura\": \"" + siguienteId + "\"}");
    }

    /* ============================= BUSCAR CLIENTES - JSON ==========================*/
    private void buscarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String idCliente = request.getParameter("idCliente");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson(); // Necesitas la librería Gson para convertir objetos a JSON.

        if (idCliente == null || idCliente.trim().isEmpty()) {
            out.print(gson.toJson(Collections.singletonMap("mensaje", "Debe ingresar el ID del Cliente 3.")));
            out.flush();
            return;
        }

        VentasDAO ventDao = new VentasDAO(); // Asegúrate de que tu DAO esté correctamente inicializado
        Clientes cliente = ventDao.buscarCliente(idCliente);

        if (cliente != null) {
            out.print(gson.toJson(cliente)); // Enviar cliente como JSON
        } else {
            request.setAttribute("mensaje", "Cliente no encontrado DEBES CREARLO.");
            //out.print(gson.toJson(Collections.singletonMap("mensaje", "Cliente no encontrado. DEBES CREARLO.")));
            request.getRequestDispatcher(formClientes).forward(request, response);
        }
        out.flush();
    }
    
    /* ============================= BUSCAR PRODUCTO - JSON ==========================*/
    private void buscarProducto(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String codigoProducto = request.getParameter("codigoProducto");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson(); // Necesitas la librería Gson para convertir objetos a JSON.

        if (codigoProducto == null || codigoProducto.trim().isEmpty()) {
            out.print(gson.toJson(Collections.singletonMap("mensaje", "Debe ingresar el codigo del producto")));
            out.flush();
            return;
        }

        //VentasDAO ventDao = new VentasDAO(); // Asegúrate de que tu DAO esté correctamente inicializado
        Productos producto = ventDao.buscarProducto(codigoProducto);

        if (producto != null) {
            out.print(gson.toJson(producto)); // Enviar producto como JSON
        } else {
            //request.setAttribute("mensaje", "Producto no encontrado DEBES CREARLO.");
            out.print(gson.toJson(Collections.singletonMap("mensaje", "Producto no encontrado. DEBES CREARLO.")));
            //request.getRequestDispatcher(formClientes).forward(request, response);
        }
        out.flush();
    }
    
    
    /* =================== CERRAR FORMULARIO VENTAS ==========================*/
    protected void cerrar(HttpServletRequest request, HttpServletResponse response)//FUNCIONA
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.getRequestDispatcher(pagPrinc).forward(request, response);

    }
     
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); // Ahora también maneja solicitudes GET
       
     
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

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();

        String action = request.getParameter("action");
        if (action == null || action.trim().isEmpty()) {
            out.print(gson.toJson(Collections.singletonMap("mensaje", "Acción no especificada.")));
            return;
        }

        if ("insertarVenta".equals(action)) {
            try {
                // Crear objeto Ventas con los datos del formulario
                Ventas venta = new Ventas();
                venta.setEmisionVenta(parseDate(request.getParameter("emision")));
                venta.setEstado(request.getParameter("estado"));
                venta.setCondicionPago(request.getParameter("condicionPago"));
                venta.setMetodoEntrega(request.getParameter("metodoEntrega"));
                venta.setMetodoPago(request.getParameter("metodoPago"));
                venta.setEntidadPago(request.getParameter("entidadPago"));
                venta.setTotalSubtotal(new BigDecimal(request.getParameter("totalSubtotal")));
                venta.setIva(new BigDecimal(request.getParameter("iva")));
                venta.setReteFuente(new BigDecimal(request.getParameter("reteFuente")));
                venta.setReteIca(new BigDecimal(request.getParameter("reteIca")));
                venta.setAnticipo(new BigDecimal(request.getParameter("anticipo")));
                venta.setTotalVenta(new BigDecimal(request.getParameter("totalVenta")));
                venta.setTotalDescuento(new BigDecimal(request.getParameter("totalDescuento")));
                venta.setTotalPagar(new BigDecimal(request.getParameter("totalPagar")));
                venta.setObservaciones(request.getParameter("observaciones"));
                venta.setIdCliente(request.getParameter("idCliente"));

                // Insertar la venta en la base de datos
                boolean exito = ventasDAO.insertarVenta(venta);

                if (exito) {
                    out.print(gson.toJson(Collections.singletonMap("mensaje", "Venta registrada exitosamente.")));
                } else {
                    out.print(gson.toJson(Collections.singletonMap("mensaje", "Error al registrar la venta.")));
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.print(gson.toJson(Collections.singletonMap("mensaje", "Error en el servidor: " + e.getMessage())));
            }
        } else {
            out.print(gson.toJson(Collections.singletonMap("mensaje", "Acción no válida.")));
        }
        out.flush();
    }

    // Método para parsear la fecha
    private Date parseDate(String fechaStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return new Date(sdf.parse(fechaStr).getTime());
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
