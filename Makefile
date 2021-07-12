all: keyboard joystick

keyboard:
	dtc -I dts -O dtb -o picade.dtbo picade.dts

joystick:
	cpp -nostdinc -I /usr/include -undef -x assembler-with-cpp picade-joystick.dts picade-joystick.dts.proc
	dtc -I dts -O dtb -o picade-joystick.dtbo picade-joystick.dts.proc

dt-remove:
	dtoverlay -r picade

dt-load:
	dtoverlay picade.dtbo

install:
	cp picade.dtbo /boot/overlays/
	cp picade-joystick.dtbo /boot/overlays/

clean:
	rm -f picade.dtbo
	rm -f picade-joystick.dtbo picade-joystick.dts.proc
