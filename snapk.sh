<<com

The idea behind this script is that I'm someone who switches between Linux distributions a lot and every time I need Flatback and Snap for my apps.

The idea isn't that important but it looks like I did it primarily for fun 

my Scripts are usually disorganized but I hope the following diagram makes it all clear.

__________ SNAPK
                  |
                  ……… Configuration stages
                  |           |
                  |           |……… COLORS CODE (For formatting colors used in script)
                  |           |
                  |           |……… Clean_screen (to make clean screen with limit trying )
                  |           |
                  |           |……… ASCII_Art  (To show the art of ascii )
                  |           |
                  |           |……… Check_distro_function  (to export source functions)
                  |           |
                  |           |……… installation  (For the installation process after passing all verifications)
                  |           |
                  |           |……… Check_distro_function(To check if the distribution function is located in a specified folder)
                  |           |
                  |           |……… Check_snapk  (This function is to check whether Flatpak and snap is already installed or not)
                  |           |           |
                  |           |           |……Status_Messages(In addition to the status messages function if any)
                  |           |     
                  |           |……… main  (The main function is to collect and coordinate previous jobs)
                  |
                   ………Verification process ( Is to check for the existence of the "Snapk_distros" which folder containing the installation function functions)
com


# ------------------------------ COLORS CODE -------------------------------------------------------------#


r="\e[0;91m"  #> red
b="\e[0;94m"  # > blue
y="\033[1;33m" #>Yellow#
g="\e[0;92m" #> green
w="\e[0;97m" #> white
bo="\e[1m" #> bold
u="\e[4m" #> uline
rt="\e[0m" #> reset
p='\033[0;35m' #> Purple

SL=${p}${bo}[${rt}${b}${bo}-${rt}${p}${bo}]${rt}  #Start of Some Menu
SL0=${p}${bo}[${rt}${y}${bo}0${rt}${p}${bo}]${rt}
SL1=${p}${bo}[${rt}${y}${bo}1${rt}${p}${bo}]${rt} #Start of Numbers Menus (1)
SL2=${p}${bo}[${rt}${y}${bo}2${rt}${p}${bo}]${rt} #Start of Numbers Menus (2)
SL3=${p}${bo}[${rt}${y}${bo}3${rt}${p}${bo}]${rt}

SE=${r}${bo}[${rt}${y}${bo}!${rt}${r}${bo}]${rt}${w}${bo} #Start Exclamation error 
EE=${rt}${r}${bo}[${rt}${y}${bo}!${rt}${r}${bo}]${rt} #End of Exclamation error 
#
SM=${r}${bo}[${rt}${y}${bo}-${rt}${r}${bo}]${rt}${w}${bo} #Start of the Minus sign error
EM=${rt}${r}${bo}[${rt}${y}${bo}-${rt}${r}${bo}]${rt} #End of Minus sign error 
#
SP=${g}${bo}[${rt}${y}${bo}+${rt}${g}${bo}]${rt}${w}${bo} #Start of the success of a Positive sign
EP=${rt}${g}${bo}[${rt}${y}${bo}+${rt}${g}${bo}]${rt} #End of the success of a Positive sign

#------------------------------------------------------------------------------------------------------------#


count=0
max=2

 #------- to make clean screen with limit trying 

function clean_screen() {
      if [ "$count" -eq "$max" ]; then
            clear
            count=`expr $count - 2`
       fi
}

#------To check the name of the distribution------#

pwd=`pwd`

os=`cat  /etc/os-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' >$pwd/os_name ` 

os=`grep -Eo '^[^ ]+' os_name`

 sudo rm -rf os_name

#---------------------------#

######################################
<<com
# OLD ART

clear
echo -e "
${y}${bo}╔═╗┌┐┌${rt}${p}${bo}╔═╗${rt}${w}${bo}┌─┐┬┌─${rt}
${y}${bo}╚═╗│││${rt}${p}${bo}╠═╣${rt}${w}${bo}├─┘├┴┐${rt}
${y}${bo}╚═╝┘└┘${rt}${p}${bo}╩ ╩${rt}${w}${bo}┴  ┴ ┴${rt}
"
com
########################################

function ASCII_Art () {  
clear
sleep 0.3 ; 
echo -e "
${y}${bo}╔═╗┌┐┌${rt}${p}${bo}╔═╗${rt}${w}${bo}┌─┐┬┌─${rt}"; sleep 0.3
echo -e "${y}${bo}╚═╗│││${rt}${p}${bo}╠═╣${rt}${w}${bo}├─┘├┴┐${rt}"; sleep 0.3
echo -e "${y}${bo}╚═╝┘└┘${rt}${p}${bo}╩ ╩${rt}${w}${bo}┴  ┴ ┴${rt}
" ; sleep 0.3

ASCII_art =0

while true 
do 
clear
sleep 0.3
echo -e "
${y}${bo}╔═╗┌┐┌${rt}${p}${bo}╔═╗${rt}${w}${bo}┌─┐┬┌─${rt}
${y}${bo}╚═╗│││${rt}${p}${bo}╠═╣${rt}${w}${bo}├─┘├┴┐${rt}
${y}${bo}╚═╝┘└┘${rt}${p}${bo}╩ ╩${rt}${w}${bo}┴  ┴ ┴${rt}
"
sleep 0.3
ASCII_art=`expr $ASCII_art + 1`
if [ "$ASCII_art" == "3" ]; then 
      break
fi
done 
clear 

echo -e "
${y}${bo}╔═╗┌┐┌${rt}${p}${bo}╔═╗${rt}${w}${bo}┌─┐┬┌─${rt}
${y}${bo}╚═╗│││${rt}${p}${bo}╠═╣${rt}${w}${bo}├─┘├┴┐${rt}
${y}${bo}╚═╝┘└┘${rt}${p}${bo}╩ ╩${rt}${w}${bo}┴  ┴ ┴${rt}
"



}
 

#----------------Check_distro_function---------------#


# To check if the distribution function is located in a specified folder

function Check_distro_function() {  
      find=`find $pwd/Snapk_distros -type f -name "$distro_os"`

      if ! $find >/dev/null 2>&1; then
           source $pwd/Snapk_distros/$distro_os 
           $distro_os
      else 
            sleep 2
            clear
            source_note="\n${SE}function '$distro_os' not found on $pwd/Snapk_distros/...?${EE}\n"

      fi
}

#---------------------------------------------------------#


#----------------installationation function----------------#

function installation() {
  
      case $os in 
            '"Arch')
                  distro_os="Arch_Linux" 
                  Check_distro_function  ;;

            '"AlmaLinux')
                  distro_os="AlmaLinux"
                  Check_distro_function  ;;

            '"Alpine')
                  distro_os="Alpine" 
                  Check_distro_function;;

            '"Ataraxia')
                  distro_os="Ataraxia" 
                  Check_distro_function ;;

            '"CentOS') # check it later 
                  distro_os="CentOS" 
                  Check_distro_function ;;

            '"Chrome')
                  distro_os="Chrome_OS" 
                  Check_distro_function;;

            '"Clear')
                  distro_os="Clear" 
                  Check_distro_function ;;

            '"Debian')
                  distro_os="Debian"
                  Check_distro_function ;;

            '"Deepin')
                  distro_os="Deepin" 
                  Check_distro_function ;;

            '"elementary')
                  distro_os="elementary" 
                  Check_distro_function ;;

            '"EndeavourOS')
                  distro_os="EndeavourOS" 
                  Check_distro_function ;;

            '"Endless')
                  distro_os="Endless" 
                  Check_distro_function ;;

            '"Fedora')
                  distro_os="Fedora" 
                  Check_distro_function ;;

            '"Gentoo')
                  distro_os="Gentoo" 
                  Check_distro_function ;;

            '"KDE')
                  distro_os="KDE" 
                  Check_distro_function ;;

            '"Kubuntu')
                  distro_os="Kubuntu" 
                  Check_distro_function ;;

            '"Linux') 
                  distro_os="Linux_Mint" 
                  Check_distro_function ;;

            '"Mageia')
                  distro_os="Mageia" 
                  Check_distro_function ;;

            '"Manjaro')
                  distro_os="Manjaro"
                  Check_distro_function;;

            '"NixOS')
                  distro_os="NixOS" 
                  Check_distro_function ;;

            '"Pardus')
                  distro_os="Pardus" 
                  Check_distro_function;;

            '"Pop!_OS')
                  distro_os="Pop_os" 
                  Check_distro_function ;;

            '"PureOS')
                  distro_os="PureOS" 
                  Check_distro_function ;;

            '"Red Hat Enterprise Linux')
                  distro_os="Red_Hat_Enterprise_Linux" 
                  Check_distro_function ;;

            '"Solus')
                  distro_os="Souls" 
                  Check_distro_function ;;

            '"SulinOS')
                  distro_os="SulinOS" 
                  Check_distro_function ;;

            '"Ubuntu')
                  distro_os="Ubuntu" 
                  Check_distro_function ;;

            '"Void')
                  distro_os="Void" 
                  Check_distro_function ;;

            '"Zorin')
                  distro_os="Zorin_os" 
                  Check_distro_function ;;

            '"Mx')
                  distro_os="Mx" 
                  Check_distro_function ;;

            '"openSUSE')
                  distro_os="openSUSE" 
                  Check_distro_function ;;

            '"Kali')
                  distro_os="Kali" 
                  Check_distro_function ;;

            '"Parrot')
                  distro_os="Parrot" 
                  Check_distro_function ;;

            '"Xubuntu')
                  distro_os="Xubuntu" 
                  Check_distro_function;;

            '"Rocky')
                  distro_os="Rocky" 
                  Check_distro_function ;;

            '"GalliumOS')
                  distro_os="GalliumOS" 
                  Check_distro_function ;;
            *)
                  clear
                  echo -e "\n${SM}Your distro is not in the list of distros included in the script ${EM}\n" ;;


      esac

}

#---------------------------------------------------------#


#----------------checking snapk function----------------#


#__This function is to check whether Flatpak and snap is already installed or not,  In addition to the status messages function if any___#



function Check_snapk() {


      function Status_Messages() {

            if [ "$source_note" != "" ]; then
                  echo -e "$source_note"
            fi

            if [ "$note" != ""  ]  && [ "$note2" != "" ]; then 
                  echo -e "$note"
                  echo -e "$note2\n$Snap\n"
                 
            elif [ "$note" != "" ]; then 
                  echo -e "$note"                

            elif [ "$note2" != "" ]; then
                  echo -e "$note2\n$Snap\n"               

            fi

            if [ "$snap_note" != ""  ]  && [ "$flatpak_note" != "" ]; then 
                  echo -e "$snap_note"
                  echo -e "$flatpak_note" 
                 
            elif [ "$snap_note" != "" ]; then 
                  echo -e "$snap_note"
            
            elif [ "$flatpak_note" != "" ]; then
                  echo -e "$flatpak_note"

            fi

            if [ "$note" == ""  ]  && [ "$note2" == "" ] && [ "$snap_note" == ""  ]  && [ "$flatpak_note" == "" ] && [ "$source_note" == "" ]; then 
                  echo -e "\n${SP}Done${EP}\n"
                  echo -e "${SP}You may need to restart now${EP}\n"
                  read -n 1 -s -r -p "Press any key to Exit ..."
                  clear
            else
                  read -n 1 -s -r -p "Press any key to Exit ..."
                  clear
            fi
      }

      case $TODO in 
            "1")
                  Snap=`snap --version`
                  if ! $Snap >/dev/null 2>&1; then #!
                        clear
                        echo -e "\n${SP}you already have${EP}:\n"
                        echo -e "$Snap\n"

                  else
                        clear
                        installation 
                        Status_Messages

                  fi ;;
            "2")        
                  Flatpak=`flatpak --version` 
                  if ! $Flatpak >/dev/null 2>&1; then #
                        clear
                        (cd $Home; cd Downloads/ ; sudo rm -rf flathub.* ; wget https://flathub.org/repo/flathub.flatpakrepo; sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo)  
                        clear
                        echo -e "\n${SP}you already have${EP}: $Flatpak\n"

                  else
		            clear
                        installation
                        Status_Messages
                  fi ;;

            "3")
                  Flatpak=`flatpak --version` 
                  if  ! $Flatpak >/dev/null 2>&1; then
                        clear
                        (cd $Home; cd Downloads/ ; sudo rm -rf flathub.* ; wget https://flathub.org/repo/flathub.flatpakrepo; sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo) 
                        note="\n${SP}you already have${EP}: $Flatpak\n"
                  else
                        installation 

                  fi
                  Snap=`snap --version`
                  if ! $Snap >/dev/null 2>&1; then
                        note2="${SP}you already have${EP}:\n"

                  else
                        installation 
                  fi
                  clear # add to comment to understand the changes 
                  Status_Messages ;;
      esac
      
}


#---------------------------------------------------------#


#----------------Main function----------------#

function main() {  
      while true
      do  
            echo -e "\n${b}========================"
            echo -e "[---]  ${p}SnApk Menu${rt}${b}  [---]"
            echo -e "========================${rt}\n"
            echo -e "${g}${bo}+${rt}${SL1} ${w}${bo}Snapd${rt}" 
            echo -e "${g}${bo}+${rt}${SL2} ${w}${bo}FlatPAK${rt}" 
            echo -e "${g}${bo}+${rt}${SL3} ${w}${bo}FlatPAK & Snapd${rt}"  
            echo -e "${g}${bo}+${rt}${SL0} ${w}${bo}Exit${rt}\n"  

            read -p "Choose an option: "  option
            case $option in 
                  "1") # To Do
                        TODO="1" # Snapd 
                        Check_snapk
                        break ;;

                  "2")
                        TODO="2"  # Flatpak
                        Check_snapk
                        break ;;

                  "3")
                      TODO="3" # Snap & Flatpak
                      Check_snapk
                      break  ;;

                  "0")
                        clear
                        break ;;
                  *)
                        echo -e "\n${SM} ENTER A Number of them !!! ${EM}\n" 
                        count=`expr $count + 1`
                        clean_screen ;;
              esac

      done
}

#---------------------------------------------------------#


 #Is to check for the existence of the "Snapk_distros" which folder containing the installation function functions 

pwd=`pwd`
find=`find $pwd -type d -name "Snapk_distros"`

if (( $EUID == 0 )); then
      clear
      sleep 0.2
      echo -e "\n${SE} You Must Be a Normal User To Successfully Complete a Process !! ${EE}\n"
else

      if ! $find >/dev/null 2>&1; then
            ASCII_Art
            main
      else 
            sleep 2
            clear
            echo -e "\n${SE}functions directory 'Snapk_distros' not found on $pwd/...?${EE}\n"

      fi
fi
