#!/bin/bash
select RESP in chiste refran poema salir; do
	case $RESP in
		chiste)
			echo "Soy muy tonto";;
		refran)
                        echo "Los cuervos criados son y le sacaran los ojos a tus enemigos";;
		poema)
                        echo "las violetas no son azules";;
		salir)
			break
	esac
done


