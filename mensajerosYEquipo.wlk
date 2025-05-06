import empresaYPaquetes.*

object roberto {
  var peso = 90

  method peso() = peso

  method viajaEn(vehiculo) {
    peso = peso + vehiculo.peso()
  }

  method puedeLlamar() = false
}

object chuckNorris {
  method peso() = 80

  method puedeLlamar() = true
}

object neo {

  var puedeLlamar = true

  method puedeLlamar() = puedeLlamar

  method peso() = 0

  method cambiarEstadoDeLlamada() {
    puedeLlamar = not puedeLlamar
  }
}

object bici{

  method peso() = 5
}

object camion{

  var peso = 0

  method peso() = peso

  method agregarAcoplados(cantidad) {
    peso = peso + (cantidad * 500)
  }
}

