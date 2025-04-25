import mensajerosYEquipo.*
import destinos.*

object empresa {

  const pendientes = [] 

  const empleados = []

  var facturacion = 0

  method facturacion() = facturacion

  method empleados() = empleados

  method pendientes() = pendientes

  method contratarunEmpleado(empleado) {
    empleados.add(empleado)
  }

  method despedirUnEmpleado(empleado) {
    empleados.remove(empleado)
  }

  method despedirATodosLosEmpleados() {
    empleados.clear()
  }

  method esGrande() {
    return
        empleados.size() > 2
  }

  method elPrimerEmpleadoPuedeEntregarPaquete(paquete) {
    return
        empleados.first().puedeEntregarPaquete(paquete)
  }

  method pesoDelUltimoEmpleado() {
    return
        empleados.last().peso()
  }

  method cobrarpaquete(paquete) {
    facturacion = facturacion + paquete.precio()
  }

  method sePuedeEntregarElPaquete(paquete) {
    return
      empleados.any({b=>b.puedeEntregarPaquete(paquete)})
  }

  method mensajerosQuePuedenLlevarUnPaquete(paquete) {
    return
      empleados.filter({b=>b.puedeEntregarPaquete(paquete)})
  }

  method laEmpresaTieneSobrepeso() {
    return
      (empleados.sum({b=>b.peso()})/empleados.size()) > 500
  }

  method enviarPaqueteADestino(paquete) {
    if(self.sePuedeEntregarElPaquete(paquete)) {
      facturacion = facturacion + paquete.precio()
    }
    else pendientes.add(paquete)
  }

  method enviarPaquetesADestino(conjuntoDePaquetes) {
    conjuntoDePaquetes.forEach({b=>self.enviarPaqueteADestino(b)})
  }

  method enviarElPendienteMasCaro() {
    if(self.sePuedeEntregarElPaquete(pendientes.max({b=>b.precio()}))) {
      facturacion = facturacion + pendientes.max({b=>b.precio()}).precio()
      pendientes.remove(pendientes.max({b=>b.precio()}))
    }
  }
}

object paquete{

  var destino = puenteDeBrooklyn

  var estaPago = true

  method estaPago() = estaPago

  method destino() = destino

  method cambiarEstadoDePago() {
    estaPago = not estaPago
  }

  method cambiarDestino(destinoNuevo) {
    destino = destinoNuevo
  }

  method precio() = 50

  method sePuedeEnviarPorElMensajero(mensajero) {
    return
      self.estaPago() and
      destino.dejaPasarAlMensajero(mensajero)
  }

}

object paquetito {

  var destino = puenteDeBrooklyn

  method destino() = destino
  
  method estaPago() = true

  method precio() = 0

  method cambiarDestino(destinoNuevo) {
    destino = destinoNuevo
  }

  method sePuedeEnviarPorElMensajero(mensajero) {
    return
      self.estaPago() and
      destino.dejaPasarAlMensajero(mensajero)
  }

}

object paquetonViajero {
  
  const destinos = []

  var precio = 0

  var deuda = 0

  method precio() = precio

  method agregarDestino(destino) {
    destinos.add(destino)
    precio = precio + 100
    deuda  = precio 
  }

  method destino() = destinos

  method pagarElPaquete(pagoDeDeuda) {
    deuda = deuda - pagoDeDeuda
  }

  method estaPago() {
    return
      deuda == 0
  }

  method sePuedeEnviarPorElMensajero(mensajero) {
    return
      self.estaPago() and
      destinos.all({b=>b.dejaPasarAlMensajero(mensajero)})
  }

}