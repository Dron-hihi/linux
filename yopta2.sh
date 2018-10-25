#! /bin/bash

RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"

#********************************Funkcion from user****************************
#******************************************************************************
UG()
{
echo -e "1.Castom   2.Default  3.Back"
read ug
case $ug in
1)
echo -e "Enter name \n"
read name
if grep -iE $name /etc/passwd ; then
echo "NO"
clear
UG
fi
echo -e "Enter UID \n"
read uid
if grep ":x:$uid:" /etc/passwd ; then
echo "NO"
clear
UG
fi
echo -e "Enter GID \n"
read gid
if grep ":x:[0-9]+:$gid:" /etc/passwd ; then
echo "NO"
clear
UG
fi
echo -e "Expire \n"
read expire
if echo "$expire" | grep "[0-9]+{4}-[0-9]+{2}-[0-9]+{2}" > /dev/null ; then
echo "NO"
UG
fi
echo -e " Comment \n"
read comment
groupadd -g $gid $name
useradd -u $uid -g $gid -e $expire -c "$comment" $name
;;
2)
echo -e "Enter name \n"
read name
if grep $name /etc/passwd ; then
echo "NO"
else
useradd $name
fi
;;
3)
USER
;;
*)
echo "ERROR"
;;
esac
}

UM()
{
echo "`cat /etc/passwd`" 
echo -e "Selecu user \n"
read z
echo -e "1.Name 2.UID 3.GID 4.Expire 5.Comment"
read x
case $x in
1)
echo -e "(New)Name - "
read newname
usermod $z -l $newname
;;
2)
echo -e "(New)UID - "
read newuid
usermod $z -u $newuid
;;
3)
echo -e "(New)GID - "
read newgid
usermod $z -g $newgid
;;
4)
echo -e "(New)Expire - "
read newexpire
usermod $z -e $newexpire
;;
5)
echo -e "(New)comment - "
read newcomment
usermod $z -c $newcomment
;;
esac
}

UD()
{
echo "`cat /etc/passwd`"
echo -e "Select user \n"
read z
echo -e "Are you sure you want to delete the user ?"
echo -e "1 -> YES"
echo -e "2 -> NO"
read x
case $x in
1)
userdel $z
;;
2)
USER
;;
esac

}

USER()
{
echo -e " $GREEN 1.Great $END 2.Modifycation $RED 3.Delete $END 4.Back $END\n"
read u
case $u in
1)
UG
;;
2)
UM
;;
3)
UD
;;
4)
main
;;
*)
echo "ERROR"
;;
esac
}

#********************************Funkcion from group***************************
#******************************************************************************
GG()
{
echo -e "1.Castom   2.Default  3.Back"
read gg
case gg in
1)
echo -e "Enter name group \n"
read name
if grep -iE $name /etc/group ; then
echo "NO"
clear
GG
fi
echo -e "GID \n"
read gid
if grep ":x:[0-9]+:$gid:" /etc/group ; then
echo "NO"
clear
GG
fi
groupadd -g $gid $name
;;
2)
echo -e "Enter name group \n"
read name
if grep $name /etc/group ; then
echo "NO"
else
groupadd $name
fi
;;
3)
GROUP
;;
esac
}

GM()
{
echo "`cat /etc/group`"
echo -e "Select group \n"
read z
echo -e "1.Name 2.GID 3.Back"
read x
case $x in
1)
echo -e "(New)Name - "
read newname
groupmod $z -n $newname 
;;
2)
echo -e "(New)GID - "
read newgid
groupmod $z -g $newname
;;
esac
}

GD()
{
echo "`cat /etc/group`"
echo -e "Select group \n"
read z
echo -e "Are you sure you want to delete the group ?"
echo -e "1 -> YES"
echo -e "2 -> NO"
read x
case $x in
1)
groupdel $z
;;
2)
GROUP
;;
esac
}
GROUP()
{
echo -e " $GREEN 1.Great $END 2.Modifycation $RED 3.Delete $END 4.Back\n"
read g
case $g in
1)
GG
;;
2)
GM
;;
3)
GD
;;
4)
main
;;
*)
echo "ERROR"
;;
esac
}
#********************************Funkcion from show****************************
#******************************************************************************
SHOW()
{
echo -e "$EREEN 1.USERS $END 2.GROUPS $END\n"
read s

case $s in
1)
echo "`cut -f1 /etc/passwd`"
;;
2)
echo "`cut -f1 /etc/group`"
;;
esac
}

#********************************MAIN******************************************
main()
{
echo -e " $RED -----------USER MANAGER---------$END\n"
echo -e " $GREEN ___1.USERS-----------2.GROUPS---$END\n"
echo -e " $GREEN --------3.SHOW---4.EXIT---------$END\n"
read x
case $x in
1)
USER
;;
2)
GROUP
;;
3)
SHOW
;;
4)
exit 0
;;
*)
echo "ERROR"
;;
esac
sleep 3
}
main
