# Índice

1. [[#Introducción]]
2. [[#Preinstalación de Arch Linux]]

# Introducción

Este documento detalla los pasos necesarios para crear un entorno de escritorio utilizando Arch Linux como distribución. Se requiere cierto conocimiento previo en interfaces de líneas de comandos y sistemas operativos basados en Linux para llevar a cabo esta tarea.

El entorno de escritorio se construirá utilizando el gestor de ventanas Qtile. Para personalizar y configurar adecuadamente Qtile, se necesitarán habilidades de programación, específicamente en el lenguaje de programación Python.

# Instalación de Arch

El inicio de esta guía empieza justamente después de finalizar la instalación de Arch Linux, pero antes de reiniciar el ordenador se deben realizar ciertas tareas para obtener una correcta configuración y no tener inconvenientes al arrancar por primera vez Arch:

Crear usuario:

```sh
useradd -m username
passwd username
usermod -aG wheel,video,audio,storage username
```

Para configurar una conexión a internet es necesario instalar la herramienta networkmanager:

```sh
pacman -S networkmanager
systemctl enable NetworkManager
```

**TAMBIEN HAY QUE INSTALARRR EL APPLET DE NETWORKMANAGERR, ANOTARR ESTOO**


Para tener privilegios de superusuario es necesario tener la herramienta sudo:

```sh
pacman -S sudo
```

Se debe editar el archivo /etc/sudoers con editor de texto como nano o neovim, descomentando la linea con **"wheel"** para proveer comandos de superusuario por medio de sudo a los usuarios miembros del grupo wheel:

```sh
# Se instala el editor de texto neovim
sudo pacman -S neovim

# Archivo /etc/sudoers
## Uncomment to allow members of group wheel to execute any command
%wheel ALL(ALL:ALL) ALL
```

# Primera vez en Arch

Una vez instalado Arch Linux y se haya iniciado sesión, la conexión a internet debería funcionar correctamente si el ordenador está conectado a través de cable Ethernet. Sin embargo, si se trata de un portátil y se requiere conectarse a internet mediante WIFI, es posible utilizar [NetworkManager](https://wiki.archlinux.org/title/NetworkManager) para configurar una conexión inalámbrica a una red:

```sh
# Lista las redes disponibles
nmcli device wifi list

# Establece una conexión inalámbrica a una red
nmcli device wifi connect TU_SSID password TU_CONTRASEÑA
```

Una vez se haya establecido una conexión a internet, es posible empezar a instalar paquetes. Lo primero que se debe instalar antes de pensar en entornos de escrito es un servidor gráfico como [xorg](https://es.wikipedia.org/wiki/X.Org_Server):

```sh
sudo pacman -S xorg
```

# Inicio de sesión y gestor de ventanas

Después, para facilitar la interacción con programas como navegadores, terminales y reproductores de manera visual e intuitiva, se procederá a instalar [lightdm](https://es.wikipedia.org/wiki/LightDM) como gestor de inicio de sesión y [qtile](http://www.qtile.org/) como gestor de ventanas. Es importante tener en cuenta que lightdm requiere la instalación de un [greeter](https://wiki.archlinux.org/title/LightDM#Greeter) para funcionar correctamente. Para navegar en internet, se puede utilizar un navegador como [Vivaldi](https://vivaldi.com) y como CLI, se instalará [kitty](https://sw.kovidgoyal.net/kitty/).

```sh
sudo pacman -S lightdm lightdm-gtk-greeter qtile vivaldi kitty
```

El siguiente paso consiste en descargar el repositorio [dotfiles](https://github.com/frankmdv/dotfiles), el cual contiene directorios y archivos de configuración para programas como kitty terminal, qtile y neovim:

```sh
git clone https://github.com/frankmdv/dotfiles
```

Una vez descargado, es necesario crear enlaces simbólicos de cada uno de estos directorios a la carpeta ~/.config:

```sh
ln -s ~/dotfiles/kitty ~/.config
ln -s ~/dotfiles/nvim ~/.config
ln -s ~/dotfiles/qtile ~/.config
```

Para que el servicio de lightdm se ejecute al encender el ordenador, es necesario habilitarlo. Después de reiniciar el sistema, podremos iniciar sesión en Qtile utilizando lightdm:

```sh
sudo systemctl enable lightdm
reboot
```

# Paquetes y herramientas esenciales en Arch

Esta sección muestra los programas o herramientas que casi todo usuario necesita en un sistema Arch Linux y como instalarlos:

## AUR helper

AUR Helper es una herramienta que facilita la instalación y gestión de paquetes desde el Arch User Repository. AUR es un repositorio de paquetes de la comunidad de Arch que contiene una gran variedad de software que no se encuentra en los repositorios oficiales de Arch Linux.

Existen diferentes herramientas AUR Helper, una de las más populares es [yay](https://github.com/Jguer/yay):

```sh
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## Fuentes

Para asegurar una experiencia de visualización de texto decente en Arch, podemos descargar los siguientes paquetes de fuentes:

```sh
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts

# Soporte para emojis
yay -S noto-fonts-emoji

# Soporte para caracteres japoneses
yay -S adobe-source-han-sans-jp-fonts
```

Adicionalmente, para que la configuración personalizada de Qtile se vea correctamente, es necesario instalar el siguiente paquete de fuente:

```sh
yay -S ttf-ubuntu-mono-nerd
```

## Fondo de pantalla

Inicialmente, Qtile mostrará un fondo totalmente negro, para cambiar este fondo por uno más colorido o abstracto es necesario instalar una herramienta para gestionar fondos de pantalla como [feh](https://wiki.archlinux.org/title/feh):

```sh
sudo pacman -S feh
feh --bg-scale /ruta/al/fondo/de/pantalla
```

**Nota:** Esta es la herramienta que utiliza la configuración personalizada de Qtile contenida en el repositorio para establecer los fondos de pantalla al iniciarse.

## Audio

Al instalar Arch, por defecto no hay audio, debido a esto, es necesario instalar un servidor de sonido como [pulseaudio](https://wiki.archlinux.org/title/PulseAudio) y [pavucontrol](https://wiki.archlinux.org/title/PulseAudio) para interactuar con las funciones de pulseaudio mediante una interfaz gráfica:

```sh
sudo pacman -S pulseaudio pavucontrol
```

### Bluetooth

Para habilitar la funcionalidad del Bluetooth en Arch, es necesario instalar los siguientes paquetes:

- **bluez:** Es una implementación del protocolo Bluetooth que permite la transferencia de datos entre dispositivos conectados entre sí.
- **bluez-utils:** Este paquete provee funcionalidades extras para bluez como explorar y conectar dispositivos Bluetooth, así como también incluye la herramienta bluetoothctl que proporciona una interfaz de linea de comandos para configurar dispositivos Bluetooth.
- **pulseaudio-bluetooth:** Extensión de pulseaudio que hace uso de Bluez para permitir la comunicación del ordenador con los dispositivos Bluetooth.

```sh
sudo pacman -S bluez bluez-utils pulseaudio-bluetooth
```

Falta explicar que se debe habilitar el servicio de bluetooth con bluetooth.service.

TAMBIÉN EXPLICAR QUE BLUEMAN ES UNA INTERFAZ GRÁFICA PARA BLUEZ Y PODER CONECTAR LOS DISPOSITIVOS Y DEMÁS.

## Brillo

Si el ordenador es un portátil, probablemente se necesite una herramienta para controlar el brillo de la pantalla, para ello es necesario instalar una herramienta como [brightnessctl]():

```sh
sudo pacman -S brightnessctl
```

**Nota:** La configuración personalizada de Qtile contenida en el repositorio ya establece las teclas que ejecutan esta función, por lo que no debemos preocuparnos por configurarlas.

# Neovim
