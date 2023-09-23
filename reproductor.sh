# Verifica si mpg123 está instalado
	if command -v mpg123 &>/dev/null; then
	    echo "mpg123 está instalado en este sistema."
	else
	    echo "mpg123 no está instalado en este sistema.Porfavor utilice en su terminal sudo apt-install mpg123 si desea utilizar este super reproductor"
	    exit
	fi
	
	
	


	
	control=0
	#Ruta de la carpeta en donde se encuentra la musica
	echo -e  "\e[0;32mIngresa la ruta de la carpeta en donde almacenas tu musica:\e[0m "
	echo -e "\e[1;33mRuta\e[0m: "
	read ruta
	cd $ruta


	#Empieza el ciclo para mostrar el menu y hacer las operaciones de la prebeplayer
	while [ $control -ne 1 ];
	do
		#Menu de la prebeplayer
		echo -e "\n\t\e[1;33m***********\e[0m\e[1;31mReproductor De Musica PYM\e[0m\e[1;33m**************\e[0m"
		echo -e "\t\e[1;33m*************\e[0m         \e[1;33mMENU PRINCIPAL\e[0m                   \e[1;33m************\e[0m"
		echo -e "\t\e[1;33m*************\e[0m \e[1;34m1)Reproducir una cancion\e[0m                 \e[1;33m************\e[0m"
		echo -e "\t\e[1;33m*************\e[0m \e[1;34m2)Reproducir todas las canciones\e[0m         \e[1;33m************\e[0m"
		echo -e "\t\e[1;33m*************\e[0m \e[1;34m3)Reproducir todas las canciones en aleatorio\e[0m \e[1;33m*******\e[0m"
		echo -e "\t\e[1;33m*************\e[0m \e[1;34m4)Ver las canciones de la carpeta\e[0m        \e[1;33m************\e[0m"
		echo -e "\t\e[1;33m***********+*\e[0m \e[1;34m5)Salir\e[0m                                  \e[1;33m************\e[0m"
		echo -e "\t\e[1;33m*******************************************************************\e[0m"
		echo -e "\n\t\e[1;31m************\e[0m          \e[1;34mMENU DEL REPRODUCTOR\e[0m           \e[1;31m**************\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[s] --> Detener/Continuar reproduciendo\e[0m \e[1;31m--------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[d] --> Canción anterior\e[0m \e[1;31m-----------------------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[f] --> Canción siguiente\e[0m \e[1;31m----------------------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[b] --> Regresar la canción al principio\e[0m \e[1;31m-------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[+] --> Subir volumen\e[0m \e[1;31m--------------------------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[-] --> Bajar volumen\e[0m \e[1;31m--------------------------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[q] --> Salir del reproductor\e[0m \e[1;31m------------------------\e[0m"
                echo -e "\t\e[1;36mEstas opciones son solo validas si se eligen las opciones 1,2 o 3 del menu principal\e[0m"

		#Solicita la eleccion de una opcion del menu que se le va a mostar
		echo -e "\n\e[0;32mElige una opcion del menu principal: \e[0m"
		read opcion
		#Control de las acciones para cada opcion del menu
		case $opcion in
			1)
				#Le permite al usuario elegir la cancion que va a escuchar
				echo -e "\e[1;35m¿Qué canción quieres escuchar?: \e[0m"
				read cancion
				echo -e  "\e[0;32mAhora puedes elegir una opcion del menu del reproductor\e[0m"
				#Comando que se encarga de reproducir la canción que se le indica en formato mp3
				mpg123 -C /$ruta/"$cancion.mp3"
				

			;;

			2)
				#Reproduce todas las canciones dentro de la carpeta de musica que el  usuario indico
				echo -e "\e[1;35mVamos a armar un pachangon con tu playlist\e[0m"
				echo -e  "\e[0;32mAhora puedes elegir una opcion del menu del reproductor\e[0m"
				#Comando para reproducir todas las canciones
				mpg123 -C /$ruta/*
                        ;;


			3)
				#Reproduce todas las canciones dentro de la carpeta de musica que el usuario le indico
				echo -e "\e[1;35mVamos a armar un pachangon aleatorio con tu playlist\e[0m"
				echo -e  "\e[0;32mAhora puedes elegir una opcion del menu del reproductor\e[0m"
				#Comando para reproducir en modo aleatorio
				mpg123 -C -z /$ruta/*
                        ;;

			4)
				echo "Las canciones son:"
				ls $ruta
			;;


			5)
				control=1
			;;

			*)
				#Indica que hubo error si el usuario bobo no eligió algo del menu
				echo -e  "\e[1;35mOpción no válida, intentalo de nuevo plis\e[0m"
			;;


		esac
	done