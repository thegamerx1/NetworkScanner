rootcheck () {
	if [ $(id -u) != "0" ]
	then
		sudo "$0" "$@"
		exit $?
	fi
}
rootcheck "${@}"
let pwd = $PWD
cd "$( dirname -- "$0" )"
echo Installing nmap
apt-get install nmap -y
echo Adding cronjob
(crontab -l ; echo "*/5 * * * * $PWD/Scanner/scan.sh") | crontab -
cd $pwd