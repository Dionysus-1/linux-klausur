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

# Lege die Benutzer selin und malte mit Home-Verzeichnis an. Lege den Benutzer amir ohne Home-Verzeichnis an.
# Lege die Gruppen empfang und hotel an.
# Nimm selin, malte und amir in die Gruppe hotel auf. Nimm selin und amir zusätzlich in die Gruppe empfang auf. Nimm malte zusätzlich in die Gruppe sudo auf.
# Lege diese Ordner an:
# im Home von malte: Verwaltung, Verwaltung/Konten und Berichte. Besitzer malte, Gruppe hotel.
# im Home von selin: Buchungen und Tresor. Besitzer selin, Gruppe empfang.
# /srv/fundsachen. Besitzer amir, Gruppe empfang, Rechte 750.
# Hole die Passwörter mit git clone aus diesem Repo: https://linux.185-170-112-184.sslip.io/pruefung/lindenhof.git. Danach liegen die Dateien selin.txt, malte.txt und amir.txt in /home/malte/Verwaltung/Konten. Sie gehören malte.
# Gib jedem Benutzer das Passwort aus seiner Datei. In jeder Datei steht eine Zeile in der Form name:passwort.

# -------------------------------------------------------------------------

# 3 Alias, Variable und versteckte Datei
echo "Abschnitt 3 Alias, Variable und versteckte Datei"
sleep 2

# Gib selin den dauerhaften Alias zustand. Er zeigt erst den Platz auf der Festplatte und dann den Arbeitsspeicher.
# Gib selin die dauerhafte Umgebungsvariable STANDORT mit dem Wert Bremen Mitte.
# Lege im Home von malte die versteckte Datei .lindenhof an. Sie gehört malte.

# -------------------------------------------------------------------------

# 4 Cronjobs
echo "Abschnitt 4 Cronjobs"
sleep 2

# Cronjob für selin: Montag bis Freitag um 18:30 kopiert er den Ordner /home/selin/Buchungen nach /home/selin/Tresor.
# Cronjob für malte: Jeden Tag um 08:00 und um 20:00 hängt er das aktuelle Datum an die Datei /home/malte/Berichte/rundgang.log an. Alte Einträge bleiben stehen.
# Cronjob für amir: Am 1. jedes Monats um 03:00 löscht er den Inhalt von /srv/fundsachen.

# -------------------------------------------------------------------------

# 5 Abschluss
echo "Abschnitt 5: Abschluss"
sleep 2

# Zähle 3 Sekunden herunter. Starte danach den Rechner neu.