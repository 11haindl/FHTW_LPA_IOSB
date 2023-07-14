# FHTW_LPA_IOSB - iOS Basics

This is a repository with solutions to the course "iOS Basics" (LPA) at FH Technnikum Wien.
To pass this course we had to code a final project.

## Final Project

Erstellen Sie eine App zur Darstellung von POIs (basierend auf Open Government Data Vienna) auf einer Karte. Wählen Sie selber aus, welche Daten Sie anzeigen möchten (z.B. Öffi-Haltestellen, Taxistände, Elektroladestationen, etc.) und sprechen Sie sich mit Ihren KollegInnen ab, damit Sie alle unterschiedliche Daten verwenden. Die App sollte mit einem Ausschnitt in Wien starten. Die eigene Position muss nicht unbedingt angezeigt werden.

### Hinweise/Anmerkungen

- Die abgefragten Daten müssen als JSON-File formatiert sein

- Es reicht jeweils die Darstellung einer Koordinate (auch wenn mehrere Koordinaten bzw. ganze Flächen im JSON verfügbar wären).

- Die Struktur des JSON-Files ist anders als beim Beispiel im Unterricht. Daher muss sowohl das Auslesen, als auch das Abspeichern (Model) entsprechend angepasst werden.

- Die Daten sollen automatisch beim Start geholt werden und ein “Refresh” soll mittels Button möglich sein

- ~~Ein Wechsel zwischen Darstellungsarten der Karte (Satellit, Hybrid,...) soll möglich sein. Die gewählte Einstellung soll dabei persistent gespeichert werden.~~

- Ein Wechsel der Darstellungsarten ist momentan mit SwiftUI noch etwas komplizierter abzubilden. Daher kann dies weggelassen werden. Alternativ soll irgendetwas anderes persistent gespeichert werden.
Zum Beispiel kann durch einen Klick auf eine Annotation dessen Position gespeichert werden und beim nächsten Appstart beginnt die Karte mit dieser Annotation als zentralen Punkt der Karte. Sie können sich aber gerne auch etwas anderes überlegen.

### Punktezusammensetzung

- Basisfunktionalität (30 Punkte)

- Anzeige von Zusatzinformationen in der Bubble über der Annotation (eigene Annotation Klasse) (5 Punkte)

- Unterschiedliche Farben der Annotations, abhängig z.B. von der Anzahl der Stellplätze, Verfügbarkeit, etc. (5 Punkte)

- ~~Button mit der Funktion zum Umschalten der Kartenansicht (Karte oder Satellit), wobei die zuletzt gewählte Einstellung auch persistent gespeichert werden soll (5 Punkte)~~

- Persistente Speicherung einer Karteneinstellung (oder Position) Ihrer Wahl. Sofern nicht auf einen Blick ersichtlich, bitte im Code als Kommentar angeben, was gespeichert (und geladen) wird. (15 Punkte)

- Keine Errors, Crashes, etc. (5 Punkte)
