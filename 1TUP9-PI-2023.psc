Algoritmo sistPasajesAereos
	// Mauro Guevara, Lautaro Molina, Gianina Franquini
	definir vueloBA_BAR, vueloBA_SAL, vueloROS_BA, vueloMDP_MEN, menu Como cadena
	definir contBA_BAR, ruta,columnaAsiento,columnaTotal como entero
	Dimension vueloBA_BAR[120,9], vueloBA_SAL[120,9], vueloROS_BA[80,9], vueloMDP_MEN[80,9]
	contBA_BAR =0
	contBA_SAL = 0
	contROS_BA = 0
	contMDP_MEN = 0
	columnaAsiento = 0
	columnaTotal = 9
	columnaNombre = 1
	columnaApellido = 2
	 
	
	repetir 
		escribir "*****************************"
		Escribir  "    BIENVENIDOS A AIRMAX    "
		Escribir  "      Tu mejor opción       ";
		escribir "*****************************"
		escribir "              MENU           "
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
				
				segun ruta Hacer
					1:
						buscarNumeroAsiento(vueloBA_BAR, contBA_BAR,columnaAsiento)
					2:
						buscarNumeroAsiento(vueloBA_SAL, contBA_SAL,columnaAsiento)
					3:
						buscarNumeroAsiento(vueloROS_BA, contROS_BA,columnaAsiento)
					4:
						buscarNumeroAsiento(vueloMDP_MEN, contMDP_MEN,columnaAsiento)
				FinSegun
			"3":
				ruta = elegirRuta(ruta)
				segun ruta hacer
					1:
						buscarNombrePasajero(vueloBA_BAR, contBA_BAR,columnaNombre,columnaApellido)
					2:
						buscarNombrePasajero(vueloBA_SAL, contBA_SAL,columnaNombre,columnaApellido)
					3:
						buscarNombrePasajero(vueloROS_BA, contROS_BA,columnaNombre,columnaApellido)
					4:	
						buscarNombrePasajero(vueloMDP_MEN, contMDP_MEN,columnaNombre,columnaApellido)
				finSegun		
			"4":
				ruta = elegirRuta(ruta)
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
						Listado(contBA_BAR,contBA_SAL,contROS_BA,contMDP_MEN)
				FinSegun
			"SALIR":
				Escribir "    ¡ Adios !      "
				Escribir "Cerrando programa.."
		FinSegun
	hasta que menu = "SALIR"
FinAlgoritmo

//_______________________________________________________CARGAR DATOS____________________
subproceso cargarDatos(vuelo, cont por referencia,ruta)
	definir nombrePasajero,apellidoPasajero, equipajePasajero, telPasajero,optEquipaje Como Caracter
	definir numeroAsiento, dniPasajero, pasajeroFrecuente Como Entero
	definir montoVuelo Como Real
	nombrePasajero= ""
	apellidoPasajero=""
	Repetir
		si nombrePasajero == "" Entonces
		    escribir "Ingrese el nombre del pasajero"
		    leer nombrePasajero
			vuelo[cont,1] = nombrePasajero
	    FinSi
	    Si apellidoPasajero == "" Entonces  
		    Escribir "Ingrese el apellido del pasajero"
		    leer apellidoPasajero
		    vuelo[cont,2] = apellidoPasajero
		FinSi
	Mientras Que longitud(nombrePasajero) == 0 o longitud(apellidoPasajero) ==0
	
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
	
	montoVuelo = calcularMonto(contBA_BAR, contBA_SAL,contROS_BA, contMDP_MEN,ruta,equipajePasajero)
	vuelo[cont,8] = ConvertirATexto(montoVuelo)
	
	vuelo[cont,0] = ConvertirATexto(cont + 1)
	
escribir "Ruta: ", vuelo[cont,7] 
escribir "Nombre y Apellido: " ,vuelo[cont,1] " ", vuelo[cont,2]
escribir "DNI: ", vuelo[cont,3]
escribir "Teléfono: ", vuelo[cont,4]
escribir "Equipaje en bodega: ",vuelo[cont,5]
escribir "Número pasajero frecuente: " ,vuelo[cont,6]
escribir "Asiento: ", vuelo[cont,0] 
escribir "Costo pasaje: $",vuelo[cont,8] 
cont = cont + 1

	
FinSubProceso

//__________________________________________________________ORDENAR ASCENDENTE__________________________________________________________

SubProceso ordenarAsc(vuelo,cont,columnaAOrdenar)
	definir posMenor Como Entero
	definir aux Como Caracter
	para i = 0 hasta cont -1
		posMenor = i
		para j = i + 1 hasta cont  - 2
			si ConvertirANumero(vuelo[i,columnaAOrdenar]) > ConvertirANumero(vuelo[j,columnaAOrdenar])	
				para h=0 hasta 8
					aux = vuelo[i,h]										
					vuelo[i,h] = vuelo[j,h]
					vuelo[posMenor,h] = aux
				FinPara
			FinSi
		FinPara
	FinPara
FinSubProceso

//___________________________________________________ORDENAR DESCENDENTE_________________________________________________________________
SubProceso ordenarDesc(vuelo,cont,columnaAOrdenar)
	definir posMenor Como Entero
	definir aux como cadena
	para i = 0 hasta cont
		posMenor = i
		para j = i + 1 hasta cont
			si ConvertirANumero(vuelo[posMenor,columnaAOrdenar]) < ConvertirANumero(vuelo[j,columnaAOrdenar])
				posMenor = j
				para h = 0 hasta 8
					aux = vuelo[i,h]									
					vuelo[i,h] = vuelo[j,h]
					vuelo[posMenor,h] = aux
				FinPara
				
			FinSi
		FinPara
	FinPara
FinSubProceso

//_______________________________________________________BUSQUEDA DE PASAJERO POR ASIENTO_____________________________________________________________
SubProceso buscarNumeroAsiento(vuelo,cont,columnaAbuscar)
	definir primero,ultimo,mitad,AsientoAbuscar Como Entero
	definir asientoEncontrdo Como Logico
	escribir "ingrese el asiento que desea buscar"
	leer AsientoAbuscar
	si cont>2
		ordenarAsc(vuelo,cont,columnaAbuscar)
	FinSi
	
	primero = 0
	ultimo = cont
	repetir
		mitad = trunc((primero + ultimo) / 2)							
		si vuelo[mitad,x] = AsientoAbuscar
			asientoEncontrdo = Verdadero
			
		Sino si vuelo[mitad,columnaAbuscar] > AsientoAbuscar
				ultimo = ultimo - 1
			SiNo
				primero = primero + 1
			FinSi
		FinSi
	hasta que asientoEncontrdo o primero > ultimo
	si asientoEncontrdo 
		escribir  "Nombre y Apellido: ",vuelo[cont,1] "  " , vuelo[cont,2]
		escribir "Ruta: ", vuelo[cont,7]
		escribir "DNI: ", vuelo[cont,3]
	SiNo
		escribir "Asiento no encontrado"
	FinSi
FinSubProceso
//_______________________________________________BUSQUEDA PASAJERO_____________________________//
SubProceso buscarNombrePasajero(vuelo,cont,nombre,apellido)
	definir primero,ultimo,mitad,posMenor Como entero
	definir nombreAbuscar, apellidoAbuscar,aux como cadena
	definir  encontrado Como Logico
	
si cont>2
	para i = 0 hasta cont-2
		posMenor = i
		para j = i + 1 hasta cont -1
			si Concatenar(vuelo[j,nombre],vuelo[j,apellido]) < Concatenar(vuelo[posMenor,nombre],vuelo[posMenor,apellido])
				posMenor = j
			FinSi
			para k = 0 hasta 8
				aux = vuelo[i,k]
				vuelo[i,k] = vuelo[j,k]
				vuelo[posMenor,k] = aux
			FinPara
		FinPara
	FinPara
FinSi

	escribir "ingrese nombre a buscar"
	leer nombreAbuscar
	escribir "ingrese apellido a buscar"
	leer apellidoAbuscar
	encontrado = Falso
	primero = 0
	ultimo = cont
	Repetir
		mitad = trunc((primero+ultimo)/2)
		si concatenar(vuelo[mitad, nombre], vuelo[mitad, apellido]) = concatenar(nombreAbuscar,apellidoAbuscar)
			encontrado = Verdadero
		SiNo
			si concatenar(vuelo[mitad, nombre], vuelo[mitad, apellido]) > concatenar(nombreAbuscar,apellidoAbuscar)
				ultimo = ultimo + 1
			SiNo
				primero  = primero + 1
			FinSi
		FinSi
		
		Hasta Que encontrado o primero > ultimo
		si encontrado
			escribir " Pasajero: ", vuelo[mitad,0]
			escribir "Ruta: ", vuelo[mitad, 7]
			escribir "Dni: ", vuelo[mitad, 3]
		SiNo
			escribir "Pasajero no encontrado"
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
	escribir "5 - Listado/s"
	
	
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
			escribir"Vuelos vendidos de Bs As a Bariloche: ", contBA_BAR, " de 120"
			Escribir"Vuelos vendidos de Bs As a Salta: ", contBA_SAL, " de 120"
			Escribir"Vuelos vendidos de Rosario a Bs As: ", contROS_BA, " de 80"
			Escribir"Vuelos vendidos de Mar del Plata a Mendoza: ", contMDP_MEN, " de 80"
		"b":
			
			escribir"Porcentaje de vuelos vendidos de Bs As a Bariloche: ", contBA_BAR*100/120 ,"%"
			Escribir"Porcentaje de vuelos vendidos de Bs As a Salta: ", contBA_SAL*100/120, "%"
			escribir"Porcentaje de vuelos vendidos de Rosario a Bs As: ", contROS_BA*100/80, "%"
			Escribir"Porcentaje de vuelos vendidos de Mar del Plata a Mendoza: ", contMDP_MEN*100/80, "%"
			
	FinSegun
	
FinSubProceso
//__________________MONTO PASAJES__________________
SubProceso montoFinal = calcularMonto(contBA_BAR, contBA_SAL,contROS_BA, contMDP_MEN,ruta,equipaje)
	definir montoBase, montoFinal como real
	montoBase = 0
	segun ruta
		1:
			si (contBA_BAR + 1) <=20
				montoBase= 150000
			SiNo
				si (contBA_BAR + 1)<=60
					montoBase=165000
				SiNo
					montoBase=180000
				FinSi
			FinSi
		2:
			si (contBA_SAL + 1) <=20
				montoBase= 150000
			SiNo
				si (contBA_SAL + 1)<=60
					montoBase=165000
				SiNo
					montoBase=180000
				FinSi
			FinSi
		3:
			si (contBA_SAL + 1) <=10
				montoBase= 70000
			SiNo
				si (contBA_SAL + 1) <=40
					montoBase=80500
				SiNo
					montoBase=95000
				FinSi
			FinSi
		4:
			si (contBA_SAL + 1) <=10
				montoBase= 95000
			SiNo
				si (contBA_SAL + 1)<=40
					montoBase=109250
				SiNo
					montoBase=125000
				FinSi
			FinSi
	FinSegun
	si equipaje = "Verdadero"
		montoFinal = montoBase * 1.05
	SiNo
		montoFinal = montoBase
	FinSi
	
FinSubProceso
