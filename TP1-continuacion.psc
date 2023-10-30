
	Algoritmo sin_titulo
		definir vueloBA_BAR, vueloBA_SAL, vueloROS_BA, vueloMDP_MEN, menu Como cadena
		definir contBA_BAR, ruta,columnaAsiento,columnaTotal como entero
		Dimension vueloBA_BAR[120,9], vueloBA_SAL[120,9], vueloROS_BA[80,9], vueloMDP_MEN[80,9]
		contBA_BAR =0
		contBA_SAL = 0
		contROS_BA = 0
		contMDP_MEN = 0
		columnaAsiento = 0
		columnaTotal = 9
		
		
	repetir 
		menu = verificarMenu(menu)
			segun menu hacer
				"1":
					ruta = elegirRuta(ruta)
					
					Segun ruta Hacer
						1:
							si contBA_BAR < 120
								vueloBA_BAR[contBA_BAR,7] = "Buenos Aires - Bariloche"
								cargarDatos(vueloBA_BAR, contBA_BAR,ruta)
							SiNo
								escribir "El vuelo no tiene asientos disponibles"
							FinSi
						2:
							si contBA_SAL < 120
								vueloBA_SAL[contBA_SAL,7] = "Bueno Aires - Salta"
								cargarDatos(vueloBA_SAL, contBA_SAL,ruta)
							SiNo
								escribir "El vuelo no tiene asientos disponibles"
							FinSi
						3:
							si contROS_BA < 80
								vueloROS_BA[contROS_BA,7] = "Rosario - Buenos Aires"
								cargarDatos(vueloROS_BA, contROS_BA,ruta)
							SiNo
								escribir "El vuelo no tiene asientos disponibles"
							FinSi
						4:
							si contMDP_MEN <80
								vueloMDP_MEN[contMDP_MEN,7] = "Mar Del Plata - Mendoza"
								cargarDatos(vueloMDP_MEN, contMDP_MEN,ruta)
							SiNo
								escribir "El vuelo no tiene asientos disponibles"
							FinSi
					FinSegun
					
				"2":
					ruta = elegirRuta(ruta)
					//segun ruta subproceso buscapasaje y pasar datos de la ruta 
					segun ruta Hacer
						1:
							
					FinSegun
				"3":
					
					
				"4":
					escribir "ingrese el vuelo que desea ordenar"
					leer ruta
					segun ruta
						1:
							optAscDesc = seleccionarAscDesc(optAscDesc)
							segun optAscDesc
								"a":
									ordenarAsc(vueloBA_BAR,contBA_BAR,columnaAsiento)
									mostrarPasajeros(vueloBA_BAR,contBA_BAR,columnaTotal)
								"b":
									ordenarDesc(vueloBA_BAR,contBA_BAR,columnaAsiento)
									mostrarPasajeros(vueloBA_BAR,contBA_BAR,columnaTotal)
							FinSegun
						2:
							optAscDesc = seleccionarAscDesc(optAscDesc)
							segun optAscDesc
								"a":
									ordenarAsc(vueloBA_SAL, contBA_SAL,columnaAsiento)
									mostrarPasajeros(vueloBA_SAL, contBA_SAL,columnaTotal)
								"b":
									ordenarDesc(vueloBA_SAL, contBA_SAL,columnaAsiento)
									mostrarPasajeros(vueloBA_SAL, contBA_SAL,columnaTotal)
							FinSegun
						3:
							optAscDesc = seleccionarAscDesc(optAscDesc)
							segun optAscDesc
								"a":
									ordenarAsc(vueloROS_BA, contROS_BA,columnaAsiento)
									mostrarPasajeros(vueloROS_BA, contROS_BA,columnaTotal)
								"b":
									ordenarDesc(vueloROS_BA, contROS_BA,columnaAsiento)
									mostrarPasajeros(vueloROS_BA, contROS_BA,columnaTotal)
							FinSegun
						4:
							optAscDesc = seleccionarAscDesc(optAscDesc)
							segun optAscDesc
								"a":
									ordenarAsc(vueloMDP_MEN, contMDP_MEN,columnaAsiento)
									mostrarPasajeros(vueloMDP_MEN, contMDP_MEN,columnaTotal)
								"b":
									ordenarDesc(vueloMDP_MEN, contMDP_MEN,columnaAsiento)
									mostrarPasajeros(vueloMDP_MEN, contMDP_MEN,columnaTotal)
							FinSegun
						5:
							//Listado(contBA_BAR,contBA_SAL,contROS_BA,contMDP_MEN)
					FinSegun
				"SALIR":
					
					Escribir "cerrando programa"
			FinSegun
	hasta que menu = "SALIR"
FinAlgoritmo

//_______________________________________________________CARGAR DATOS____________________
subproceso cargarDatos(vuelo, cont por referencia,ruta)
	definir nombrePasajero,apellidoPasajero, equipajePasajero, telPasajero,optEquipaje Como Caracter
	definir numeroAsiento, dniPasajero, pasajeroFrecuente Como Entero
	definir montoVuelo Como Real
	
	escribir "Ingrese el nombre del pasajero"
	leer nombrePasajero
	vuelo[cont,1] = nombrePasajero
	
	Escribir "Ingrese el apellido del pasajero"
	leer apellidoPasajero
	vuelo[cont,2] = apellidoPasajero
		
	Mientras dniPasajero < 10000000 o dniPasajero > 99999999
		escribir "Ingrese el DNI del pasajero: "
		leer dniPasajero
		si dniPasajero< 10000000 o dniPasajero > 99999999
			escribir "DNI invalido"
		FinSi
	FinMientras
	
	vuelo[cont,3] = ConvertirATexto(dniPasajero)
	
	Mientras Longitud(telPasajero) < 12 o Longitud(telPasajero) > 13
		escribir "Ingrese su numero de telefono: "
		leer telPasajero
		si Longitud(telPasajero) < 12 o Longitud(telPasajero) > 13
			escribir "numero invalido"
		FinSi
	FinMientras
	
	vuelo[cont,4] = telPasajero
	
	Repetir
		escribir "Desea despachar el equipaje en bodega? Si/No"
		Leer optEquipaje
		si Mayusculas(optEquipaje) <> "SI" y Mayusculas(optEquipaje) <> "NO"
			escribir "opcion incorrecta"
		FinSi
	hasta que Mayusculas(optEquipaje) = "SI" o Mayusculas(optEquipaje) = "NO"
	
	si Mayusculas(optEquipaje) = "SI"
		equipajePasajero = "Verdadero"
	sino
		equipajePasajero = "Falso"
	FinSi
	
	vuelo[cont,5] = equipajePasajero
	
	Mientras pasajeroFrecuente < 1000 o pasajeroFrecuente > 9999
		Escribir "Ingrese los 4 digitos de su numero de pasajero frecuente: "
		leer pasajeroFrecuente
		si pasajeroFrecuente < 1000 o pasajeroFrecuente > 9999
			escribir "numero invalido"
		FinSi
	FinMientras
	vuelo[cont,6] = ConvertirATexto(pasajeroFrecuente)
	
	montoVuelo = calcularMonto(contBA_BAR, contBA_SAL,contROS_BA, contMDP_MEN,ruta)
	vuelo[cont,8] = ConvertirATexto(montoVuelo)
	
	vuelo[cont,0] = ConvertirATexto(cont + 1)
	cont = cont + 1
	
FinSubProceso

//__________________________________________________________ORDENAR ASCENDENTE__________________________________________________________
SubProceso ordenarAsc(vuelo,cont,columnaAOrdenar)
	definir aux Como Entero
	para i = 0 hasta cont-1
		para j = i + 1 hasta cont - 2
			si ConvertirANumero(vuelo[i,columnaAOrdenar]) < ConvertirANumero(vuelo[j,columnaAOrdenar])	//agregar a cada vuelo[*letra, *el numero de columna donde se encuentra el dato]
				para h=0 hasta cont - 2
				aux = ConvertirANumero(vuelo[i,columnaAOrdenar])										//el dato a buscar se podria preguntar arriba y se utilizaria como una variable en el ordenamiento ej: dni columna = 1 pasar el dato columna a buscar al subproceso
				vuelo[i,columnaAOrdenar] = vuelo[j,columnaAOrdenar]
				vuelo[j,columnaAOrdenar] = ConvertirATexto(aux)
			FinPara
			FinSi
		FinPara
	FinPara

FinSubProceso

//___________________________________________________ORDENAR DESCENDENTE_________________________________________________________________
SubProceso ordenarDesc(vuelo,cont,columnaAOrdenar)
	definir aux Como Entero
	para i = 0 hasta cont-1
		para j = i + 1 hasta cont - 2
			si ConvertirANumero(vuelo[i,columnaAOrdenar]) < ConvertirANumero(vuelo[j,columnaAOrdenar])//agregar a cada vuelo[*letra, *el numero de columna donde se encuentra el dato]
				para h = 0 hasta cont -2
				aux = ConvertirANumero(vuelo[i,columnaAOrdenar])									//el dato a buscar se podria preguntar arriba y se utilizaria como una variable en el ordenamiento ej: dni columna = 1 pasar el dato columna a buscar al subproceso
				vuelo[i,columnaAOrdenar] = vuelo[j,columnaAOrdenar]
				vuelo[j,columnaAOrdenar] = ConvertirATexto(aux)
			FinPara
			
			FinSi
		FinPara
	FinPara
FinSubProceso

//_______________________________________________________BUSQUEDA DE PASAJERO_____________________________________________________________
SubProceso buscarPasaje(vuelo,cont,columnaAbuscar)
	definir primero,ultimo,mitad,AsientoAbuscar Como Entero
	definir asientoEncontrdo Como Logico
	escribir "ingrese el asiento que desea buscar"
	leer AsientoAbuscar
	ordenarAsc(vuelo,cont,columnaAbuscar)       // X seria la columna destinada a buscar el numero de asiento
	primero = 0
	ultimo = cont
	repetir
		mitad = trunc((primero + ultimo) / 2)							//agregar a cada vuelo[mitad, *el numero de columna donde se encuentra el dato]
		si vuelo[mitad,x] = AsientoAbuscar
			asientoEncontrdo = Verdadero
			
		Sino si vuelo[mitad,x] > AsientoAbuscar
				ultimo = ultimo - 1
			SiNo
				primero = primero + 1
			FinSi
		FinSi
	hasta que asientoEncontrdo o primero > ultimo
	si asientoEncontrdo 
		escribir "El numero encontrado esta en la posicion", mitad + 1 
	SiNo
		escribir "Asiento no encontrado"
	FinSi
FinSubProceso

//_____________________________________________________VERIFICAR MENU_________________________________________________________

SubProceso verificacion = verificarMenu(menu) 
	definir verificacion Como Caracter
	definir bandera Como Entero
	
	escribir "1 - Venta de pasaje"
	escribir "2 - Buscar pasaje vendido"
	escribir "3 - Buscar pasajero"
	escribir "4 - Ordenar y mostrar lista pasajeros"
	//a. Por numero de asiento Ascendente
	//b. Por numero de asiento Descendente
	escribir "5 - Listado/s"
	//a. Cantidad de pasajes vendido por ruta aerea
	//b. Porcentaje de ventas por ruta aerea
	
	escribir "Ingrese la palabra salir para finalizar el programa"
	
	repetir 
		leer verificacion
		
		si Mayusculas(verificacion) = "SALIR" o verificacion = "1" o verificacion = "2" o verificacion = "3" o verificacion = "4" o verificacion = "5"
			verificacion = Mayusculas(verificacion)
			bandera = 1
		sino 
			escribir "opcion incorrecta"
			bandera = 0
		FinSi
		
	hasta que bandera = 1

	
FinSubProceso

//______________________________________________________SELECCIONAR RUTA________________________________________________________


SubProceso opcionVuelo = elegirRuta(ruta)
	definir opcionVuelo como entero
	Repetir
		escribir "Ingrese la opcion de la ruta que desea : "
		escribir"1-Buenos Aires - Bariloche"
		escribir"2-Bueno Aires - Salta"
		escribir"3-Rosario - Buenos Aires"
		escribir"4-Mar Del Plata - Mendoza"
		leer opcionVuelo
		si opcionVuelo< 1 o opcionVuelo > 4
			escribir "opcion incorrecta"
			
		FinSi
	hasta que opcionVuelo < 4 y opcionVuelo > 0
	
	
FinSubProceso

//_______________________________________________________VERIFICACION ASC/DESC________________________________________________

SubProceso opt = seleccionarAscDesc(optAscDesc)
	definir opt Como Caracter
	Escribir "Ingrese la opcion que desea"
	escribir "a - Ascendente"
	escribir "b - Descendente"
	repetir 
		leer opt
		si Minusculas(opt) <> "a" y Minusculas(opt) <> "b"
			Escribir "Opcion incorrecta"
		FinSi
	hasta que Minusculas(opt) = "a" o Minusculas(opt) = "b"
FinSubProceso


//_____________________________________________Mostrar Pasajero __________________________
SubProceso mostrarPasajeros(vuelo,cont,n)
	escribir "numero de pasaje " 
	para i = 0 hasta cont - 1
		Escribir "-------------------------------------------------------"
		para j = 0 hasta n - 1 
			Escribir Sin Saltar " | " vuelo[i,j] 
		FinPara
	FinPara
FinSubProceso

//________________LISTADOS________________________
SubProceso Listado(contBA_BAR, contBA_SAL,contROS_BA, contMDP_MEN)
	
	
	Escribir "Ingrese la opcion que desea"
	escribir "a - Cantidad de pasajes vendido por ruta aérea"
	escribir "b - Porcentaje de ventas por ruta aérea"
	repetir 
		leer opt
		si Minusculas(opt) <> "a" y Minusculas(opt) <> "b"
			Escribir "Opcion incorrecta"
		FinSi
	hasta que Minusculas(opt) = "a" o Minusculas(opt) = "b"
	Segun  Minusculas(opt)
		
		"a":
			escribir"vuelos vendidos de Bs As a Bariloche: ", contBA_BAR, " de 120"
			Escribir"vuelos vendidos de Bs As a Salta: ", contBA_SAL, " de 120"
			Escribir"vuelos vendidos de Rosario a Bs As: ", contROS_BA, " de 80"
			Escribir"vuelos vendidos de Mar del Plata a Mendoza: ", contMDP_MEN, " de 80"
		"b":
			escribir "tuvieja"
			//escribir"porcentaje de vuelos vendidos de Bs As a Bariloche: ", contBA_BAR*100/120"%"
			//Escribir"porcentaje de vuelos vendidos de Bs As a Salta: ", contBA_SAL*100/120"%"
			//Escribir"porcentaje de vuelos vendidos de Rosario a Bs As: ", contROS_BA*100/80"%"
			//Escribir"porcentaje de vuelos vendidos de Mar del Plata a Mendoza: ", contMDP_MEN*100/80"%"
			
	FinSegun
	
FinSubProceso
//__________________MONTO PASAJES__________________
SubProceso montoFinal = calcularMonto(contBA_BAR, contBA_SAL,contROS_BA, contMDP_MEN,ruta)
	definir montoBase, montoFinal como real
	montoBase = 0
	segun ruta
		1:
			si contBA_BAR <=20
				montoBase= 150000
			SiNo
				si contBA_BAR<=60
					montoBase=165000
				SiNo
					montoBase=180000
				FinSi
			FinSi
		2:
			si contBA_SAL <=20
				montoBase= 150000
			SiNo
				si contBA_SAL<=60
					montoBase=165000
				SiNo
					montoBase=180000
				FinSi
			FinSi
		3:
			si contBA_SAL <=10
				montoBase= 70000
			SiNo
				si contBA_SAL<=40
					montoBase=80500
				SiNo
					montoBase=95000
				FinSi
			FinSi
		4:
			si contBA_SAL <=10
				montoBase= 95000
			SiNo
				si contBA_SAL<=40
					montoBase=109250
				SiNo
					montoBase=125000
				FinSi
			FinSi
	FinSegun
	si aux = "V"
		montoFinal = montoBase * 1.05
	SiNo
		montoFinal = montoBase
	FinSi
	
FinSubProceso

