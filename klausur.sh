# 1 Erstkonfiguration

echo "Abschnitt 1 Erstkonfiguration"
sleep 2

# Aktualisiere die Paketlisten.
apt update
# Aktualisiere alle installierten Pakete. Ohne Rückfrage.
apt upgrade -y
# Installiere figlet und cowsay. Ohne Rückfrage.
apt install figlet cowsay -y

# -------------------------------------------------------------------------

# 2 Benutzer und Dateisystem
echo "Abschnitt 2 Benutzer und Dateisystem"
sleep 2

# Lege die Benutzer selin und malte mit Home-Verzeichnis an.
 
# Lege den Benutzer amir ohne Home-Verzeichnis an.
useradd -m -s /bin/bash selin
useradd -m -s /bin/bash malte
useradd -M -s /bin/bash amir

# Lege die Gruppen empfang und hotel an.
groupadd empfang
groupadd hotel

# Nimm selin, malte und amir in die Gruppe hotel auf. 
usermod -aG hotel selin
usermod -aG hotel malte
usermod -aG hotel amir
# Nimm selin und amir zusätzlich in die Gruppe empfang auf. 
usermod -aG empfang selin
usermod -aG empfang amir
# Nimm malte zusätzlich in die Gruppe sudo auf.
usermod -aG sudo malte

# Lege diese Ordner an:
	# im Home von malte: 
		# Verwaltung, Verwaltung/Konten und Berichte. 
mkdir -p /home/malte/Verwaltung
mkdir -p /home/malte/Verwaltung/Konten
mkdir -p /home/malte/Berichte
		# Besitzer malte, Gruppe hotel.
chown malte:hotel /home/malte/Verwaltung
chown malte:hotel /home/malte/Verwaltung/Konten
chown malte:hotel /home/malte/Berichte

# im Home von selin: 
	# Buchungen und Tresor.
mkdir -p /home/selin/Buchungen
mkdir -p /home/selin/Tresor
	# Besitzer selin, Gruppe empfang.
chown selin:empfang /home/selin/Buchungen
chown selin:empfang /home/selin/Tresor

# /srv/fundsachen.
mkdir -p /srv/fundsachen
	#Besitzer amir, Gruppe empfang,
chown amir:empfang /srv/fundsachen
	#Rechte 750.
chmod 750 /srv/fundsachen

# Hole die Passwörter mit git clone aus diesem Repo: https://linux.185-170-112-184.sslip.io/pruefung/lindenhof.git. 
	#Danach liegen die Dateien selin.txt, malte.txt und amir.txt in /home/malte/Verwaltung/Konten.
git clone https://linux.185-170-112-184.sslip.io/pruefung/lindenhof.git /home/malte/Verwaltung/Konten
	#Sie gehören malte.
chown -R malte /home/malte/Verwaltung/Konten

# Gib jedem Benutzer das Passwort aus seiner Datei. In jeder Datei steht eine Zeile in der Form name:passwort.
chpasswd < /home/malte/Verwaltung/Konten/malte.txt
chpasswd < /home/malte/Verwaltung/Konten/amir.txt
chpasswd < /home/malte/Verwaltung/Konten/selin.txt

# -------------------------------------------------------------------------

# 3 Alias, Variable und versteckte Datei
echo "Abschnitt 3 Alias, Variable und versteckte Datei"
sleep 2

# Gib selin den dauerhaften Alias zustand. 
# Er zeigt erst den Platz auf der Festplatte und dann den Arbeitsspeicher.
echo "alias zustand='df -h && free -h'" >> /home/selin/.bashrc
# Gib selin die dauerhafte Umgebungsvariable STANDORT mit dem Wert Bremen Mitte.
echo "export STANDORT='Bremen Mitte'" >> /home/selin/.bashrc
# Lege im Home von malte die versteckte Datei .lindenhof an. Sie gehört malte.
touch /home/malte/.lindenhof
chown malte /home/malte/.lindenhof

# -------------------------------------------------------------------------

# 4 Cronjobs
echo "Abschnitt 4 Cronjobs"
sleep 2

# Cronjob für selin: 
	# Montag bis Freitag um 18:30 kopiert er den Ordner /home/selin/Buchungen nach /home/selin/Tresor.
echo "30 18 * * 1-5 cp -r /home/selin/Buchungen /home/selin/Tresor" > job_selin.txt
crontab -u selin job_selin.txt


# Cronjob für malte: 
	# Jeden Tag um 08:00 und um 20:00 
	# hängt er das aktuelle Datum an die Datei /home/malte/Berichte/rundgang.log an. 
	# Alte Einträge bleiben stehen.
echo "0 8,20 * * * date >> /home/malte/Berichte/rundgang.log" > job_malte.txt
crontab -u malte job_malte.txt

# Cronjob für amir: 
	# Am 1. jedes Monats um 03:00 löscht er den Inhalt von /srv/fundsachen.
echo "0 3 1 * * rm -rf /srv/fundsachen/*" > job_amir.txt
crontab -u amir job_amir.txt

# -------------------------------------------------------------------------

# 5 Abschluss
echo "Abschnitt 5: Abschluss"
sleep 2

# Zähle 3 Sekunden herunter. Starte danach den Rechner neu.
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1

#reboot


# -------------------------------------------------------------------------
